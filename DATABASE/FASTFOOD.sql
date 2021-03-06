USE [master]
GO
/****** Object:  Database [FASTFOOD]    Script Date: 12/8/2021 3:20:49 PM ******/
CREATE DATABASE [FASTFOOD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FASTFOOD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FASTFOOD.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FASTFOOD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FASTFOOD_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FASTFOOD] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FASTFOOD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FASTFOOD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FASTFOOD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FASTFOOD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FASTFOOD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FASTFOOD] SET ARITHABORT OFF 
GO
ALTER DATABASE [FASTFOOD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FASTFOOD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FASTFOOD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FASTFOOD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FASTFOOD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FASTFOOD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FASTFOOD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FASTFOOD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FASTFOOD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FASTFOOD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FASTFOOD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FASTFOOD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FASTFOOD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FASTFOOD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FASTFOOD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FASTFOOD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FASTFOOD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FASTFOOD] SET RECOVERY FULL 
GO
ALTER DATABASE [FASTFOOD] SET  MULTI_USER 
GO
ALTER DATABASE [FASTFOOD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FASTFOOD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FASTFOOD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FASTFOOD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FASTFOOD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FASTFOOD', N'ON'
GO
USE [FASTFOOD]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/8/2021 3:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usernameid] [nvarchar](20) NOT NULL,
	[id_product] [int] NOT NULL,
	[date] [date] NOT NULL,
	[amount] [int] NOT NULL,
	[discount] [int] NOT NULL,
	[total] [int] NOT NULL,
 CONSTRAINT [PK_Records] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/8/2021 3:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[discount] [int] NOT NULL,
	[img] [nvarchar](100) NOT NULL,
	[status] [bit] NOT NULL CONSTRAINT [DF_Products_status]  DEFAULT ((1)),
 CONSTRAINT [PK_Products_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slides]    Script Date: 12/8/2021 3:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [nvarchar](100) NOT NULL,
	[caption] [nvarchar](100) NULL,
	[content] [nvarchar](100) NULL,
	[active] [bit] NOT NULL CONSTRAINT [DF_Slides_active]  DEFAULT ((0)),
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/8/2021 3:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[role] [nvarchar](10) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](12) NOT NULL,
	[status] [bit] NOT NULL CONSTRAINT [DF_Users_status]  DEFAULT ((1)),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1, N'hi', 1, CAST(N'2021-10-25' AS Date), 1, 10, 18000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (2, N'hi1', 1, CAST(N'2021-10-26' AS Date), 8, 10, 144000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (3, N'hi1', 2, CAST(N'2021-10-26' AS Date), 2, 15, 25500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (4, N'hi1', 1, CAST(N'2021-10-26' AS Date), 2, 10, 36000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (5, N'hi1', 3, CAST(N'2021-10-26' AS Date), 3, 10, 54000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (6, N'hi', 1, CAST(N'2021-11-01' AS Date), 8, 10, 144000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (7, N'hi', 2, CAST(N'2021-11-01' AS Date), 2, 15, 25500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1006, N'hi1', 6, CAST(N'2021-11-07' AS Date), 4, 10, 90000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1007, N'hi1', 1, CAST(N'2021-11-11' AS Date), 1, 10, 18000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1008, N'hi1', 2, CAST(N'2021-11-11' AS Date), 1, 10, 14400)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1009, N'hi1', 3, CAST(N'2021-11-11' AS Date), 1, 15, 25500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1010, N'hi1', 4, CAST(N'2021-11-11' AS Date), 1, 10, 13500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1011, N'hi1', 5, CAST(N'2021-11-11' AS Date), 1, 10, 9000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1012, N'hi1', 6, CAST(N'2021-11-11' AS Date), 1, 10, 22500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1013, N'hi1', 7, CAST(N'2021-11-11' AS Date), 1, 10, 40500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1014, N'hi1', 8, CAST(N'2021-11-11' AS Date), 1, 10, 27000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1015, N'nvn', 1, CAST(N'2021-12-05' AS Date), 1, 10, 18000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1016, N'nvn', 2, CAST(N'2021-12-05' AS Date), 1, 10, 14400)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1017, N'nvn', 1, CAST(N'2021-12-05' AS Date), 1, 10, 18000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1018, N'nvn', 2, CAST(N'2021-12-05' AS Date), 1, 10, 14400)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1019, N'nvn', 1, CAST(N'2021-12-05' AS Date), 1, 10, 18000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1020, N'nvn', 2, CAST(N'2021-12-05' AS Date), 1, 10, 14400)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1021, N'nvn', 1, CAST(N'2021-12-05' AS Date), 1, 10, 18000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1022, N'nvn', 2, CAST(N'2021-12-05' AS Date), 1, 10, 14400)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1023, N'nvn', 1, CAST(N'2021-12-05' AS Date), 1, 10, 18000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1024, N'nvn', 2, CAST(N'2021-12-05' AS Date), 1, 10, 14400)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1025, N'nvn', 17, CAST(N'2021-12-05' AS Date), 1, 10, 13500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1026, N'nvn', 2, CAST(N'2021-12-05' AS Date), 1, 10, 14400)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1027, N'nvn', 18, CAST(N'2021-12-05' AS Date), 1, 10, 13500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1028, N'nvn', 19, CAST(N'2021-12-05' AS Date), 1, 10, 9000)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1029, N'nvn', 21, CAST(N'2021-12-05' AS Date), 1, 10, 10800)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1030, N'nvn', 2, CAST(N'2021-12-05' AS Date), 1, 10, 14400)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1031, N'nvn', 6, CAST(N'2021-12-05' AS Date), 1, 10, 22500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1032, N'nvn', 17, CAST(N'2021-12-05' AS Date), 1, 10, 13500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1033, N'nvn', 3, CAST(N'2021-12-06' AS Date), 1, 15, 25500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1034, N'nvn', 4, CAST(N'2021-12-08' AS Date), 1, 10, 13500)
INSERT [dbo].[Orders] ([id], [usernameid], [id_product], [date], [amount], [discount], [total]) VALUES (1035, N'nvn', 2, CAST(N'2021-12-08' AS Date), 1, 10, 14400)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (1, N'Cocacola', N'Drink', 20000, 0, N'cocacola vị nguyên bản', 10, N'1636618418182-cocacola.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (2, N'Bánh Bao', N'Food', 16000, 11, N'Bánh bao tròn vị', 10, N'1636638115436-banhBao.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (3, N'Bánh Gạo', N'Food', 30000, 18, N'Bánh gạo mềm , tròn vị yêu thương', 15, N'banhGao.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (4, N'Bánh mì', N'Food', 15000, 18, N'Bánh mì thơm ngon ', 10, N'banhMi.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (5, N'Bánh Su', N'Food', 10000, 20, N'Bánh su mềm mịn', 10, N'banhSu.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (6, N'Bánh tráng nướng', N'Food', 25000, 14, N'Bánh tráng nướng với đa dạng nguyên liệu, chiều lòng cả thực khách khó tính nhất.', 10, N'banhTrangNuong.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (7, N'Gà rán', N'Food', 45000, 9, N'Gà rán vỏ ngoài giàn tan, bên trong mềm mịn. Được chế biến bởi đầu bếp lâu năm trong nghề', 10, N'FriedChicken.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (8, N'Hamberger', N'Food', 30000, 11, N'Hamberger , vị ngon trên từng ngón tay', 10, N'hamberger.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (9, N'Hot dog', N'Food', 30000, 20, N'Hot dog nóng giòn', 10, N'hotdog.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (10, N'Khoai tây chiên', N'Food', 25000, 13, N'Khoai tây chiên không dầu, không béo, không ngán, là món ăn kèm yêu thích của nhiều người', 10, N'khoaiTayChien.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (11, N'pizza', N'Food', 150000, 15, N'Vị béo của phomai kết hợp cùng vị giòn tan của đế bánh.Một sự lựa chọn tuyệt vời cho một bữa ăn ngon', 10, N'pizza.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (12, N'Salad', N'Food', 20000, 5, N'Vị tươi mát của rau xanh kết hợp các loại nước sốt độc đáo và các nguyên liệu đi kèm sẽ giúp bừa ăn thêm lành mạnh và nhiều dinh dưỡng', 10, N'salad.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (13, N'Sandwich', N'Food', 15000, 10, N'Sandwich, sự lựa chọn tuyệt vời cho bữa sáng lành mạnh và nhiều dinh dưỡng', 10, N'sandwich.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (14, N'Sandwich lạt Otto', N'Food', 15000, 25, N'Sandwich có thể ăn ngay hoặc chế biến, ăn kèm với nhiều nguyên liệu hấp dẫn', 10, N'sandwichOtto.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (15, N'Xúc xích', N'Food', 25000, 25, N'Xúc xích được nhập khẩu tại Đức, đảm bảo thơm ngon, an toàn thực phẩm', 25, N'sausage.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (16, N'Xiên que', N'Food', 15000, 15, N'Xiên que đảm bảo an toàn vệ sinh thực phẩm, chất lượng nguyên liệu được đảm bảo an toàn, chế biến với nhiều nguyên liệu phong phú', 10, N'xienQue.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (17, N'7up', N'Drink', 15000, 18, N'Nước ngọt có ga. Quá đã', 10, N'7up.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (18, N'Nước giải khát 247', N'Drink', 15000, 14, N'247 chinh phục mọi thử thách', 10, N'247.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (19, N'Aquafina', N'Drink', 10000, 18, N'Vị ngon của sự tinh khiết', 10, N'aquafina.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (20, N'Nước dừa', N'Drink', 12000, 20, N'Nươc dừa tươi ', 10, N'coconut.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (21, N'Fanta', N'Drink', 12000, 19, N'Nước ngọt Fanta vị cam', 10, N'fanta.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (22, N'Fanta vị nho', N'Drink', 12000, 20, N'Fanda vị nho', 10, N'fantaNho.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (23, N'Ice vị đào', N'Drink', 12000, 20, N'nước ngọt vị đào', 10, N'IceViDao.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (24, N'Lipton', N'Drink', 15000, 20, N'Lipton', 10, N'lipton.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (25, N'Lipton vị chanh', N'Drink', 20000, 15, N'Lipton vị chanh', 10, N'liptonIceTea.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (26, N'Mirinda vị cam', N'Drink', 15000, 20, N'Mirinda vị cam', 10, N'MirindaOrange.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (27, N'Mirinda Soda kem', N'Drink', 15000, 25, N'Mirinda Soda kem', 25, N'MirindaSodaKem.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (28, N'Mirinda Xá xị', N'Drink', 15000, 25, N'Mirinda Xá xị', 25, N'mirindaXaXi.png', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (29, N'Number 1', N'Drink', 12000, 20, N'Number 1', 20, N'number1.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (30, N'Pepsi', N'Drink', 11000, 25, N'Pepsi', 25, N'pepsi.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (31, N'Red bull', N'Drink', 10000, 20, N'Red bull', 20, N'redBull.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (32, N'Revive', N'Drink', 9000, 25, N'Revive', 25, N'revive.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (33, N'Revive vị chanh muối', N'Drink', 9000, 20, N'Revive vị chanh muối', 20, N'reviveChanhMuoi.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (34, N'StrongBow', N'Drink', 15000, 25, N'StrongBow', 25, N'strongBow.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (35, N'Trà đào sả', N'Drink', 20000, 25, N'Trà đào sả', 25, N'traDaoSa.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (36, N'Trà xanh không độ', N'Drink', 12000, 20, N'Trà xanh không độ', 20, N'traXanhKhongDo.jpg', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (38, N'Abcxyz', N'food', 0, 0, N'1', 0, N'2021-10-23_224014.png', 1)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (43, N'Znguyen', N'Food', 100, 1000, N'ZNGUYEN', 10, N'1636708329493-thanhlysacsh.jpg', 0)
INSERT [dbo].[Products] ([id], [name], [type], [price], [quantity], [description], [discount], [img], [status]) VALUES (44, N'Zzngab', N'Food', 1000, 1000, N'ZZNGAB', 0, N'1636708488599-thanhlysacsh.jpg', 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Slides] ON 

INSERT [dbo].[Slides] ([id], [img], [caption], [content], [active]) VALUES (1, N'slide.jpg', N'Fast Food -Thế giới đồ ăn nhanh', N'Siêu ngon - Siêu bổ - Siêu rẻ -
Siêu nhanh', 1)
INSERT [dbo].[Slides] ([id], [img], [caption], [content], [active]) VALUES (2, N'bg_2.jpg', N'Fast Food - Tiêu chuẩn 4S', N'Siêu ngon - Siêu bổ - Siêu rẻ -
Siêu nhanh', 1)
INSERT [dbo].[Slides] ([id], [img], [caption], [content], [active]) VALUES (5, N'08122021092011-bg_1.jpg', N'Fast Food', N'Không cần mất thời gian vào bếp', 1)
SET IDENTITY_INSERT [dbo].[Slides] OFF
INSERT [dbo].[Users] ([username], [password], [role], [fullname], [email], [phone], [status]) VALUES (N'admin', N'202cb962ac59075b964b07152d234b70', N'ADMIN', N'Admin', N'admin@codevn.tk', N'09744228984', 1)
INSERT [dbo].[Users] ([username], [password], [role], [fullname], [email], [phone], [status]) VALUES (N'hi', N'202cb962ac59075b964b07152d234b70', N'USER', N'Hell1o', N'codervn77@gmail.com', N'0974428986', 1)
INSERT [dbo].[Users] ([username], [password], [role], [fullname], [email], [phone], [status]) VALUES (N'hi1', N'202cb962ac59075b964b07152d234b70', N'USER', N'Hihi', N'codervn77@gmail.com', N'0978888888', 1)
INSERT [dbo].[Users] ([username], [password], [role], [fullname], [email], [phone], [status]) VALUES (N'nhat', N'35eb7cca72023c8eae70ad11595bae67', N'USER', N'Nguyễn Văn Nhất', N'codervn77@gmail.com', N'0974428988', 1)
INSERT [dbo].[Users] ([username], [password], [role], [fullname], [email], [phone], [status]) VALUES (N'nvn', N'202cb962ac59075b964b07152d234b70', N'ADMIN', N'Nguyễn Văn Nhất', N'n18dccn154@student.ptithcm.edu.vn', N'0974428984', 1)
INSERT [dbo].[Users] ([username], [password], [role], [fullname], [email], [phone], [status]) VALUES (N'phuc', N'a9f92c59a884ca48a4d6aac39ef39831', N'USER', N'Phạm Đức Phú Phúc', N'phuphuc@gmail.com', N'0962792171', 1)
INSERT [dbo].[Users] ([username], [password], [role], [fullname], [email], [phone], [status]) VALUES (N'vn1', N'f87a3de7b5daa146560eaa3f61327b07', N'USER', N'Vn1', N'vn1@gmailnator.com', N'0979999999', 0)
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([id_product])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([usernameid])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
USE [master]
GO
ALTER DATABASE [FASTFOOD] SET  READ_WRITE 
GO
