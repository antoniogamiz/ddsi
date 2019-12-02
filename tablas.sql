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

create table PuestoTrabajo
(
  nombre VARCHAR(60) PRIMARY KEY,
  sueldo INT,
  horasMaximas INT,
  horariosTrabajo VARCHAR(300),
);

create table Empleado
(
  DNI VARCHAR(9) PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL,
  nomina INT,
  CONSTRAINT puestoTrabajo FOREIGN KEY (nombre) REFERENCES PuestoTrabajo(nombre)
);

-- Antonio

create table Producto
(
  nombre VARCHAR(20) PRIMARY KEY,
  stock INT,
  fechaCaducidad DATE,
  nombreDistribuidor VARCHAR(20),
  limiteAlmacenamiento INT
);

-- Carmen

create table Reserva
(
  idReserva VARCHAR(15) PRIMARY KEY,
  FOREIGN KEY (DNI) REFERENCES Cliente(DNI),
  nombre VARCHAR(20),
  fecha DATE,
  hora TIME
);

create table Cuenta
(
  idCuenta VARCHAR(15) PRIMARY KEY,
  mesa INT,
  fecha DATE,
  hora TIME
);

create table Cliente
(
  DNI VARCHAR(9) PRIMARY KEY,
  nombre VARCHAR(20),
  FOREIGN KEY (idCuenta) REFERENCES Cuenta(idCuenta),
  FOREIGN KEY (idReserva) REFERENCES Cliente(idReserva)
);

create table Socio
(
  FOREIGN KEY (DNI) REFERENCES Cliente(DNI),
  numSocio INT,
  telefono INT,
  puntos INT
);

-- Laura

create table Plato
(
  idPlato VARCHAR(8) PRIMARY KEY,
  CONSTRAINT producto FOREIGN KEY (nombre) REFERENCES Producto(nombre),
  precio DEC(10,2),
  nombre VARCHAR(30)
);

create table Menu
(
  idMenu VARCHAR(8) PRIMARY KEY,
  nombre VARCHAR(30),
  precio DEC(10,2),
  categoria VARCHAR(30),
  CONSTRAINT plato FOREIGN KEY (identificador) REFERENCES Plato(identificador)
);

create table Contiene
(
  FOREIGN KEY (idMenu) REFERENCES Menu(idMenu),
  FOREIGN KEY (idCuenta) REFERENCES Cliente(idCuenta)
);

create table Ingrediente
(
  FOREIGN KEY (nombre) REFERENCES Producto(nombre),
  FOREIGN KEY (idPlato) REFERENCES Plato(idPlato)
);

create table Compuesto
(
  FOREIGN KEY (idMenu) REFERENCES Menu (idMenu),
  FOREIGN KEY (idPlato) REFERENCES Plato(idPlato),
  orden INT
);
