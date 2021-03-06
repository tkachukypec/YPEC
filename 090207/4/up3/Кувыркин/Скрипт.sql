USE [19ip29]
GO
/****** Object:  Table [dbo].[Owners]    Script Date: 11.05.2022 12:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[ID Owner] [int] IDENTITY(1,1) NOT NULL,
	[Full name] [nvarchar](50) NOT NULL,
	[The address] [nvarchar](50) NOT NULL,
	[Telephone] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Owners] PRIMARY KEY CLUSTERED 
(
	[ID Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 11.05.2022 12:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[Profile] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Profiles] PRIMARY KEY CLUSTERED 
(
	[Profile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 11.05.2022 12:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shares](
	[Share] [int] IDENTITY(1,1) NOT NULL,
	[Owner] [nvarchar](50) NOT NULL,
	[Score] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Shares] PRIMARY KEY CLUSTERED 
(
	[Share] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 11.05.2022 12:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[ID Suppliers] [int] IDENTITY(1,1) NOT NULL,
	[Organization] [nvarchar](50) NOT NULL,
	[The address] [nvarchar](50) NOT NULL,
	[Telephone] [int] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[ID Suppliers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplies]    Script Date: 11.05.2022 12:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplies](
	[ID Supplies] [int] IDENTITY(1,1) NOT NULL,
	[Delivery size] [int] NOT NULL,
	[The supplier] [nvarchar](50) NOT NULL,
	[Shop] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supplies] PRIMARY KEY CLUSTERED 
(
	[ID Supplies] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[The shops]    Script Date: 11.05.2022 12:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[The shops](
	[ID Store] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[The address] [nvarchar](50) NOT NULL,
	[Telephone] [int] NOT NULL,
	[Authorized capital] [nvarchar](50) NOT NULL,
	[Profile] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_The shops] PRIMARY KEY CLUSTERED 
(
	[ID Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Owners]  WITH CHECK ADD  CONSTRAINT [FK_Owners_Shares] FOREIGN KEY([Telephone])
REFERENCES [dbo].[Shares] ([Share])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Owners] CHECK CONSTRAINT [FK_Owners_Shares]
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD  CONSTRAINT [FK_Supplies_Suppliers] FOREIGN KEY([Delivery size])
REFERENCES [dbo].[Suppliers] ([ID Suppliers])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Supplies] CHECK CONSTRAINT [FK_Supplies_Suppliers]
GO
ALTER TABLE [dbo].[The shops]  WITH CHECK ADD  CONSTRAINT [FK_The shops_Profiles] FOREIGN KEY([Telephone])
REFERENCES [dbo].[Profiles] ([Profile])
GO
ALTER TABLE [dbo].[The shops] CHECK CONSTRAINT [FK_The shops_Profiles]
GO
ALTER TABLE [dbo].[The shops]  WITH CHECK ADD  CONSTRAINT [FK_The shops_Shares] FOREIGN KEY([Telephone])
REFERENCES [dbo].[Shares] ([Share])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[The shops] CHECK CONSTRAINT [FK_The shops_Shares]
GO
ALTER TABLE [dbo].[The shops]  WITH CHECK ADD  CONSTRAINT [FK_The shops_Supplies] FOREIGN KEY([Telephone])
REFERENCES [dbo].[Supplies] ([ID Supplies])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[The shops] CHECK CONSTRAINT [FK_The shops_Supplies]
GO
