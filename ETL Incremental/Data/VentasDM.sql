USE [VentasDM]
GO
/****** Object:  Table [dbo].[Compania]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Compania](
	[Compania_Key] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Compania] PRIMARY KEY CLUSTERED 
(
	[Compania_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Local]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Local](
	[Local_Key] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[IdLocal] [int] NULL,
	[Compania_Key] [int] NULL,
 CONSTRAINT [PK_Dim_Local] PRIMARY KEY CLUSTERED 
(
	[Local_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Producto]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Producto](
	[Producto_Key] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[IdSubFamilia] [int] NULL,
	[IdFamilia] [int] NULL,
	[IdCategoria] [int] NULL,
	[IdRubro] [int] NULL,
	[IdSeccion] [int] NULL,
	[NombreProducto] [varchar](50) NULL,
	[NombreSubFamilia] [varchar](50) NULL,
	[NombreFamilia] [varchar](50) NULL,
	[NombreCategoria] [varchar](50) NULL,
	[NombreRubro] [varchar](50) NULL,
	[NombreSeccion] [varchar](50) NULL,
 CONSTRAINT [PK_Dim_Producto] PRIMARY KEY CLUSTERED 
(
	[Producto_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Tiempo]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Tiempo](
	[Tiempo_Key] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Mes] [varchar](50) NULL,
	[NumMes] [int] NULL,
	[Año] [int] NULL,
 CONSTRAINT [PK_Dim_Tiempo] PRIMARY KEY CLUSTERED 
(
	[Tiempo_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Version]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Version](
	[Version_Key] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[IdVersion] [int] NULL,
 CONSTRAINT [PK_Dim_Version] PRIMARY KEY CLUSTERED 
(
	[Version_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fact_Comprobante]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Comprobante](
	[Local_Key] [int] NULL,
	[Producto_Key] [int] NULL,
	[Version_key] [int] NULL,
	[Tiempo_Key] [int] NULL,
	[Monto] [decimal](18, 2) NULL,
	[Costo] [decimal](18, 2) NULL,
	[Margen] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fact_Ventas]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Ventas](
	[Local_Key] [int] NULL,
	[Producto_Key] [int] NULL,
	[Version_key] [int] NULL,
	[Tiempo_Key] [int] NULL,
	[Monto] [decimal](18, 2) NULL,
	[Costo] [decimal](18, 2) NULL,
	[Margen] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProcesoCargaIncremental]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProcesoCargaIncremental](
	[IdProceso] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoProceso] [int] NULL,
	[Local_Key] [int] NULL,
	[Fecha] [datetime] NULL,
	[Cargar] [char](1) NULL,
	[Cargadoencubo] [char](1) NULL,
 CONSTRAINT [PK_ProcesoCargaIncremental] PRIMARY KEY CLUSTERED 
(
	[IdProceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Compania] ([Compania_Key], [Nombre]) VALUES (1, N'Supermercado S.A.')
INSERT [dbo].[Dim_Local] ([Local_Key], [Nombre], [IdLocal], [Compania_Key]) VALUES (1, N'PLAZA VEA SAN BORJA', 1, 1)
INSERT [dbo].[Dim_Local] ([Local_Key], [Nombre], [IdLocal], [Compania_Key]) VALUES (2, N'PLAZA VEA JOCKEY', 2, 1)
INSERT [dbo].[Dim_Local] ([Local_Key], [Nombre], [IdLocal], [Compania_Key]) VALUES (3, N'VIVANDA BENAVIDES', 3, 1)
INSERT [dbo].[Dim_Local] ([Local_Key], [Nombre], [IdLocal], [Compania_Key]) VALUES (4, N'VIVANDA JAVIER PRADO', 4, 1)
SET IDENTITY_INSERT [dbo].[Dim_Producto] ON 

INSERT [dbo].[Dim_Producto] ([Producto_Key], [IdProducto], [IdSubFamilia], [IdFamilia], [IdCategoria], [IdRubro], [IdSeccion], [NombreProducto], [NombreSubFamilia], [NombreFamilia], [NombreCategoria], [NombreRubro], [NombreSeccion]) VALUES (13, 1, 1, 1, 1, 1, 4, N'Gloria hierro y calcio', N'Gloria 5 años', N'Gloria', N'yogurt', N'Lacteos', N'Comestibles')
INSERT [dbo].[Dim_Producto] ([Producto_Key], [IdProducto], [IdSubFamilia], [IdFamilia], [IdCategoria], [IdRubro], [IdSeccion], [NombreProducto], [NombreSubFamilia], [NombreFamilia], [NombreCategoria], [NombreRubro], [NombreSeccion]) VALUES (14, 2, 2, 2, 1, 1, 4, N'Jamonada de 13 tajadas', N'Jamonada de pollo', N'Laive', N'yogurt', N'Lacteos', N'Comestibles')
INSERT [dbo].[Dim_Producto] ([Producto_Key], [IdProducto], [IdSubFamilia], [IdFamilia], [IdCategoria], [IdRubro], [IdSeccion], [NombreProducto], [NombreSubFamilia], [NombreFamilia], [NombreCategoria], [NombreRubro], [NombreSeccion]) VALUES (15, 3, 3, 3, 3, 4, 3, N'Lorito  Pequeño', N'Lorito Triple Raya', N'Loro', N'cuaderno', N'Escolares', N'Utiles')
INSERT [dbo].[Dim_Producto] ([Producto_Key], [IdProducto], [IdSubFamilia], [IdFamilia], [IdCategoria], [IdRubro], [IdSeccion], [NombreProducto], [NombreSubFamilia], [NombreFamilia], [NombreCategoria], [NombreRubro], [NombreSeccion]) VALUES (16, 4, 4, 4, 5, 2, 4, N'Cifrut Piña Granadilla', N'Cifrut', N'KR', N'gaseosa', N'Bebidas', N'Comestibles')
SET IDENTITY_INSERT [dbo].[Dim_Producto] OFF
SET IDENTITY_INSERT [dbo].[Dim_Tiempo] ON 

INSERT [dbo].[Dim_Tiempo] ([Tiempo_Key], [Fecha], [Mes], [NumMes], [Año]) VALUES (1, CAST(N'2008-08-03 00:00:00.000' AS DateTime), N'Agosto', 8, 2012)
SET IDENTITY_INSERT [dbo].[Dim_Tiempo] OFF
INSERT [dbo].[Dim_Version] ([Version_Key], [Nombre], [IdVersion]) VALUES (1, N'REAL', 1)
INSERT [dbo].[Dim_Version] ([Version_Key], [Nombre], [IdVersion]) VALUES (2, N'PRESUPUESTO', 2)
INSERT [dbo].[Fact_Comprobante] ([Local_Key], [Producto_Key], [Version_key], [Tiempo_Key], [Monto], [Costo], [Margen]) VALUES (4, 16, 1, 1, CAST(26.40 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[Fact_Comprobante] ([Local_Key], [Producto_Key], [Version_key], [Tiempo_Key], [Monto], [Costo], [Margen]) VALUES (1, 13, 1, 1, CAST(82.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[Fact_Comprobante] ([Local_Key], [Producto_Key], [Version_key], [Tiempo_Key], [Monto], [Costo], [Margen]) VALUES (2, 14, 1, 1, CAST(204.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[Fact_Comprobante] ([Local_Key], [Producto_Key], [Version_key], [Tiempo_Key], [Monto], [Costo], [Margen]) VALUES (3, 15, 1, 1, CAST(339.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[Fact_Ventas] ([Local_Key], [Producto_Key], [Version_key], [Tiempo_Key], [Monto], [Costo], [Margen]) VALUES (1, 13, 1, 1, CAST(82.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[Fact_Ventas] ([Local_Key], [Producto_Key], [Version_key], [Tiempo_Key], [Monto], [Costo], [Margen]) VALUES (2, 14, 1, 1, CAST(204.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[Fact_Ventas] ([Local_Key], [Producto_Key], [Version_key], [Tiempo_Key], [Monto], [Costo], [Margen]) VALUES (3, 15, 1, 1, CAST(339.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[Fact_Ventas] ([Local_Key], [Producto_Key], [Version_key], [Tiempo_Key], [Monto], [Costo], [Margen]) VALUES (4, 16, 1, 1, CAST(26.40 AS Decimal(18, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProcesoCargaIncremental] ON 

INSERT [dbo].[ProcesoCargaIncremental] ([IdProceso], [IdTipoProceso], [Local_Key], [Fecha], [Cargar], [Cargadoencubo]) VALUES (1, 1, 1, CAST(N'2008-08-03 13:56:18.577' AS DateTime), N'P', N'P')
INSERT [dbo].[ProcesoCargaIncremental] ([IdProceso], [IdTipoProceso], [Local_Key], [Fecha], [Cargar], [Cargadoencubo]) VALUES (2, 1, 2, CAST(N'2008-08-03 13:56:18.577' AS DateTime), N'P', N'P')
INSERT [dbo].[ProcesoCargaIncremental] ([IdProceso], [IdTipoProceso], [Local_Key], [Fecha], [Cargar], [Cargadoencubo]) VALUES (3, 1, 3, CAST(N'2008-08-03 13:56:18.577' AS DateTime), N'P', N'P')
INSERT [dbo].[ProcesoCargaIncremental] ([IdProceso], [IdTipoProceso], [Local_Key], [Fecha], [Cargar], [Cargadoencubo]) VALUES (4, 1, 4, CAST(N'2008-08-03 13:56:18.577' AS DateTime), N'P', N'P')
SET IDENTITY_INSERT [dbo].[ProcesoCargaIncremental] OFF
ALTER TABLE [dbo].[Dim_Local]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Local_Compania] FOREIGN KEY([Compania_Key])
REFERENCES [dbo].[Compania] ([Compania_Key])
GO
ALTER TABLE [dbo].[Dim_Local] CHECK CONSTRAINT [FK_Dim_Local_Compania]
GO
ALTER TABLE [dbo].[Fact_Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Comprobante_Dim_Local] FOREIGN KEY([Local_Key])
REFERENCES [dbo].[Dim_Local] ([Local_Key])
GO
ALTER TABLE [dbo].[Fact_Comprobante] CHECK CONSTRAINT [FK_Fact_Comprobante_Dim_Local]
GO
ALTER TABLE [dbo].[Fact_Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Comprobante_Dim_Producto] FOREIGN KEY([Producto_Key])
REFERENCES [dbo].[Dim_Producto] ([Producto_Key])
GO
ALTER TABLE [dbo].[Fact_Comprobante] CHECK CONSTRAINT [FK_Fact_Comprobante_Dim_Producto]
GO
ALTER TABLE [dbo].[Fact_Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Comprobante_Dim_Tiempo] FOREIGN KEY([Tiempo_Key])
REFERENCES [dbo].[Dim_Tiempo] ([Tiempo_Key])
GO
ALTER TABLE [dbo].[Fact_Comprobante] CHECK CONSTRAINT [FK_Fact_Comprobante_Dim_Tiempo]
GO
ALTER TABLE [dbo].[Fact_Comprobante]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Comprobante_Dim_Version] FOREIGN KEY([Version_key])
REFERENCES [dbo].[Dim_Version] ([Version_Key])
GO
ALTER TABLE [dbo].[Fact_Comprobante] CHECK CONSTRAINT [FK_Fact_Comprobante_Dim_Version]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Local] FOREIGN KEY([Local_Key])
REFERENCES [dbo].[Dim_Local] ([Local_Key])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Local]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Producto] FOREIGN KEY([Producto_Key])
REFERENCES [dbo].[Dim_Producto] ([Producto_Key])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Producto]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Tiempo] FOREIGN KEY([Tiempo_Key])
REFERENCES [dbo].[Dim_Tiempo] ([Tiempo_Key])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Tiempo]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Version] FOREIGN KEY([Version_key])
REFERENCES [dbo].[Dim_Version] ([Version_Key])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Version]
GO
/****** Object:  StoredProcedure [dbo].[CargaDeProcesoCargaIncremental]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[CargaDeProcesoCargaIncremental]
@IdTipoProceso int
As
Begin
	declare @fecha datetime
	declare @Cant int
	set @fecha = getdate()
	

	Select  @Cant=count(IdProceso) from  ProcesoCargaIncremental
	where convert(varchar,Fecha,103)=convert(varchar,@Fecha,103)

	If @Cant=0
		Begin
			Insert Into  ProcesoCargaIncremental
			(IdTipoProceso, Local_Key, Fecha, Cargar, Cargadoencubo)
			select @IdTipoProceso as IdTipoProceso,Local_Key, @Fecha,'P','P'
			from dbo.Dim_Local 
		End
End 

GO
/****** Object:  StoredProcedure [dbo].[Usp_DelFactVentasforLocal]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_DelFactVentasforLocal]
@IdTipoProceso int,
@IDLocal int,
@Fecha varchar(10)
as

declare @Tiempo_Key int
declare @Local_Key int
begin
	
	Select @Tiempo_Key = Tiempo_Key
		from Dim_Tiempo
	where convert(varchar(10),Fecha,103) = convert(varchar(10),@Fecha,103)

	Select @Local_Key = Local_Key
		from Dim_Local
	where IdLocal = @IdLocal

	If @IdTipoProceso = 1
		Begin
		Delete dbo.Fact_Ventas
        where Local_Key = @Local_Key and Tiempo_Key = @Tiempo_Key and Version_Key = 1
		End
end




GO
/****** Object:  StoredProcedure [dbo].[Usp_SelPendientesCarga]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_SelPendientesCarga]
@IdTipoProceso int
as
begin
	select Local_Key,Fecha
		From ProcesoCargaIncremental
    where Cargar = 'P'
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdProcesoCargaIncremental]    Script Date: 26/05/2017 22:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_UpdProcesoCargaIncremental]
@IdProceso int,
@Estado varchar(1)

as

begin
	Update 	dbo.ProcesoCargaIncremental
		set Cargar = @Estado
	where IdProceso = @IdProceso
end	
GO
