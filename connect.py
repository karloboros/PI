import pyodbc

server = 'DESKTOP-U0LAF1E\SQL2022'
database = 'Northwind_BorosSP'
#database = 'AdvWorks3DZ2023'
connection_string = f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};Trusted_Connection=yes'

def execute_query(sql_query):
    connection = pyodbc.connect(f'DRIVER=SQL Server;SERVER={server};DATABASE={database};Trusted_Connection=yes;')
    cursor = connection.cursor()
    cursor.execute(sql_query)
    results = cursor.fetchall()
    connection.close()
    return results

try:
    connection = pyodbc.connect(connection_string)
    print("Uspjesno povezivanje s bazom!")
except Exception as e:
    print("Greška pri povezivanju s bazom podataka:", e)
