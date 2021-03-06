USE [19ip29]
GO
/****** Object:  Table [dbo].[Owners]    Script Date: 13.05.2022 13:02:05 ******/
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
	[image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Owners] PRIMARY KEY CLUSTERED 
(
	[ID Owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 13.05.2022 13:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[Profile] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Profiles] PRIMARY KEY CLUSTERED 
(
	[Profile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 13.05.2022 13:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shares](
	[Share] [int] IDENTITY(1,1) NOT NULL,
	[Owner] [int] NOT NULL,
	[Score] [nvarchar](50) NOT NULL,
	[Shops] [int] NOT NULL,
 CONSTRAINT [PK_Shares] PRIMARY KEY CLUSTERED 
(
	[Share] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 13.05.2022 13:02:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[ID Suppliers] [nvarchar](50) NOT NULL,
	[Organization] [nvarchar](50) NOT NULL,
	[The address] [nvarchar](50) NOT NULL,
	[Telephone] [int] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[ID Suppliers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplies]    Script Date: 13.05.2022 13:02:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplies](
	[ID Supplies] [int] IDENTITY(1,1) NOT NULL,
	[Delivery size] [int] NULL,
	[The supplier] [nvarchar](50) NOT NULL,
	[Shop] [int] NOT NULL,
 CONSTRAINT [PK_Supplies] PRIMARY KEY CLUSTERED 
(
	[ID Supplies] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[The shops]    Script Date: 13.05.2022 13:02:06 ******/
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
	[Profile] [int] NOT NULL,
 CONSTRAINT [PK_The shops] PRIMARY KEY CLUSTERED 
(
	[ID Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Owners] ON 

INSERT [dbo].[Owners] ([ID Owner], [Full name], [The address], [Telephone], [Password], [Login], [image]) VALUES (1, N'Иван', N'Гагарина ', 8282883, N'1', N'1', N'images/avatars/1.png')
INSERT [dbo].[Owners] ([ID Owner], [Full name], [The address], [Telephone], [Password], [Login], [image]) VALUES (2, N'Егор', N'Кирово', 8909790, N'2222', N'фффффф', N'images/avatars/2.png')
INSERT [dbo].[Owners] ([ID Owner], [Full name], [The address], [Telephone], [Password], [Login], [image]) VALUES (3, N'Александр', N'Вальсино', 3463466, N'3333', N'ааааааа', N'images/avatars/3.png')
SET IDENTITY_INSERT [dbo].[Owners] OFF
SET IDENTITY_INSERT [dbo].[Profiles] ON 

INSERT [dbo].[Profiles] ([Profile], [Name]) VALUES (1, N'Главный')
SET IDENTITY_INSERT [dbo].[Profiles] OFF
SET IDENTITY_INSERT [dbo].[Shares] ON 

INSERT [dbo].[Shares] ([Share], [Owner], [Score], [Shops]) VALUES (12, 1, N'1', 7)
SET IDENTITY_INSERT [dbo].[Shares] OFF
INSERT [dbo].[Suppliers] ([ID Suppliers], [Organization], [The address], [Telephone]) VALUES (N'1', N'23', N'33', 33)
SET IDENTITY_INSERT [dbo].[The shops] ON 

INSERT [dbo].[The shops] ([ID Store], [Name], [The address], [Telephone], [Authorized capital], [Profile]) VALUES (7, N'Sneakers shop', N'Гагарина 12', 822833828, N'100000', 1)
SET IDENTITY_INSERT [dbo].[The shops] OFF
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_Owners] FOREIGN KEY([Owner])
REFERENCES [dbo].[Owners] ([ID Owner])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_Owners]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_The shops] FOREIGN KEY([Shops])
REFERENCES [dbo].[The shops] ([ID Store])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_The shops]
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD  CONSTRAINT [FK_Supplies_Suppliers1] FOREIGN KEY([The supplier])
REFERENCES [dbo].[Suppliers] ([ID Suppliers])
GO
ALTER TABLE [dbo].[Supplies] CHECK CONSTRAINT [FK_Supplies_Suppliers1]
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD  CONSTRAINT [FK_Supplies_The shops] FOREIGN KEY([Shop])
REFERENCES [dbo].[The shops] ([ID Store])
GO
ALTER TABLE [dbo].[Supplies] CHECK CONSTRAINT [FK_Supplies_The shops]
GO
ALTER TABLE [dbo].[The shops]  WITH CHECK ADD  CONSTRAINT [FK_The shops_Profiles1] FOREIGN KEY([Profile])
REFERENCES [dbo].[Profiles] ([Profile])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[The shops] CHECK CONSTRAINT [FK_The shops_Profiles1]
GO
