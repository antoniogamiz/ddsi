DROP DATABASE IF EXISTS ddsi;

CREATE DATABASE ddsi;

USE ddsi;

DROP TABLE IF EXISTS PuestoTrabajo;

DROP TABLE IF EXISTS Empleado;

DROP TABLE IF EXISTS Producto;

DROP TABLE IF EXISTS Reserva;

DROP TABLE IF EXISTS Cuenta;

DROP TABLE IF EXISTS Cliente;

DROP TABLE IF EXISTS Socio;

DROP TABLE IF EXISTS Plato;

DROP TABLE IF EXISTS Menu;

DROP TABLE IF EXISTS Ingrediente;

DROP TABLE IF EXISTS Contiene;

DROP TABLE IF EXISTS Compuesto;

-- Elena
create table PuestoTrabajo (
  nombre VARCHAR(60),
  sueldo INT,
  horasMaximasSemana INT,
  horariosTrabajo VARCHAR(300),
  PRIMARY KEY (nombre)
);

create table Empleado (
  DNI VARCHAR(9),
  nombre VARCHAR(60) NOT NULL,
  nomina INT,
  puestoTrabajo VARCHAR(60) NOT NULL,
  FOREIGN KEY (puestoTrabajo) REFERENCES PuestoTrabajo(nombre),
  PRIMARY KEY (DNI)
);

-- Antonio
create table Producto (
  nombre VARCHAR(20),
  stock INT,
  fechaCaducidad DATE,
  nombreDistribuidor VARCHAR(20),
  limiteAlmacenamiento INT,
  PRIMARY KEY (nombre)
);

-- Carmen
create table Cuenta (
  idCuenta VARCHAR(15) NOT NULL PRIMARY KEY,
  mesa INT,
  fecha DATE,
  hora TIME
);

create table Cliente (
  DNI VARCHAR(9) NOT NULL PRIMARY KEY,
  nombre VARCHAR(20),
  idCuenta VARCHAR(15) NOT NULL,
  FOREIGN KEY (idCuenta) REFERENCES Cuenta (idCuenta)
);

create table Reserva (
  idReserva VARCHAR(25) PRIMARY KEY,
  nombre VARCHAR(20),
  fecha DATE,
  hora TIME,
  DNI VARCHAR(9) NOT NULL,
  FOREIGN KEY (DNI) REFERENCES Cliente(DNI)
);

create table Socio (
  numSocio INT,
  telefono INT,
  puntos INT,
  DNI VARCHAR(9) NOT NULL,
  FOREIGN KEY (DNI) REFERENCES Cliente(DNI)
);

-- Laura
create table Plato (
  nombrePlato VARCHAR(30) PRIMARY KEY,
  precio DEC(10, 2)
);


create table Menu (
  nombreMenu VARCHAR(30) PRIMARY KEY,
  precio DEC(10, 2),
  categoria VARCHAR(30)
);


create table Contiene (
  nombreMenu VARCHAR(8),
  idCuenta VARCHAR(15),
  FOREIGN KEY (nombreMenu) REFERENCES Menu(nombreMenu),
  FOREIGN KEY (idCuenta) REFERENCES Cliente(idCuenta),
  PRIMARY KEY (nombreMenu,idCuenta)
);

create table Ingrediente (
  nombre VARCHAR(20),
  nombrePlato VARCHAR(30),
  FOREIGN KEY (nombre) REFERENCES Producto(nombre) ON UPDATE CASCADE,
  FOREIGN KEY (nombrePlato) REFERENCES Plato(nombrePlato) ON UPDATE CASCADE,
  PRIMARY KEY (nombre,nombrePlato)
);

create table Compuesto (
  nombreMenu VARCHAR(8),
  nombrePlato VARCHAR(8),
  FOREIGN KEY (nombreMenu) REFERENCES Menu (nombreMenu),
  FOREIGN KEY (nombrePlato) REFERENCES Plato(nombrePlato),
  PRIMARY KEY (nombreMenu,nombrePlato),
  orden INT
);
