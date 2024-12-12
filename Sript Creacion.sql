CREATE DATABASE VentasDB
GO

USE VentasDB
GO

CREATE SCHEMA Cliente
GO

CREATE SCHEMA Pedido
GO

CREATE TABLE Cliente.Colonia (
    ID_Colonia INT IDENTITY(1,1) PRIMARY KEY,
    Colonia VARCHAR(100) NOT NULL
)
GO

CREATE TABLE Cliente.Direccion (
    ID_Direccion INT IDENTITY(1,1) PRIMARY KEY,
    Codigo_Postal VARCHAR(10) NOT NULL,
    Calle VARCHAR(100) NOT NULL,
    Numero INT NOT NULL,
    ID_Colonia INT FOREIGN KEY REFERENCES Cliente.Colonia(ID_Colonia)
)
GO

CREATE TABLE Cliente.Cliente (
    ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(25) NOT NULL,
    Apellido_Paterno VARCHAR(25) NOT NULL,
    Apellido_Materno VARCHAR(25) NOT NULL,
    Correo_Electronico VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Genero CHAR(1) CHECK (Genero ='M' OR Genero = 'F'),
    ID_Direccion INT FOREIGN KEY REFERENCES Cliente.Direccion(ID_Direccion)
)
GO

CREATE TABLE Pedido.Categoria (
    ID_Categoria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255)
)
GO

CREATE TABLE Pedido.Marca (
    ID_Marca INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255)
)
GO

CREATE TABLE Pedido.Estado_Actual (
    ID_Estado_Actual INT IDENTITY(1,1) PRIMARY KEY,
    Estado_Actual VARCHAR(50) NOT NULL
)
GO

CREATE TABLE Pedido.Color (
    ID_Color INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Pedido.Producto (
    ID_Producto INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255),
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    ID_Color INT FOREIGN KEY REFERENCES Pedido.Color(ID_Color),
    ID_Categoria INT FOREIGN KEY REFERENCES Pedido.Categoria(ID_Categoria),
    ID_Marca INT FOREIGN KEY REFERENCES Pedido.Marca(ID_Marca)
)
GO

CREATE TABLE Pedido.Pedido (
    ID_Pedido INT IDENTITY(1,1) PRIMARY KEY,
    Fecha_Venta DATE NOT NULL,
    Fecha DATE DEFAULT GETDATE(),
    Monto DECIMAL(10,2) NOT NULL,
    ID_Producto INT FOREIGN KEY REFERENCES Pedido.Producto(ID_Producto),
    ID_Cliente INT FOREIGN KEY REFERENCES Cliente.Cliente(ID_Cliente),
    ID_Estado_Actual INT FOREIGN KEY REFERENCES Pedido.Estado_Actual(ID_Estado_Actual)
)
GO
