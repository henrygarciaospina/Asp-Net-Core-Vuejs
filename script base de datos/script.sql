USE [dbsistema]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 01/18/2019 14:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol](
	[idrol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[condicion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idrol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON
INSERT [dbo].[rol] ([idrol], [nombre], [descripcion], [condicion]) VALUES (1, N'Administrador', N'Administrador del sistema', 1)
INSERT [dbo].[rol] ([idrol], [nombre], [descripcion], [condicion]) VALUES (2, N'Almacenero', N'Almacenero del sistema', 1)
INSERT [dbo].[rol] ([idrol], [nombre], [descripcion], [condicion]) VALUES (3, N'Vendedor', N'Vendedor del sistema', 1)
SET IDENTITY_INSERT [dbo].[rol] OFF
/****** Object:  Table [dbo].[persona]    Script Date: 01/18/2019 14:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[persona](
	[idpersona] [int] IDENTITY(1,1) NOT NULL,
	[tipopersona] [varchar](20) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipodocumento] [varchar](20) NULL,
	[numerodocumento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idpersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[persona] ON
INSERT [dbo].[persona] ([idpersona], [tipopersona], [nombre], [tipodocumento], [numerodocumento], [direccion], [telefono], [email]) VALUES (1, N'Cliente', N'José Gandur', N'PASAPORTE', N'111122333444', N'Cll 34 No.79-88', N'3456790', N'jose@gandur.com')
INSERT [dbo].[persona] ([idpersona], [tipopersona], [nombre], [tipodocumento], [numerodocumento], [direccion], [telefono], [email]) VALUES (2, N'Proveedor', N'Benito Pérez ', N'CEDULA', N'10345678', N'Cra 70 No.78-90', N'3607920', N'benito@bpm.com')
INSERT [dbo].[persona] ([idpersona], [tipopersona], [nombre], [tipodocumento], [numerodocumento], [direccion], [telefono], [email]) VALUES (3, N'Cliente', N'Jesús Duque Robayo', N'CEDULA', N'45678901', N'La Aurora Alta (Dosquebradas)', N'4567890', N'jesus@hotmail.com')
INSERT [dbo].[persona] ([idpersona], [tipopersona], [nombre], [tipodocumento], [numerodocumento], [direccion], [telefono], [email]) VALUES (4, N'Proveedor', N'CompuRedes SAS', N'RUC', N'1299998768', N'Av 30 de Agosto No.46-98 (Pereira)', N'6438917', N'compuredes@computred.com')
SET IDENTITY_INSERT [dbo].[persona] OFF
/****** Object:  Table [dbo].[categoria]    Script Date: 01/18/2019 14:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](256) NULL,
	[condicion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[categoria] ON
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [condicion]) VALUES (1, N'Aceite ', N'Aceite fino para cocina de alta calidad', 1)
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [condicion]) VALUES (3, N'Bebidas', N'Todas las bebidas', 1)
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [condicion]) VALUES (4, N'Oficina', N'Artículos de oficina', 0)
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [condicion]) VALUES (5, N'Categoría Ejemplo', N'Descripción Ejemplo', 1)
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [condicion]) VALUES (6, N'Categoría good', N'Lociones', 1)
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [condicion]) VALUES (7, N'Categoría 4', N'', 0)
INSERT [dbo].[categoria] ([idcategoria], [nombre], [descripcion], [condicion]) VALUES (8, N'Medicamentos', N'Isodine genérico de alta calidad', 1)
SET IDENTITY_INSERT [dbo].[categoria] OFF
/****** Object:  Table [dbo].[articulo]    Script Date: 01/18/2019 14:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[articulo](
	[idarticulo] [int] IDENTITY(1,1) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](100) NOT NULL,
	[precioventa] [decimal](11, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[descripcion] [varchar](256) NULL,
	[condicion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idarticulo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[articulo] ON
INSERT [dbo].[articulo] ([idarticulo], [idcategoria], [codigo], [nombre], [precioventa], [stock], [descripcion], [condicion]) VALUES (1, 1, N'24567890', N'Aceite Oliosoya x 3 litros', CAST(10500.00 AS Decimal(11, 2)), 65, N'Aceite fino para cocina de alta calidad', 1)
INSERT [dbo].[articulo] ([idarticulo], [idcategoria], [codigo], [nombre], [precioventa], [stock], [descripcion], [condicion]) VALUES (2, 3, N'78906783', N'Pack Coca-Cola 3 litros', CAST(15000.00 AS Decimal(11, 2)), 50, N'Paquete de 3 unidades x 3 litros de Coca-Cola', 0)
INSERT [dbo].[articulo] ([idarticulo], [idcategoria], [codigo], [nombre], [precioventa], [stock], [descripcion], [condicion]) VALUES (3, 4, N'60056789', N'Resma de papel de 500 hojas', CAST(8000.00 AS Decimal(11, 2)), 65, N'Resma de papel de 500 hojas de densidad media', 1)
INSERT [dbo].[articulo] ([idarticulo], [idcategoria], [codigo], [nombre], [precioventa], [stock], [descripcion], [condicion]) VALUES (4, 3, N'12367890', N'Jugo  Hit x 12 unidades ', CAST(9500.00 AS Decimal(11, 2)), 30, N'Jugo Hit x 12 unidades en sabores surtidos ', 1)
INSERT [dbo].[articulo] ([idarticulo], [idcategoria], [codigo], [nombre], [precioventa], [stock], [descripcion], [condicion]) VALUES (5, 8, N'1214161824', N'Isodine Genfar x 100 ml', CAST(7500.00 AS Decimal(11, 2)), 19, N'', 1)
SET IDENTITY_INSERT [dbo].[articulo] OFF
/****** Object:  Table [dbo].[usuario]    Script Date: 01/18/2019 14:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[idrol] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipodocumento] [varchar](20) NULL,
	[numerodocumento] [varchar](20) NULL,
	[direccion] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NOT NULL,
	[passwordhash] [varbinary](max) NOT NULL,
	[passwordsalt] [varbinary](max) NOT NULL,
	[condicion] [bit] NULL,
 CONSTRAINT [PK__usuario__080A974324927208] PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON
INSERT [dbo].[usuario] ([idusuario], [idrol], [nombre], [tipodocumento], [numerodocumento], [direccion], [telefono], [email], [passwordhash], [passwordsalt], [condicion]) VALUES (1, 1, N'Henry García', N'CEDULA', N'10124556', N'Calle Luna Calle Sol', N'777 7777', N'henrygarcia0309@gmail.com', 0x23638041E9C088EF0BAD9ADE6E878C86C5862F5E4C580A79D88F5DBDB38358992082CF25066DB9BD643D37306CB28FD5363F6784877E3AA3F27D9168397517AB, 0x71E53A3E330F84284D6CF373B48FD94193B2B3D513D8BB0AE078DE3EC8DBE365E6F3C3880342A5F7DC991952D2852BB56254BF9D1CDC97749F9B8C9A1E6007AEDB8EDD90D274D944EDC3D39A81E57B818D13D68A2D01FC5E03B25CE977683A8EA0326FEDC7358780B08FB174A01D0A1C440C1061AA650F2AC3D00D3707A55240, 1)
INSERT [dbo].[usuario] ([idusuario], [idrol], [nombre], [tipodocumento], [numerodocumento], [direccion], [telefono], [email], [passwordhash], [passwordsalt], [condicion]) VALUES (2, 3, N'Pepito Perez', N'PASAPORTE', N'1234577890', N'Avenida Paraiso No.77-77', N'777 9090', N'pepito@gmail.com', 0x3EAC143E234526AE55BA9ECAC7E114761B160E1750A40A6C3B1DC06A72ED5B25D4623E9068077FDD2506AF42C2927ECA581442779B0C342C74698E78B8F6800D, 0x78046DCA83EEAF329EB1069D4092479D8D16CAD119A011675E5BC4E38F5D4A99F6594EDED36751683049ED9E807CA6E6B8CCEA710A9F29C628A8CA42664884C819B044F7388349C76FDC7EA040B4BAE6F931DB154C38B76EBEE98B0CDE88BF17FF24C4C3DD72D4FB4E8CC99C237120C903018861DF855947CD760125D88E949A, 1)
SET IDENTITY_INSERT [dbo].[usuario] OFF
/****** Object:  Table [dbo].[venta]    Script Date: 01/18/2019 14:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipocomprobante] [varchar](20) NOT NULL,
	[seriecomprobante] [varchar](7) NULL,
	[numcomprobante] [varchar](10) NOT NULL,
	[fechahora] [datetime] NOT NULL,
	[impuesto] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ingreso]    Script Date: 01/18/2019 14:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ingreso](
	[idingreso] [int] IDENTITY(1,1) NOT NULL,
	[idproveedor] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[tipocomprobante] [varchar](20) NOT NULL,
	[seriecomprobante] [varchar](7) NULL,
	[numcomprobante] [varchar](10) NOT NULL,
	[fechahora] [datetime] NOT NULL,
	[impuesto] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idingreso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalleventa]    Script Date: 01/18/2019 14:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleventa](
	[iddetalleventa] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
	[descuento] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalleventa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalleingreso]    Script Date: 01/18/2019 14:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleingreso](
	[iddetalleingreso] [int] IDENTITY(1,1) NOT NULL,
	[idingreso] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalleingreso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF__articulo__condic__182C9B23]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[articulo] ADD  DEFAULT ((1)) FOR [condicion]
GO
/****** Object:  Default [DF__categoria__condi__108B795B]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[categoria] ADD  DEFAULT ((1)) FOR [condicion]
GO
/****** Object:  Default [DF__rol__condicion__21B6055D]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[rol] ADD  DEFAULT ((1)) FOR [condicion]
GO
/****** Object:  Default [DF__usuario__condici__267ABA7A]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [DF__usuario__condici__267ABA7A]  DEFAULT ((1)) FOR [condicion]
GO
/****** Object:  ForeignKey [FK__articulo__idcate__1920BF5C]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD FOREIGN KEY([idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
/****** Object:  ForeignKey [FK__detalle_i__idart__32E0915F]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[detalleingreso]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
/****** Object:  ForeignKey [FK__detalle_i__iding__31EC6D26]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[detalleingreso]  WITH CHECK ADD FOREIGN KEY([idingreso])
REFERENCES [dbo].[ingreso] ([idingreso])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__detalle_v__idart__3E52440B]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[detalleventa]  WITH CHECK ADD FOREIGN KEY([idarticulo])
REFERENCES [dbo].[articulo] ([idarticulo])
GO
/****** Object:  ForeignKey [FK__detalle_v__idven__3D5E1FD2]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[detalleventa]  WITH CHECK ADD FOREIGN KEY([idventa])
REFERENCES [dbo].[venta] ([idventa])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__ingreso__idprove__2C3393D0]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD FOREIGN KEY([idproveedor])
REFERENCES [dbo].[persona] ([idpersona])
GO
/****** Object:  ForeignKey [FK__ingreso__idusuar__2D27B809]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[ingreso]  WITH CHECK ADD  CONSTRAINT [FK__ingreso__idusuar__2D27B809] FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
ALTER TABLE [dbo].[ingreso] CHECK CONSTRAINT [FK__ingreso__idusuar__2D27B809]
GO
/****** Object:  ForeignKey [FK__usuario__idrol__276EDEB3]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK__usuario__idrol__276EDEB3] FOREIGN KEY([idrol])
REFERENCES [dbo].[rol] ([idrol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK__usuario__idrol__276EDEB3]
GO
/****** Object:  ForeignKey [FK__venta__idcliente__37A5467C]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idcliente])
REFERENCES [dbo].[persona] ([idpersona])
GO
/****** Object:  ForeignKey [FK__venta__idusuario__38996AB5]    Script Date: 01/18/2019 14:36:01 ******/
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK__venta__idusuario__38996AB5] FOREIGN KEY([idusuario])
REFERENCES [dbo].[usuario] ([idusuario])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK__venta__idusuario__38996AB5]
GO
