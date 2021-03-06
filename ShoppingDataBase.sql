USE [master]
GO
/****** Object:  Database [ShoppingCart]    Script Date: 7/13/2021 4:24:54 PM ******/
CREATE DATABASE [ShoppingCart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingCart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShoppingCart.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShoppingCart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShoppingCart_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShoppingCart] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingCart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingCart] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingCart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingCart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingCart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingCart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingCart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingCart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingCart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingCart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingCart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingCart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingCart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingCart] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingCart] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingCart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingCart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingCart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingCart] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShoppingCart] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShoppingCart]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 7/13/2021 4:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [varchar](15) NOT NULL,
	[categoryName] [varchar](20) NULL,
 CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 7/13/2021 4:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderID] [uniqueidentifier] NOT NULL,
	[productID] [varchar](15) NOT NULL,
	[quantity] [int] NULL,
	[totalPrice] [float] NULL,
 CONSTRAINT [PK_tblOrderDetails_1] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 7/13/2021 4:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [uniqueidentifier] NOT NULL,
	[userID] [varchar](15) NOT NULL,
	[date] [date] NULL,
	[totalPrice] [float] NULL,
	[statusID] [varchar](20) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[address] [varchar](50) NULL,
	[paymentMethod] [varchar](20) NULL,
	[email] [varchar](25) NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 7/13/2021 4:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [varchar](15) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[categoryID] [varchar](15) NOT NULL,
	[statusID] [varchar](20) NOT NULL,
	[imageSrc] [varchar](50) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 7/13/2021 4:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](10) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 7/13/2021 4:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [varchar](20) NOT NULL,
	[statusName] [nvarchar](40) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/13/2021 4:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](15) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phoneNumber] [varchar](10) NULL,
	[password] [varchar](15) NULL,
	[roleID] [varchar](10) NOT NULL,
	[statusID] [varchar](20) NOT NULL,
	[email] [varchar](25) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (N'Cooking', N'Cooking Book')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (N'Kid', N'Kid Book')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (N'Mysteries', N'Mysteries Book')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (N'Romance', N'Romance Book')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (N'Travel', N'Travel Book')
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'8588eec2-68d7-4e15-90cb-09c563fbb274', N'Book001', 8, 240)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'3de82753-c3b7-4bae-af88-18f9286d2478', N'Book001', 8, 240)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'3de82753-c3b7-4bae-af88-18f9286d2478', N'Book002', 6, 210)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'3de82753-c3b7-4bae-af88-18f9286d2478', N'Book003', 4, 60)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'ca434a96-b0f8-4a44-bc70-1a5d2496cee0', N'Book002', 5, 175)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'fd1ab5f0-f804-4f61-938a-1d8443a05ca0', N'Book002', 5, 175)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'fd1ab5f0-f804-4f61-938a-1d8443a05ca0', N'Book005', 5, 100)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'a6e1ae10-4557-49b4-b4e7-337023a73457', N'Book005', 2, 40)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'9daae469-01bb-4233-b03c-43a88fb7fa0a', N'Book002', 2, 70)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'9daae469-01bb-4233-b03c-43a88fb7fa0a', N'Book003', 5, 75)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'9daae469-01bb-4233-b03c-43a88fb7fa0a', N'Book005', 7, 140)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'357c77be-ddc2-44f1-9853-6df52e19fcbf', N'Book001', 5, 150)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'357c77be-ddc2-44f1-9853-6df52e19fcbf', N'Book007', 15, 525)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'357c77be-ddc2-44f1-9853-6df52e19fcbf', N'Book011', 25, 1250)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'0db5722c-2128-4af5-9dc9-79623df871d6', N'Book001', 8, 240)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'55d7438f-aad8-411c-b7bc-86713b4ebd9d', N'Book001', 1, 30)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'55d7438f-aad8-411c-b7bc-86713b4ebd9d', N'Book002', 2, 70)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'55d7438f-aad8-411c-b7bc-86713b4ebd9d', N'Book003', 1, 15)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'55d7438f-aad8-411c-b7bc-86713b4ebd9d', N'Book005', 1, 20)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'55d7438f-aad8-411c-b7bc-86713b4ebd9d', N'Book006', 1, 15)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'b4f2639c-13c5-435b-8ace-9aaba953f808', N'Book001', 3, 90)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'00636f83-8dfd-4cfc-b226-abd4bbcd23ca', N'Book001', 1, 30)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'00636f83-8dfd-4cfc-b226-abd4bbcd23ca', N'Book002', 2, 70)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'00636f83-8dfd-4cfc-b226-abd4bbcd23ca', N'Book003', 1, 15)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'00636f83-8dfd-4cfc-b226-abd4bbcd23ca', N'Book005', 1, 20)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'00636f83-8dfd-4cfc-b226-abd4bbcd23ca', N'Book006', 1, 15)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'0ee7d207-0d32-405d-b8d1-cb3d203dbee5', N'Book001', 2, 60)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'0ee7d207-0d32-405d-b8d1-cb3d203dbee5', N'Book002', 1, 35)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'0ee7d207-0d32-405d-b8d1-cb3d203dbee5', N'Book003', 1, 15)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'0ee7d207-0d32-405d-b8d1-cb3d203dbee5', N'Book005', 2, 40)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'0ee7d207-0d32-405d-b8d1-cb3d203dbee5', N'Book006', 2, 30)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'9ae4b1ce-fc2f-44fa-a87d-d15dac0f4236', N'Book005', 4, 80)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'b2b11b7f-5961-4bf8-a95a-e209c6dc46f3', N'Book001', 8, 240)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'4c0a712f-8051-40be-aa32-eeccdb44eb88', N'Book008', 10, 400)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'bcaa4bd0-85f2-498a-bdea-f676262a478c', N'Book001', 8, 240)
INSERT [dbo].[tblOrderDetails] ([orderID], [productID], [quantity], [totalPrice]) VALUES (N'8f0e9d09-eed7-4143-b22b-f95231791f5d', N'Book001', 8, 240)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'8588eec2-68d7-4e15-90cb-09c563fbb274', N'admin3', CAST(N'2021-07-07' AS Date), 240, N'Received', N'0703431760', N'43/3F ap Hau Lan', N'Payment on delivery', N'daohuuduc.910@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'3de82753-c3b7-4bae-af88-18f9286d2478', N'admin3', CAST(N'2021-07-13' AS Date), 510, N'Received', N'0703431760', N'43/3F ap Hau Lan, xa Ba Diem', N'Payment on delivery', N'daohuuduc.911@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'ca434a96-b0f8-4a44-bc70-1a5d2496cee0', N'admin3', CAST(N'2021-07-12' AS Date), 175, N'Canceled', N'0703431760', N'43/3F ap Hau Lan, xa Ba Diem', N'Payment on delivery', N'daohuuduc.911@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'fd1ab5f0-f804-4f61-938a-1d8443a05ca0', N'admin3', CAST(N'2021-07-09' AS Date), 275, N'Canceled', N'0703431760', N'43/3F ap Hau Lan', N'Payment on delivery', N'daohuuduc.910@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'a6e1ae10-4557-49b4-b4e7-337023a73457', N'admin3', CAST(N'2021-07-13' AS Date), 40, N'Received', N'0703431760', N'43/3F ap Hau Lan, xa Ba Diem', N'Payment on delivery', N'daohuuduc.911@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'9daae469-01bb-4233-b03c-43a88fb7fa0a', N'admin3', CAST(N'2021-07-13' AS Date), 285, N'Canceled', N'0703431760', N'43/3F ap Hau Lan, xa Ba Diem', N'Payment on delivery', N'daohuuduc.911@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'357c77be-ddc2-44f1-9853-6df52e19fcbf', N'admin3', CAST(N'2021-07-13' AS Date), 1925, N'Canceled', N'0703431760', N'43/3F ap Hau Lan, xa Ba Diem', N'Payment on delivery', N'daohuuduc.911@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'0db5722c-2128-4af5-9dc9-79623df871d6', N'admin3', CAST(N'2021-07-07' AS Date), 240, N'Canceled', N'0703431760', N'43/3F ap Hau Lan', N'Payment on delivery', N'daohuuduc.910@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'55d7438f-aad8-411c-b7bc-86713b4ebd9d', N'admin3', CAST(N'2021-04-07' AS Date), 150, N'Received', N'0703431760', N'43/3F ap Hau Lan', N'Payment on delivery', N'daohuuduc.910@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'b4f2639c-13c5-435b-8ace-9aaba953f808', N'user123', CAST(N'2021-11-07' AS Date), 90, N'Shipping', N'0703431760', N'43/3f Hau Lan', N'Payment on delivery', N'daohuuduc.910@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'00636f83-8dfd-4cfc-b226-abd4bbcd23ca', N'admin3', CAST(N'2021-04-07' AS Date), 150, N'Canceled', N'0703431760', N'43/3F ap Hau Lan', N'Payment on delivery', N'daohuuduc.910@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'0ee7d207-0d32-405d-b8d1-cb3d203dbee5', N'admin3', CAST(N'2021-04-07' AS Date), 180, N'Canceled', N'dfgdf', N'gdfgdfgdf', N'Payment on delivery', N'dfgdf')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'9ae4b1ce-fc2f-44fa-a87d-d15dac0f4236', N'admin3', CAST(N'2021-07-13' AS Date), 80, N'Received', N'0703431760', N'43/3F ap Hau Lan, xa Ba Diem', N'Payment on delivery', N'daohuuduc.911@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'b2b11b7f-5961-4bf8-a95a-e209c6dc46f3', N'admin3', CAST(N'2021-04-07' AS Date), 240, N'Canceled', N'0703431760', N'43/3F ap Hau Lan', N'Payment on delivery', N'daohuuduc.910@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'4c0a712f-8051-40be-aa32-eeccdb44eb88', N'admin3', CAST(N'2021-07-13' AS Date), 400, N'Canceled', N'0703431760', N'43/3F ap Hau Lan, xa Ba Diem', N'Payment on delivery', N'daohuuduc.911@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'bcaa4bd0-85f2-498a-bdea-f676262a478c', N'admin3', CAST(N'2021-07-07' AS Date), 240, N'Canceled', N'0703431760', N'43/3F ap Hau Lan', N'Payment on delivery', N'daohuuduc.910@gmail.com')
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [totalPrice], [statusID], [phone], [address], [paymentMethod], [email]) VALUES (N'8f0e9d09-eed7-4143-b22b-f95231791f5d', N'admin3', CAST(N'2021-04-07' AS Date), 240, N'Received', N'0703431760', N'43/3F ap Hau Lan', N'Payment on delivery', N'daohuuduc.910@gmail.com')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book001', N'Vegetable Simple', 30, 24, N'Cooking', N'Available', N'images/VegetableSimple.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book002', N'Harry Potter and the Sorcerer''s Stone', 35, 10, N'Mysteries', N'Available', N'images/HarryPotterandtheSorcerer''sStone.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book003', N'Mister Seahorse', 15, 22, N'Kid', N'Available', N'images/MisterSeahorse.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book004', N'Follow Your Heart', 30, 29, N'Romance', N'Available', N'images/FollowYourHeart.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book005', N'Stranger Things', 20, 23, N'Mysteries', N'Available', N'images/StrangerThings.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book006', N'Into the Wild', 15, 20, N'Travel', N'Available', N'images/IntoTheWild.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book007', N'Harry Potter and the Chamber of Secrets', 35, 15, N'Mysteries', N'Available', N'images/HarryPotterandtheChamberofSecrets.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book008', N'Harry Potter and the Prisoner of Azkaban', 40, 10, N'Mysteries', N'Available', N'images/HarryPotterandthePrisonerofAzkaban.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book009', N'Harry Potter and the Goblet of Fire', 45, 20, N'Mysteries', N'Available', N'images/HarryPotterandtheGobletofFire.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book010', N'Harry Potter And The Order Of The Phoenix', 55, 25, N'Mysteries', N'Available', N'images/HarryPotterandOrderofthePhoenix.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book011', N'
Harry Potter and the Half-Blood Prince', 50, 40, N'Mysteries', N'Available', N'images/HarryPotterandtheHalf-BloodPrince.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity], [categoryID], [statusID], [imageSrc]) VALUES (N'Book012', N'Harry Potter and the Deathly Hallows', 50, 38, N'Mysteries', N'Available', N'images/HarryPotterandtheDeathlyHallows.jpg')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'Active', N'Activated User')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'Available', N'Available Book')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'Canceled', N'Order Is Canceled')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'Inactive', N'Deactivated User')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'OutOfShock', N'Book Is Out Of Book')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'Received', N'Order Is Received')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'Shipping', N'Order Is Shipping')
INSERT [dbo].[tblUsers] ([userID], [fullName], [address], [phoneNumber], [password], [roleID], [statusID], [email]) VALUES (N'admin', N'AdminUser', N'43/3F, ap Hau Lan, xa Ba Diem', N'0703431760', N'123456', N'AD', N'Active', N'daohuuduc.910@gmail.com')
INSERT [dbo].[tblUsers] ([userID], [fullName], [address], [phoneNumber], [password], [roleID], [statusID], [email]) VALUES (N'admin2', N'Dao Huu Duc', N'43/3F Hau Lan Ba Diem, xzczx', N'0703431760', N'123456', N'AD', N'Active', N'kaizer71211@gmail.com')
INSERT [dbo].[tblUsers] ([userID], [fullName], [address], [phoneNumber], [password], [roleID], [statusID], [email]) VALUES (N'admin3', N'Huu Duc', N'43/3F ap Hau Lan, xa Ba Diem', N'0703431760', N'123456', N'US', N'Active', N'daohuuduc.911@gmail.com')
INSERT [dbo].[tblUsers] ([userID], [fullName], [address], [phoneNumber], [password], [roleID], [statusID], [email]) VALUES (N'harry7121', N'Harry', N'43/3f', N'0703431760', N'123456', N'US', N'Active', N'kaizer7121@gmail.com')
INSERT [dbo].[tblUsers] ([userID], [fullName], [address], [phoneNumber], [password], [roleID], [statusID], [email]) VALUES (N'user1', N'Huu Duc', N'', N'', N'123456', N'US', N'Active', N'')
INSERT [dbo].[tblUsers] ([userID], [fullName], [address], [phoneNumber], [password], [roleID], [statusID], [email]) VALUES (N'user123', N'Harry', N'43/3f', N'0703431760', N'123456', N'US', N'Active', N'kaizer7121@gmail.com')
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategories]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblStatus]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [ShoppingCart] SET  READ_WRITE 
GO
