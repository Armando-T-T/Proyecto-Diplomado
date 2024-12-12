


USE VentasDB
GO

BEGIN TRAN  --Comienza transacción
	BEGIN TRY  --Comienza try
	INSERT INTO Pedido.Estado_Actual (Estado_Actual)
	VALUES 
		('En proceso'),
		('Entregado'),
		('Pendiente')

	INSERT INTO Pedido.Categoria (Nombre, Descripcion)
	VALUES 
		('Electrónicos', 'Productos electrónicos de consumo'),
		('Ropa', 'Ropa de moda para todas las edades'),
		('Hogar', 'Artículos para el hogar y decoración')

	INSERT INTO Pedido.Marca (Nombre, Descripcion)
	VALUES 
		('Samsung', 'Electrónicos de alta calidad'),
		('Nike', 'Ropa deportiva de prestigio'),
		('IKEA', 'Muebles y accesorios para el hogar')

	INSERT INTO Pedido.Color (Nombre) 
	VALUES 
		('Rojo'),
		('Azul'),
		('Verde')
	INSERT INTO Cliente.Colonia (Colonia)
	VALUES 
		('Centro'),
		('Colonia Norte'),
		('Colonia Sur');

	INSERT INTO Cliente.Direccion (Codigo_Postal, Calle, Numero, ID_Colonia)
	VALUES 
		('12345', 'Calle Principal', 123, 1),
		('54321', 'Avenida Secundaria', 456, 2),
		('98765', 'Calle Larga', 789, 3)

	INSERT INTO Cliente.Cliente (Nombre, Apellido_Paterno, Apellido_Materno, Telefono, Correo_Electronico, Genero, ID_Direccion)
	VALUES 
		('Juan', 'García', 'López', '8274561012', 'garcia_lopez_juan@gmail.com', 'M', 1),
		('María', 'Martínez', 'Hernández', '8456192315', 'martinez_hernandez_maria@hotmail.com', 'F', 2),
		('Pedro', 'Díaz', 'Pérez', '8756319811', 'diaz_perez_pedro@outlook.com', 'M', 3)

	INSERT INTO Pedido.Producto (Nombre, Descripcion, Precio, Stock, ID_Categoria, ID_Marca, ID_Color)
	VALUES 
		('Smartphone Galaxy S20', 'Teléfono inteligente de última generación', 999.99, 50, 1, 1, 1),
		('Playera deportiva', 'Playera de secado rápido para actividades deportivas', 29.99, 100, 2, 2, 2),
		('Sofá KIVIK', 'Sofá cómodo y elegante para la sala de estar', 499.99, 20, 3, 3, 3)

	INSERT INTO Pedido.Pedido (Fecha_Venta, Monto, ID_Producto, ID_Cliente, ID_Estado_Actual)
	VALUES 
		('2024-04-14', 999.99, 1, 1, 1),
		('2024-04-15', 29.99, 2, 2, 2),
		('2024-04-16', 499.99, 3, 3, 3)
COMMIT TRAN 
	END TRY     --Termina try
	BEGIN CATCH
ROLLBACK TRAN	
	END CATCH
