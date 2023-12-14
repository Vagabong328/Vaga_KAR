USE [master]
GO
/****** Object:  Database [Vaga]    Script Date: 15.12.2023 0:19:02 ******/
CREATE DATABASE [Vaga]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vaga', FILENAME = N'C:\Users\SystemX\Vaga.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vaga_log', FILENAME = N'C:\Users\SystemX\Vaga_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Vaga] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vaga].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vaga] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vaga] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vaga] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vaga] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vaga] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vaga] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vaga] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vaga] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vaga] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vaga] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vaga] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vaga] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vaga] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vaga] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vaga] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vaga] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vaga] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vaga] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vaga] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vaga] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vaga] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vaga] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vaga] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Vaga] SET  MULTI_USER 
GO
ALTER DATABASE [Vaga] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vaga] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vaga] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vaga] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vaga] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vaga] SET QUERY_STORE = OFF
GO
USE [Vaga]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Vaga]
GO
/****** Object:  Table [dbo].[loginhistory]    Script Date: 15.12.2023 0:19:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loginhistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NULL,
	[LoginDateTime] [datetime] NULL,
	[TypeVxod] [nvarchar](50) NULL,
 CONSTRAINT [PK_loginhistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 15.12.2023 0:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[dexcription] [text] NOT NULL,
	[manufacturer] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 15.12.2023 0:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[code] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL,
	[total_cost] [int] NULL,
	[delivery_days] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 15.12.2023 0:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 15.12.2023 0:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id_orders] [int] NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NULL,
	[quantity] [int] NULL,
	[total_cost] [int] NULL,
	[discount] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_sostav_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 15.12.2023 0:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_user]    Script Date: 15.12.2023 0:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 15.12.2023 0:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[loginhistory] ON 

INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (68, 1, CAST(N'2023-12-14T23:50:33.847' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (69, 1, CAST(N'2023-12-14T23:57:19.847' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (70, 1, CAST(N'2023-12-15T00:02:58.320' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (71, 1, CAST(N'2023-12-15T00:04:10.083' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (72, 1, CAST(N'2023-12-15T00:06:29.297' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (73, 1, CAST(N'2023-12-15T00:07:23.107' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (74, 1, CAST(N'2023-12-15T00:08:00.717' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (75, 1, CAST(N'2023-12-15T00:11:21.117' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (76, 2, CAST(N'2023-12-15T00:15:00.987' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (77, 3, CAST(N'2023-12-15T00:15:17.110' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[loginhistory] OFF
GO
SET IDENTITY_INSERT [dbo].[merch] ON 

INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (1, N'/Photo/Tesla.png', N'Tesla', N'electro car', N'USA', 2900000, 2)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (2, N'/Photo/Toyota.png', N'Toyota', N'petrol', N'USA', 3500000, 7)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (3, N'/Photo/BMW.png', N'BMW', N'petrol', N'Germany', 4800000, 3)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (3017, N'/Photo/Mersedes.png', N'Mersedes', N'petrol', N'German', 7580000, 0)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (3019, N'/Photo/Zeekr.png', N'Zeekr', N'electro car', N'China', 4700000, 0)
SET IDENTITY_INSERT [dbo].[merch] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1, 1, 1, 1, CAST(N'2023-09-14' AS Date), 1256, 1200, 0, 1200, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (2, 2, 2, 2, CAST(N'2023-09-25' AS Date), 6673, 5000, 0, 6673, 5)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (3, 3, 3, 3, CAST(N'2023-09-28' AS Date), 4342, 9000, 0, 4342, 4)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (4, 3, 1, 1, CAST(N'2023-12-14' AS Date), 291, 2500, 125, 2375, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (5, 3, 1, 1, CAST(N'2023-12-14' AS Date), 525, 5900, 0, 5900, 6)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[point] ON 

INSERT [dbo].[point] ([id], [name], [photo]) VALUES (1, N'Пункт выдачи 1', N'/photo/point.jpg')
INSERT [dbo].[point] ([id], [name], [photo]) VALUES (2, N'Пункт выдачи 2', N'/photo/point2.jpg')
INSERT [dbo].[point] ([id], [name], [photo]) VALUES (3, N'Пункт выдачи 3', NULL)
SET IDENTITY_INSERT [dbo].[point] OFF
GO
SET IDENTITY_INSERT [dbo].[sostav] ON 

INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (1, 1, 1, 1, 1200, 0, 1)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (2, 2, 1, 2, 6673, 0, 2)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (3, 3, 1, 3, 4342, 0, 3)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (4, 2, 1, 1, 2500, 5, 4)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (5, 1, 1, 1, 2900, 0, 5)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (5, 3, 1, 1, 3000, 0, 6)
SET IDENTITY_INSERT [dbo].[sostav] OFF
GO
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([id], [status_name]) VALUES (1, N'новый')
INSERT [dbo].[status] ([id], [status_name]) VALUES (2, N'в работе')
INSERT [dbo].[status] ([id], [status_name]) VALUES (3, N'доставляется')
SET IDENTITY_INSERT [dbo].[status] OFF
GO
SET IDENTITY_INSERT [dbo].[type_user] ON 

INSERT [dbo].[type_user] ([id], [role]) VALUES (1, N'Администратор')
INSERT [dbo].[type_user] ([id], [role]) VALUES (2, N'Менеджер')
INSERT [dbo].[type_user] ([id], [role]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[type_user] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (1, N'admin', N'12345', 1)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (2, N'manager', N'12345', 2)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (3, N'user', N'12345', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (6, N'Vaga', N'12345', 3)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[loginhistory]  WITH CHECK ADD  CONSTRAINT [FK_loginhistory_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[loginhistory] CHECK CONSTRAINT [FK_loginhistory_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_point] FOREIGN KEY([id_point])
REFERENCES [dbo].[point] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_point]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_orders1] FOREIGN KEY([id_orders])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_orders1]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_user] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_user] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_user]
GO
USE [master]
GO
ALTER DATABASE [Vaga] SET  READ_WRITE 
GO
