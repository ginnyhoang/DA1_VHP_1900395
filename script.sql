USE [master]
GO
/****** Object:  Database [QLTP]    Script Date: 26/12/2021 9:58:05 CH ******/
CREATE DATABASE [QLTP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLTP.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLTP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLTP_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLTP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTP] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLTP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLTP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLTP] SET  MULTI_USER 
GO
ALTER DATABASE [QLTP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLTP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLTP]
GO
/****** Object:  Table [dbo].[LoaiTP]    Script Date: 26/12/2021 9:58:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiTP](
	[MaLoai] [char](10) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiTP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NoiChua]    Script Date: 26/12/2021 9:58:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NoiChua](
	[MaNC] [char](10) NOT NULL,
	[TenNC] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NoiChua] PRIMARY KEY CLUSTERED 
(
	[MaNC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThucPham]    Script Date: 26/12/2021 9:58:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThucPham](
	[MaTP] [char](10) NOT NULL,
	[TenTP] [nvarchar](50) NULL,
	[NgayHetHan] [date] NULL,
	[MaLoai] [char](10) NOT NULL,
	[MaNC] [char](10) NOT NULL,
 CONSTRAINT [PK_ThucPham] PRIMARY KEY CLUSTERED 
(
	[MaTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[LoaiTP] ([MaLoai], [TenLoai]) VALUES (N'NĐC       ', N'Nước Đóng Chai')
INSERT [dbo].[LoaiTP] ([MaLoai], [TenLoai]) VALUES (N'RC        ', N'Rau Củ')
INSERT [dbo].[LoaiTP] ([MaLoai], [TenLoai]) VALUES (N'TC        ', N'Trái Cây')
INSERT [dbo].[NoiChua] ([MaNC], [TenNC]) VALUES (N'TĐ        ', N'Tủ Đông')
INSERT [dbo].[ThucPham] ([MaTP], [TenTP], [NgayHetHan], [MaLoai], [MaNC]) VALUES (N'TP01      ', N'Chuối', CAST(N'2021-11-12' AS Date), N'TC        ', N'TĐ        ')
INSERT [dbo].[ThucPham] ([MaTP], [TenTP], [NgayHetHan], [MaLoai], [MaNC]) VALUES (N'TP02      ', N'Aquafina', CAST(N'2021-11-11' AS Date), N'NĐC       ', N'TĐ        ')
INSERT [dbo].[ThucPham] ([MaTP], [TenTP], [NgayHetHan], [MaLoai], [MaNC]) VALUES (N'TP03      ', N'Thịt heo tươi không cần tưới', CAST(N'2021-10-30' AS Date), N'RC        ', N'TĐ        ')
INSERT [dbo].[ThucPham] ([MaTP], [TenTP], [NgayHetHan], [MaLoai], [MaNC]) VALUES (N'TP04      ', N'hh', CAST(N'2021-11-20' AS Date), N'NĐC       ', N'TĐ        ')
INSERT [dbo].[ThucPham] ([MaTP], [TenTP], [NgayHetHan], [MaLoai], [MaNC]) VALUES (N'TP07      ', N'Lavie', CAST(N'2021-11-02' AS Date), N'NĐC       ', N'TĐ        ')
ALTER TABLE [dbo].[ThucPham]  WITH CHECK ADD  CONSTRAINT [FK_ThucPham_LoaiTP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiTP] ([MaLoai])
GO
ALTER TABLE [dbo].[ThucPham] CHECK CONSTRAINT [FK_ThucPham_LoaiTP]
GO
ALTER TABLE [dbo].[ThucPham]  WITH CHECK ADD  CONSTRAINT [FK_ThucPham_NoiChua] FOREIGN KEY([MaNC])
REFERENCES [dbo].[NoiChua] ([MaNC])
GO
ALTER TABLE [dbo].[ThucPham] CHECK CONSTRAINT [FK_ThucPham_NoiChua]
GO
USE [master]
GO
ALTER DATABASE [QLTP] SET  READ_WRITE 
GO
