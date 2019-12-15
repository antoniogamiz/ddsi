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

INSERT INTO Plato VALUES ( "hamburguesa" , 12);
INSERT INTO Plato VALUES ( "risotto"	 , 14);

INSERT INTO Ingrediente VALUES ( "tomate"  , "hamburguesa");
INSERT INTO Ingrediente VALUES ( "cebolla" , "hamburguesa");
INSERT INTO Ingrediente VALUES ( "queso"   , "hamburguesa");
INSERT INTO Ingrediente VALUES ( "queso"   , "risotto");

-- Carmen

INSERT INTO Cuenta VALUES ("20191203081234",8,'2019/12/03','12:34:54');
INSERT INTO Cuenta VALUES ("20191204121544",12,'2019/12/04','15:44:03');
INSERT INTO Cuenta VALUES ("20191206062114",6,'2019/12/06','21:14:32');

INSERT INTO Cliente VALUES ("34563456B","Diego Ruiz","20191203081234");
INSERT INTO Cliente VALUES ("26385476M","Juan García","20191204121544");
INSERT INTO Cliente VALUES ("76589657X","Andrea Ramírez","20191206062114");

INSERT INTO Reserva VALUES ("34563456B20191203","Diego Ruiz",'2019/12/03','12:34:54',"34563456B");
INSERT INTO Reserva VALUES ("26385476M20191204","Juan García",'2019/12/04','15:44:03',"26385476M");
INSERT INTO Reserva VALUES ("76589657X20191206","Andrea Ramírez",'2019/12/06','21:14:32',"76589657X");

DELIMITER |
CREATE TRIGGER unica_reserva BEFORE INSERT ON Reserva
  FOR EACH ROW
  BEGIN
    IF EXISTS (SELECT * FROM Reserva as reserva WHERE (reserva.DNI = NEW.DNI AND reserva.fecha=NEW.fecha AND reserva.hora=NEW.hora)) THEN
		signal sqlstate '45000' SET message_text = 'Ya hay una reserva a la misma hora y día';
    END IF;
  END |
DELIMITER ;

INSERT INTO Reserva VALUES ("34563456B20191204","Diego Ruiz",'2019/12/03','12:34:54',"34563456B");

