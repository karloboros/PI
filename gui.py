import tkinter as tk
from tkinter import ttk, VERTICAL, HORIZONTAL, Scrollbar
from ttkwidgets import CheckboxTreeview
from ttkwidgets import Table
import connect

tree = None

def execute_sql():
    sql_query = sql_entry.get("1.0", "end-1c")
    results = connect.execute_query(sql_query)

def get_fact_tables():
    sql_query = "SELECT * FROM tablica WHERE sifTipTablica = 1"
    tables = connect.execute_query(sql_query)
    return tables

def create_radio_buttons():
    fact_tables = get_fact_tables()
    for table in fact_tables:
        table_name = table.nazSQLTablica
        rb = tk.Radiobutton(fact_frame, text=table_name, value=table_name, variable=selected_table, command=on_fact_table_select)
        rb.pack()

def on_fact_table_select():
    selected_fact_table = selected_table.get()
    print("Odabrana činjenična tablica:", selected_fact_table)
    create_checkboxes(selected_fact_table)

def get_measures(selected_fact_table):
    sql_query = f"""
        SELECT *
        FROM tabAtribut
        JOIN tabAtributAgrFun ON tabAtribut.sifTablica = tabAtributAgrFun.sifTablica 
            AND tabAtribut.rbrAtrib = tabAtributAgrFun.rbrAtrib
        JOIN agrFun ON tabAtributAgrFun.sifAgrFun = agrFun.sifAgrFun
        JOIN tablica ON tabAtribut.sifTablica = tablica.sifTablica
        WHERE tablica.nazSQLTablica = '{selected_fact_table}'
            AND tabAtribut.sifTipAtrib = 1
        ORDER BY tabAtribut.rbrAtrib;
    """
    measures = connect.execute_query(sql_query)
    return measures

def get_dimensions(selected_fact_table):
    sql_query = f"""
        SELECT *
                    FROM tabAtribut
                    JOIN dimCinj ON tabAtribut.sifTablica = dimCinj.sifDimTablica
                    JOIN tablica dimTablica ON dimCinj.sifDimTablica = dimTablica.sifTablica
                    WHERE dimCinj.sifCinjTablica = (SELECT sifTablica FROM tablica WHERE nazSQLTablica = '{selected_fact_table}')
                        AND tabAtribut.sifTipAtrib = 2
                    ORDER BY dimTablica.nazSQLTablica
    """
    measures = connect.execute_query(sql_query)
    return measures

def get_unique_dimensions(selected_fact_table):
    sql_query = f"""
        SELECT DISTINCT dimTablica.nazSQLTablica as nazSqlDimTablica
                    FROM tabAtribut
                    JOIN dimCinj ON tabAtribut.sifTablica = dimCinj.sifDimTablica
                    JOIN tablica dimTablica ON dimCinj.sifDimTablica = dimTablica.sifTablica
                    WHERE dimCinj.sifCinjTablica = (SELECT sifTablica FROM tablica WHERE nazSQLTablica = '{selected_fact_table}')
                        AND tabAtribut.sifTipAtrib = 2
                    ORDER BY dimTablica.nazSQLTablica
    """
    measures = connect.execute_query(sql_query)
    return measures

def get_attributes(selected_fact_table, selected_dimension_table):
    sql_query = f"""
        SELECT DISTINCT dimTablica.nazTablica
             , dimTablica.nazSQLTablica  AS nazSqlDimTablica
             , cinjTablica.nazSQLTablica AS nazSqlCinjTablica
             , dimTabAtribut.imeSqlAtrib AS dimImeAtribut
             , cinjTabAtribut.imeSqlAtrib AS cinjImeAtribut
             , tabAtribut.*
        FROM tabAtribut, dimCinj
             , tablica dimTablica, tablica cinjTablica 
             , tabAtribut cinjTabAtribut, tabAtribut dimTabAtribut
        WHERE dimCinj.sifDimTablica  = dimTablica.sifTablica
          AND dimCinj.sifCinjTablica = cinjTablica.sifTablica
          
          AND dimCinj.sifCinjTablica = cinjTabAtribut.sifTablica
          AND dimCinj.rbrCinj = cinjTabAtribut.rbrAtrib
          
          AND dimCinj.sifDimTablica = dimTabAtribut.sifTablica
          AND dimCinj.rbrDim = dimTabAtribut.rbrAtrib

          AND tabAtribut.sifTablica  = dimCinj.sifDimTablica
          AND sifCinjTablica = (SELECT sifTablica FROM tablica WHERE nazSQLTablica = '{selected_fact_table}')
          AND dimTablica.nazSQLTablica = '{selected_dimension_table}'
          AND tabAtribut.sifTipAtrib = 2
        ORDER BY dimTablica.nazTablica, rbrAtrib
    """
    #         , cinjTabAtribut.imeSQLAtrib # to sam uklonio iz upita da ne budu dupli
    
    att = connect.execute_query(sql_query)
    return att
 
def create_checkboxes(selected):
    global tree
    for widget in tree_frame.winfo_children():
        widget.destroy()
    measures = get_measures(selected)
    dimensions = get_unique_dimensions(selected)

    tree = CheckboxTreeview(tree_frame)
    tree.pack(fill="both", expand=True)

    parent_node1 = tree.insert("", "end", text="Mjere", open=True)
    for measure in measures:
        measure_name = measure.imeSQLAtrib.rstrip() + " (" + measure.nazAgrFun.rstrip() + ")"
        tree.insert(parent_node1, "end", text=measure_name, values=(measure_name,))

    parent_node2 = tree.insert("", "end", text="Dimenzije", open=True)
    for dimension in dimensions:
        dimension_name = dimension.nazSqlDimTablica.rstrip()
        attributes = get_attributes(selected, dimension_name)
        child_node = tree.insert(parent_node2, "end", text=dimension_name, open=False)
        for attribute in attributes:
            attribute_name = attribute.imeSQLAtrib.rstrip()
            tree.insert(child_node, "end", text=attribute_name, values=(attribute_name,))

def generate_sql():  
    """
    selected_measures = []
    selected_attributes = []
    print(tree.selection())
    for item_id in tree.selection():
        item_text = tree.item(item_id, "text")
        item_values = tree.item(item_id, "values")
        if item_values:
            selected_attributes.append(item_values[0])
        else:
            selected_measures.append(item_text)
    print("Odabrane mjere:", selected_measures)
    print("Odabrani atributi:", selected_attributes)
    """
    selected = selected_table.get()
    if selected:
        measures = get_measures(selected)
        dimensions = get_dimensions(selected)
        sql_query = ""
        sql_query = add_select(sql_query, selected, measures, dimensions)
        sql_query = add_from(sql_query, selected, measures, dimensions)
        sql_query = add_where(sql_query, selected, measures, dimensions)
        sql_query = add_groupby(sql_query, selected, measures, dimensions)
    else:
        sql_query = ""
    sql_entry.delete(1.0, tk.END)
    sql_entry.insert(tk.END, sql_query)

# potencijalno maknuti as dio
def add_select(sql_query, selected, measures, dimensions):
    sql_query += "SELECT "
    for m in measures[:-1]:
        sql_query += m.nazAgrFun.rstrip() + "(" + m.nazSQLTablica.rstrip() + "."+ m.imeSQLAtrib.rstrip() + ") AS '" + m.imeAtrib.rstrip() + "',\n     "
    sql_query += measures[-1].nazAgrFun.rstrip() + "(" + measures[-1].nazSQLTablica.rstrip() + "."+ measures[-1].imeSQLAtrib.rstrip() + ") AS '" + measures[-1].imeAtrib.rstrip() + "'"

    for dim in dimensions:
        dimension_name = dim.nazSqlDimTablica
        attributes = get_attributes(selected, dimension_name)
        for att in attributes[:-1]:
            sql_query += ",\n     " + att.nazSqlDimTablica.rstrip() + "." + att.imeSQLAtrib.rstrip() + " AS '" + att.cinjImeAtribut.rstrip() + " " + att.imeAtrib.rstrip() + "'"
    return sql_query

def add_from(sql_query, selected, measures, dimensions):
    sql_query = sql_query.rstrip()
    sql_query += "\nFROM "
    sql_query += selected.rstrip()
    dimensions = get_unique_dimensions(selected)
    for dim in dimensions:
        sql_query += ", "
        sql_query += dim.nazSqlDimTablica.rstrip()
    return sql_query

def add_where(sql_query, selected, measures, dimensions):
    sql_query += "\nWHERE "
    sql_query += dimensions[0].nazSqlCinjTablica.rstrip() + "." + dimensions[0].kljucCinjTablica.rstrip() + " = " + dimensions[0].nazSqlDimTablica.rstrip() + "." + dimensions[0].kljucDimTablica.rstrip()
    for dim in dimensions[1:]:
        sql_query += "\n     AND " + dim.nazSqlCinjTablica.rstrip() + "." + dim.kljucCinjTablica.rstrip() + " = " + dim.nazSqlDimTablica.rstrip() + "." + dim.kljucDimTablica.rstrip()
    return sql_query

def add_groupby(sql_query, selected, measures, dimensions):
    sql_query += "\nGROUP BY "
    br = 1
    first_time = 1
    for dim in dimensions:
        attributes = get_attributes(selected, dim.nazSqlDimTablica)
        for att in attributes:
            if first_time:
                sql_query += att.nazSqlDimTablica.rstrip() + "." + att.imeSQLAtrib.rstrip()
                first_time = 0
                br += 1
            else:
                if (br%4) == 0:
                    sql_query += "\n     "
                sql_query += ", " + att.nazSqlDimTablica.rstrip() + "." + att.imeSQLAtrib.rstrip()
                br += 1
    return sql_query

def make_table():
    sql_query = sql_entry.get("1.0", "end-1c")
    cursor = connect.connection.cursor()
    cursor.execute(sql_query)
    results = cursor.fetchall()

    gridview.delete(*gridview.get_children())
    if results:
        column_names = [description[0] for description in cursor.description]
        gridview["columns"] = column_names
        for col in column_names:
            gridview.heading(col, text=col)
        for i, row in enumerate(results):
            gridview.insert("", "end", iid=i, values=list(row))    
    root.update_idletasks()
    root.update()

# glavni prozor
root = tk.Tk()
root.title("GUI Klijent")

selected_table = tk.StringVar()
root.state('zoomed')

# gore lijevo
fact_frame = tk.Frame(root, bd=2, relief="groove")
fact_frame.grid(row=0, column=0, sticky="nsew")

fact_label = tk.Label(fact_frame, text="Izbornik činjeničnih tablica")
fact_label.pack()

create_radio_buttons()

# dolje lijevo
tree_frame = tk.Frame(root, bd=2, relief="groove")
tree_frame.grid(row=1, column=0, sticky="nsew")

tree_label = tk.Label(tree_frame, text="Stablo mjera i dimenzija")
tree_label.pack()

on_fact_table_select()

# gore desno
sql_frame = tk.Frame(root, bd=2, relief="groove")
sql_frame.grid(row=0, column=1, sticky="nsew")

write_button = tk.Button(sql_frame, text="Generiraj SQL upit", command=generate_sql)
write_button.pack()

sql_entry = tk.Text(sql_frame, height=15, width=100)
sql_entry.pack()

execute_button = tk.Button(sql_frame, text="Izvedi SQL upit", command=make_table)
execute_button.pack()

# dolje desno
result_frame = tk.Frame(root, bd=2, relief="groove")
result_frame.grid(row=1, column=1, sticky="nsew")

result_label = tk.Label(result_frame, text="Rezultat SQL upita:")
result_label.pack()

gridview = Table(result_frame)
vsb = Scrollbar(result_frame, orient=VERTICAL, command=gridview.yview)
gridview.configure(yscrollcommand=vsb.set)
vsb.pack(side='right', fill='y')
hsb = Scrollbar(result_frame, orient=HORIZONTAL, command=gridview.xview)
gridview.configure(xscrollcommand=hsb.set)
hsb.pack(side='bottom', fill='x')
gridview.pack(side = "left",fill="both", expand=False)

root.grid_rowconfigure(0, weight=0)
root.grid_rowconfigure(1, weight=1)
root.grid_columnconfigure(0, weight=0)
root.grid_columnconfigure(1, weight=1)

root.mainloop()
