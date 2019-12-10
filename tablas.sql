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
  CONSTRAINT puestoTrabajo FOREIGN KEY (nombre) REFERENCES PuestoTrabajo(nombre),
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
  idReserva VARCHAR(15) PRIMARY KEY,
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
  idPlato VARCHAR(8) PRIMARY KEY,
  precio DEC(10, 2),
  nombre VARCHAR(30),
  producto VARCHAR(20),
  FOREIGN KEY (producto) REFERENCES Producto(nombre)
);

create table Menu (
  idMenu VARCHAR(8) PRIMARY KEY,
  nombre VARCHAR(30),
  precio DEC(10, 2),
  categoria VARCHAR(30),
  idPlato VARCHAR(8),
  FOREIGN KEY (idPlato) REFERENCES Plato(idPlato)
);

create table Contiene (
  idMenu VARCHAR(8),
  idCuenta VARCHAR(15),
  FOREIGN KEY (idMenu) REFERENCES Menu(idMenu),
  FOREIGN KEY (idCuenta) REFERENCES Cliente(idCuenta),
  PRIMARY KEY (idMenu,idCuenta)
);

create table Ingrediente (
  nombre VARCHAR(20),
  idPlato VARCHAR(8),
  FOREIGN KEY (nombre) REFERENCES Producto(nombre),
  FOREIGN KEY (idPlato) REFERENCES Plato(idPlato),
  PRIMARY KEY (nombre,idPlato)
);

create table Compuesto (
  idMenu VARCHAR(8),
  idPlato VARCHAR(8),
  FOREIGN KEY (idMenu) REFERENCES Menu (idMenu),
  FOREIGN KEY (idPlato) REFERENCES Plato(idPlato),
  PRIMARY KEY (idMenu,idPlato),
  orden INT
);
