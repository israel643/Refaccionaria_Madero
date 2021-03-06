USE [master]
GO
/****** Object:  Database [Refaccionaria]    Script Date: 23/03/2021 11:00:47 p. m. ******/
CREATE DATABASE [Refaccionaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Refaccionaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Refaccionaria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Refaccionaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Refaccionaria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Refaccionaria] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Refaccionaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Refaccionaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Refaccionaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Refaccionaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Refaccionaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Refaccionaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Refaccionaria] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Refaccionaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Refaccionaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Refaccionaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Refaccionaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Refaccionaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Refaccionaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Refaccionaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Refaccionaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Refaccionaria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Refaccionaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Refaccionaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Refaccionaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Refaccionaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Refaccionaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Refaccionaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Refaccionaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Refaccionaria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Refaccionaria] SET  MULTI_USER 
GO
ALTER DATABASE [Refaccionaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Refaccionaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Refaccionaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Refaccionaria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Refaccionaria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Refaccionaria] SET QUERY_STORE = OFF
GO
USE [Refaccionaria]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 23/03/2021 11:00:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[No_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_categoria] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[No_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 23/03/2021 11:00:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[No_cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_cli] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](10) NULL,
	[Email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[No_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 23/03/2021 11:00:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[No_empleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_emple] [varchar](50) NULL,
	[Apellido_P] [varchar](20) NULL,
	[Apellido_M] [varchar](20) NULL,
	[Usuario] [varchar](20) NULL,
	[Contraseña] [varchar](10) NULL,
	[profile] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[No_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 23/03/2021 11:00:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[No_pedido] [int] IDENTITY(1,1) NOT NULL,
	[No_producto] [int] NULL,
	[No_vent] [int] NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[No_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 23/03/2021 11:00:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[No_producto] [int] IDENTITY(1,1) NOT NULL,
	[No_Categoria] [int] NULL,
	[Nombre_prod] [varchar](50) NULL,
	[Precio_venta] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[Descripcion] [varchar](100) NULL,
	[Img] [varchar](50) NULL,
	[Precio_compra] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[No_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provedores]    Script Date: 23/03/2021 11:00:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provedores](
	[No_provedor] [int] IDENTITY(1,1) NOT NULL,
	[Razon_social] [varchar](100) NOT NULL,
	[Direccion] [varchar](150) NOT NULL,
	[Telefono] [varchar](13) NULL,
	[Logo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[No_provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salidas]    Script Date: 23/03/2021 11:00:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salidas](
	[No_salida] [int] IDENTITY(1,1) NOT NULL,
	[No_provedor] [int] NULL,
	[No_producto] [int] NULL,
	[Precio_compra] [decimal](10, 2) NULL,
	[Unidades] [int] NULL,
	[Total] [decimal](10, 2) NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[No_salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 23/03/2021 11:00:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[No_venta] [int] IDENTITY(1,1) NOT NULL,
	[No_cliente] [int] NULL,
	[No_empleado] [int] NULL,
	[Fecha] [date] NULL,
	[Total] [decimal](10, 2) NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[No_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([No_Categoria], [Nombre_categoria]) VALUES (1, N'Accesorios')
INSERT [dbo].[Categoria] ([No_Categoria], [Nombre_categoria]) VALUES (2, N'Herramientas')
INSERT [dbo].[Categoria] ([No_Categoria], [Nombre_categoria]) VALUES (3, N'Sistema Electrico')
INSERT [dbo].[Categoria] ([No_Categoria], [Nombre_categoria]) VALUES (4, N'Quimicos')
INSERT [dbo].[Categoria] ([No_Categoria], [Nombre_categoria]) VALUES (5, N'Souvenirs')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([No_cliente], [Nombre_cli], [Direccion], [Telefono], [Email]) VALUES (1, N'Cesar Aranda', N'Privada 16 B Sur 145, Granjas de San Isidro, 72587 Puebla, Pue.', N'2211232559', N'cesaranda87@gmail.com')
INSERT [dbo].[Cliente] ([No_cliente], [Nombre_cli], [Direccion], [Telefono], [Email]) VALUES (2, N'Materiales Rodimsa', N'Alejandrina 250-260, La Joya, 72573 Puebla, Pue.', N'2226465158', N'materialesrodimsa@hotmail.com')
INSERT [dbo].[Cliente] ([No_cliente], [Nombre_cli], [Direccion], [Telefono], [Email]) VALUES (3, N'Julio Álvarez', N'Prol. 24 Sur No.8730, Fracc Lomas del Valle Puebla, Pue., 72595', N'2641284520', N'yulioalv68@hotmail.com')
INSERT [dbo].[Cliente] ([No_cliente], [Nombre_cli], [Direccion], [Telefono], [Email]) VALUES (4, N'Moises Hernandez', N'Av. Río Alseseca 16, San Francisco Totimehuacan, 72595 Puebla, Pue.', N'2234541315', N'moinandez1@gmail.com')
INSERT [dbo].[Cliente] ([No_cliente], [Nombre_cli], [Direccion], [Telefono], [Email]) VALUES (5, N'Materiales Rodriguez', N'Yodo 9, Minerales de Guadalupe Sur, 72480 Puebla, Pue.', N'2218946215', N'matrodriguez@gmail.com')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([No_empleado], [Nombre_emple], [Apellido_P], [Apellido_M], [Usuario], [Contraseña], [profile]) VALUES (1, N'Hector', N'Saavedra', N'Marquez', N'admin@gmail.com', N'admin', N'user1.jpg')
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedidos] ON 

INSERT [dbo].[Pedidos] ([No_pedido], [No_producto], [No_vent], [Cantidad]) VALUES (8, 8, 4, 1)
INSERT [dbo].[Pedidos] ([No_pedido], [No_producto], [No_vent], [Cantidad]) VALUES (11, 5, 4, 1)
INSERT [dbo].[Pedidos] ([No_pedido], [No_producto], [No_vent], [Cantidad]) VALUES (13, 10, 9, 1)
INSERT [dbo].[Pedidos] ([No_pedido], [No_producto], [No_vent], [Cantidad]) VALUES (14, 10, 9, 1)
INSERT [dbo].[Pedidos] ([No_pedido], [No_producto], [No_vent], [Cantidad]) VALUES (15, 9, 10, 2)
INSERT [dbo].[Pedidos] ([No_pedido], [No_producto], [No_vent], [Cantidad]) VALUES (16, 5, 10, 1)
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([No_producto], [No_Categoria], [Nombre_prod], [Precio_venta], [Stock], [Descripcion], [Img], [Precio_compra]) VALUES (1, 1, N'Alas', CAST(70.00 AS Decimal(10, 2)), 100, N'PAR DE ALAS CROMADAS RESALTADORAS DE CUARTOS DE SALPICADERA PARA GOLF A4, JETTA A4, DERBY, PASSAT B6', N'item1.png', CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([No_producto], [No_Categoria], [Nombre_prod], [Precio_venta], [Stock], [Descripcion], [Img], [Precio_compra]) VALUES (2, 1, N'Sobrellantas', CAST(1475.00 AS Decimal(10, 2)), 28, N'JUEGO DE 4 CORBATAS CARA BLANCA DE RINES DE 15 PULGADAS PARA VW SEDAN', N'item2.jpg', CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([No_producto], [No_Categoria], [Nombre_prod], [Precio_venta], [Stock], [Descripcion], [Img], [Precio_compra]) VALUES (3, 2, N'Llave de cruz', CAST(340.00 AS Decimal(10, 2)), 49, N'LLAVE DE CRUZ CROMADA GRANDE', N'item3.jpg', CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([No_producto], [No_Categoria], [Nombre_prod], [Precio_venta], [Stock], [Descripcion], [Img], [Precio_compra]) VALUES (4, 2, N'Probador de corriente', CAST(50.00 AS Decimal(10, 2)), 100, N'PROBADOR DE CORRIENTE LUMINOSO DE 12 VOLTS CON CAIMÁN Y PUNTO DE PRUEBA UNIVERSAL', N'item4.png', CAST(35.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([No_producto], [No_Categoria], [Nombre_prod], [Precio_venta], [Stock], [Descripcion], [Img], [Precio_compra]) VALUES (5, 3, N'Acumulador LTH', CAST(2715.00 AS Decimal(10, 2)), 30, N'ACUMULADOR AUTOMOTRIZ LTH L42-500', N'item5.png', CAST(2650.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([No_producto], [No_Categoria], [Nombre_prod], [Precio_venta], [Stock], [Descripcion], [Img], [Precio_compra]) VALUES (6, 3, N'bujía', CAST(50.00 AS Decimal(10, 2)), 150, N'BUJÍA DE 1 ELECTRODO CON PUNTA DE COBRE BOSCH PARA VW SEDAN 1100, 1200, 1500,1600', N'item6.png', CAST(45.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([No_producto], [No_Categoria], [Nombre_prod], [Precio_venta], [Stock], [Descripcion], [Img], [Precio_compra]) VALUES (7, 4, N'Aceite Multigrano', CAST(70.00 AS Decimal(10, 2)), 100, N'ACEITE MULTIGRADO MINERAL SAE 20W-50 ACDELCO PARA MOTOR', N'item7.png', CAST(55.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([No_producto], [No_Categoria], [Nombre_prod], [Precio_venta], [Stock], [Descripcion], [Img], [Precio_compra]) VALUES (8, 4, N'Aditivo Liqui', CAST(275.00 AS Decimal(10, 2)), 86, N'ADITIVO LIQUI MOLY REDUCTOR DE RUIDO DE BUZOS HIDRÁULICOS HYDRO STÖBEL ADDITIV', N'item8.png', CAST(255.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([No_producto], [No_Categoria], [Nombre_prod], [Precio_venta], [Stock], [Descripcion], [Img], [Precio_compra]) VALUES (9, 5, N'LLavero VW', CAST(70.00 AS Decimal(10, 2)), 200, N'LLAVERO CON CINTA COLOR NEGRO Y EMBLEMA VOLKSGAWEN', N'item9.png', CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([No_producto], [No_Categoria], [Nombre_prod], [Precio_venta], [Stock], [Descripcion], [Img], [Precio_compra]) VALUES (10, 5, N'Parche VW', CAST(40.00 AS Decimal(10, 2)), 25, N'PARCHE CALAVERA VW NEGRO', N'item10.png', CAST(32.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Provedores] ON 

INSERT [dbo].[Provedores] ([No_provedor], [Razon_social], [Direccion], [Telefono], [Logo]) VALUES (1, N'Grupo AG', N'La Viga No. 891, Barrio de Santiago Nte. Sur, Deleg. Iztacalco, 08800 México, D.F.', N'+52344532456', N'GrupoAG.png')
INSERT [dbo].[Provedores] ([No_provedor], [Razon_social], [Direccion], [Telefono], [Logo]) VALUES (2, N'Grupo CN', N'Av. Miguel Alemán No. 300 Nte. Col. Centro  C.P. 85100 Cd. Obregón, Son', N'+335920485721', N'GrupoCN.jpg')
INSERT [dbo].[Provedores] ([No_provedor], [Razon_social], [Direccion], [Telefono], [Logo]) VALUES (3, N'JADEC', N'Boulevard Manuel Ávila Camacho # 647,  Col. Periodista.- Deleg. Miguel Hidalgo  C.P. 11220 México, D. F.', N'+452345901458', N'Jadec.png')
INSERT [dbo].[Provedores] ([No_provedor], [Razon_social], [Direccion], [Telefono], [Logo]) VALUES (4, N'Multi Herramientas', N'Av. Paseo de los Triunfadores No. 162 Ote. Cumbres 8° Sector C. P. 64610 Monterrey N. L.', N'+220594833748', N'MultiH.png')
INSERT [dbo].[Provedores] ([No_provedor], [Razon_social], [Direccion], [Telefono], [Logo]) VALUES (5, N'PFERD', N'Vía Morelos 268, Col. Santa María Tulpetlac, C.P. 55400 Ecatepec, Edo. de México', N'+520585930232', N'PFERD.png')
INSERT [dbo].[Provedores] ([No_provedor], [Razon_social], [Direccion], [Telefono], [Logo]) VALUES (6, N'PROINDRA', N'Km. 1, Carretera Campo Militar, Entronque Km. 3, Carr. a S.L.P., Col. San Antonio de la Punta, C.P. 76135 Querétaro, Qro.', N'+210948859204', N'Proindra.jpg')
INSERT [dbo].[Provedores] ([No_provedor], [Razon_social], [Direccion], [Telefono], [Logo]) VALUES (7, N'Shell', N'Av. Héroes de la Independencia No. 901,  Col. Guadalupe Hidalgo  C.P. 75790, Tehuacán, Pue.', N'+220559883746', N'Shell.png')
SET IDENTITY_INSERT [dbo].[Provedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([No_venta], [No_cliente], [No_empleado], [Fecha], [Total], [Estado]) VALUES (4, 5, 1, CAST(N'2021-11-03' AS Date), CAST(140.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Ventas] ([No_venta], [No_cliente], [No_empleado], [Fecha], [Total], [Estado]) VALUES (9, 1, 1, CAST(N'2021-03-15' AS Date), CAST(345.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Ventas] ([No_venta], [No_cliente], [No_empleado], [Fecha], [Total], [Estado]) VALUES (10, 3, 1, CAST(N'2021-03-17' AS Date), CAST(345.00 AS Decimal(10, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([No_producto])
REFERENCES [dbo].[Producto] ([No_producto])
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([No_vent])
REFERENCES [dbo].[Ventas] ([No_venta])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([No_Categoria])
REFERENCES [dbo].[Categoria] ([No_Categoria])
GO
ALTER TABLE [dbo].[Salidas]  WITH CHECK ADD  CONSTRAINT [FK_Product] FOREIGN KEY([No_producto])
REFERENCES [dbo].[Producto] ([No_producto])
GO
ALTER TABLE [dbo].[Salidas] CHECK CONSTRAINT [FK_Product]
GO
ALTER TABLE [dbo].[Salidas]  WITH CHECK ADD  CONSTRAINT [FK_Provider] FOREIGN KEY([No_provedor])
REFERENCES [dbo].[Provedores] ([No_provedor])
GO
ALTER TABLE [dbo].[Salidas] CHECK CONSTRAINT [FK_Provider]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([No_cliente])
REFERENCES [dbo].[Cliente] ([No_cliente])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([No_empleado])
REFERENCES [dbo].[Empleado] ([No_empleado])
GO
USE [master]
GO
ALTER DATABASE [Refaccionaria] SET  READ_WRITE 
GO
