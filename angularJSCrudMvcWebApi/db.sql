USE [master]
GO
/****** Object:  Database [angulardb]    Script Date: 26.12.2016 16:05:27 ******/
CREATE DATABASE [angulardb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'angulardb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\angulardb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'angulardb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\angulardb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [angulardb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [angulardb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [angulardb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [angulardb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [angulardb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [angulardb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [angulardb] SET ARITHABORT OFF 
GO
ALTER DATABASE [angulardb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [angulardb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [angulardb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [angulardb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [angulardb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [angulardb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [angulardb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [angulardb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [angulardb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [angulardb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [angulardb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [angulardb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [angulardb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [angulardb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [angulardb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [angulardb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [angulardb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [angulardb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [angulardb] SET  MULTI_USER 
GO
ALTER DATABASE [angulardb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [angulardb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [angulardb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [angulardb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [angulardb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [angulardb]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 26.12.2016 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (1, N'Deneme3', 103.0000)
INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (2, N'Sedat', 16.0000)
INSERT [dbo].[Products] ([Id], [Name], [Price]) VALUES (3, N'Asus', 10.0000)
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  StoredProcedure [dbo].[SP_Delete]    Script Date: 26.12.2016 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SP_Delete]
@id int
as
Delete From Products Where Id = @id

GO
/****** Object:  StoredProcedure [dbo].[SP_Insert]    Script Date: 26.12.2016 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Insert]
@name nvarchar(150),
@price money
as
Insert Into Products Values(@name,@price);

GO
/****** Object:  StoredProcedure [dbo].[SP_Select]    Script Date: 26.12.2016 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Select]
@id int
as
Select * From Products Where Id = @id

GO
/****** Object:  StoredProcedure [dbo].[SP_Update]    Script Date: 26.12.2016 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_Update]
@id int,
@name nvarchar(150),
@price money
as
Update Products Set Name= @name, Price = @price Where Id = @id

GO
/****** Object:  StoredProcedure [dbo].[SPSelectProducts]    Script Date: 26.12.2016 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SPSelectProducts]
AS
Select * From Products

GO
USE [master]
GO
ALTER DATABASE [angulardb] SET  READ_WRITE 
GO
