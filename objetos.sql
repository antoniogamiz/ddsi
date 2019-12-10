USE ddsi;

-- Elena
INSERT INTO PuestoTrabajo VALUES ("camarero" , 800, 45, "horario1");
INSERT INTO PuestoTrabajo VALUES ("chef" , 900, 45, "horario1");
INSERT INTO PuestoTrabajo VALUES ("repartidor", 800, 45 , "horario1");
INSERT INTO PuestoTrabajo VALUES ("encargado", 1000, 40 , "horario1");

INSERT INTO Empleado VALUES ("12345678A" , "Antonio Molina", 1050, "encargado");
INSERT INTO Empleado VALUES ("87654321B" , "Francisca Garcia", 950, "chef");
INSERT INTO Empleado VALUES ("13572468C", "Pancho Gamuzo" , 806, "camarero");
INSERT INTO Empleado VALUES ("24681357D"  , "Pepe Motillos" , 825, "repartidor");


-- Antonio
INSERT INTO Producto VALUES ("tomate" , 100, '2020/12/27', "mercadona", 200 );
INSERT INTO Producto VALUES ("pepino" , 100, '2020/11/17', "lidl"     , 100 );
INSERT INTO Producto VALUES ("cebolla", 50 , '2020/10/05', "carrefour", 200 );
INSERT INTO Producto VALUES ("queso"  , 10 , '2020/09/03', "coviran"  , 50  );
INSERT INTO Producto VALUES ("carne"  , 1  , '2020/12/01',
"mercadona", 50  );
INSERT INTO Producto VALUES ("pan"    , 5  , '2020/12/01',
"mercadona", 50  );
INSERT INTO Producto VALUES ("arroz"    , 5  , '2020/12/01',
"mercadona", 50  );


-- Laura

INSERT INTO Plato VALUES ( "hamburguesa" , 12 , "carne" );
INSERT INTO Plato VALUES ( "risotto"	 , 14 , "arroz" );

INSERT INTO Ingrediente VALUES ( "tomate"  , "hamburguesa");
INSERT INTO Ingrediente VALUES ( "cebolla" , "hamburguesa");
INSERT INTO Ingrediente VALUES ( "queso"   , "hamburguesa");
INSERT INTO Ingrediente VALUES ( "queso"   , "risotto");

