Ovdje objašnjavam kako sam pretvorio relacijsku bazu podataka "Northwind" u zvjezdasti model koji bi se koristio u skladištu podataka.
Prvo sam složio sliku koja je priložena u dokumentima te sam na temelju nje izradio bazu.
Odlučio sam se za dvije glave, tj. dvije činjenične tablice, dok su ostale bile dimenzijske. City, Categories i Suppliers sam pridodao tablicama na koje su se nadovezivale kako ne bih dobio pahuljasti model.

Postoje dvije datoteke, DZ2_create u kojoj sam stvorio potrebne tablice i viewove, te DZ2_insert iz koje sam koristio danu bazu i napunio svoju podacima.
Dimenzijske tablice su sljedeće - dProducts, dCustomers, dShippers, dEmployees, dShipments. Promjena u odnosu na relacijsku bazu je ta da sam dodao Shipments kako bi pojednostavio činjeničnu tablicu, te sam uklonio City, Categories i Suppliers kako sam već i naveo.
Činjenične tablice su - cOrders i cOrderItems. U njih sam još dodatno ubacio i mjere kao što je recimo Total.
Činjenične i dimenzijske tablice povezane su pomoću stranih ključeva što se može vidjeti u DZ2_create.

Prijenos podataka sam ostvario korištenjem SQL upita (datoteka DZ2_insert). Prvo sam punio dimenzijske tablice pomoću stare baze, a zatim i činjenične gdje sam koristio kombinaciju dimenzijskih tablica i stare relacijske tablice.