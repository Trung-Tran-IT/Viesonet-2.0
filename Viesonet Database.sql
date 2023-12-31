USE [master]
GO
/****** Object:  Database [Viesonet_DATN]    Script Date: 14/12/2023 10:56:08 pm ******/
CREATE DATABASE [Viesonet_DATN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Viesonet_DATN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Viesonet_DATN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Viesonet_DATN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Viesonet_DATN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Viesonet_DATN] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Viesonet_DATN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Viesonet_DATN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET ARITHABORT OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Viesonet_DATN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Viesonet_DATN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Viesonet_DATN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Viesonet_DATN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Viesonet_DATN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Viesonet_DATN] SET  MULTI_USER 
GO
ALTER DATABASE [Viesonet_DATN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Viesonet_DATN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Viesonet_DATN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Viesonet_DATN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Viesonet_DATN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Viesonet_DATN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Viesonet_DATN', N'ON'
GO
ALTER DATABASE [Viesonet_DATN] SET QUERY_STORE = OFF
GO
USE [Viesonet_DATN]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[PhoneNumber] [nvarchar](12) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[UserId] [nvarchar](12) NULL,
	[StatusId] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK__Accounts__85FB4E398F7324AB] PRIMARY KEY CLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStatus]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStatus](
	[StatusId] [int] NOT NULL,
	[StatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK__AccountS__C8EE206340F83A0F] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorId] [nvarchar](70) NOT NULL,
	[ColorName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CommentDate] [datetime] NULL,
	[UserId] [nvarchar](12) NULL,
	[PostId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryAddress]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceID] [int] NULL,
	[ProvinceName] [nvarchar](50) NULL,
	[DistrictID] [int] NULL,
	[DistrictName] [nvarchar](50) NULL,
	[WardCode] [int] NULL,
	[WardName] [nvarchar](50) NULL,
	[UserId] [nvarchar](12) NOT NULL,
	[DetailAddress] [nvarchar](max) NULL,
	[DeliveryPhone] [nvarchar](12) NULL,
	[AddressStore] [bit] NULL,
 CONSTRAINT [PK_DeliveryAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteProducts]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](12) NOT NULL,
	[ProductId] [int] NOT NULL,
	[FavoriteDate] [datetime] NULL,
 CONSTRAINT [PK_FavoriteProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[LikeId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](12) NULL,
	[PostId] [int] NULL,
	[LikeDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[LikeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follow]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow](
	[FollowId] [int] IDENTITY(1,1) NOT NULL,
	[followerId] [nvarchar](12) NULL,
	[followingId] [nvarchar](12) NULL,
	[FollowDate] [date] NULL,
 CONSTRAINT [PK__Follow__2CE810AE6337F63C] PRIMARY KEY CLUSTERED 
(
	[FollowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NULL,
	[UserId] [nvarchar](12) NULL,
	[ticketCount] [int] NULL,
	[TotalAmount] [float] NULL,
	[BuyDate] [date] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NULL,
	[ImageUrl] [varchar](max) NULL,
	[Type] [bit] NULL,
 CONSTRAINT [PK__Images__7516F70CF44FBBB7] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interactions]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interactions](
	[InteracId] [int] IDENTITY(1,1) NOT NULL,
	[InteractingPerson] [varchar](50) NULL,
	[InteractedPerson] [varchar](50) NULL,
	[InteractionCount] [int] NULL,
	[MostRecentInteractionDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[MediaId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[MediaUrl] [nvarchar](max) NULL,
	[Type] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessId] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [nvarchar](12) NULL,
	[ReceiverId] [nvarchar](12) NULL,
	[content] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[SendDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationContent] [nvarchar](200) NULL,
	[ReceiverId] [nvarchar](12) NULL,
	[SenderId] [nvarchar](12) NULL,
	[PostId] [int] NULL,
	[NotificationTypeId] [int] NULL,
	[NotificationDate] [datetime] NULL,
	[NotificationStatus] [bit] NULL,
 CONSTRAINT [PK__Notifica__20CF2E12C616DA6B] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationType]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK__Notifica__516F03B56E6E45BD] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[OriginalPrice] [decimal](10, 2) NULL,
	[SalePrice] [decimal](10, 2) NULL,
	[Color] [nvarchar](50) NULL,
 CONSTRAINT [PK__OrderDet__D3B9D36CFA1F3C5C] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](12) NULL,
	[OrderDate] [datetime] NULL,
	[StatusId] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[TotalAmount] [float] NULL,
	[ShippingFee] [float] NULL,
 CONSTRAINT [PK__Orders__C3905BAFD1094619] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[UserId] [nvarchar](12) NULL,
	[LikeCount] [int] NULL,
	[CommentCount] [int] NULL,
	[PostDate] [datetime] NULL,
 CONSTRAINT [PK__Posts__AA1260182AB151F9] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColors]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ColorId] [nvarchar](70) NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ProductColors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[OriginalPrice] [decimal](10, 2) NOT NULL,
	[Promotion] [decimal](10, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ViewsCount] [int] NULL,
	[RatingsCount] [int] NULL,
	[SoldQuantity] [int] NULL,
	[Height] [float] NULL,
	[Width] [float] NULL,
	[Weight] [float] NULL,
	[Length] [float] NULL,
	[Material] [nvarchar](max) NULL,
	[DatePost] [datetime] NULL,
	[UserId] [nvarchar](12) NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsTemp]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsTemp](
	[TempId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[OriginalPrice] [decimal](10, 2) NOT NULL,
	[DatePost] [datetime] NULL,
	[UserName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[PromotionId] [int] IDENTITY(1,1) NOT NULL,
	[PercentValue] [decimal](10, 2) NOT NULL,
	[MinimumValue] [decimal](10, 2) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Code] [nvarchar](12) NULL,
 CONSTRAINT [PK__Promotio__52C42F2FA39AD94D] PRIMARY KEY CLUSTERED 
(
	[PromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[UserId] [nvarchar](12) NULL,
	[RatingValue] [int] NULL,
	[RatingContent] [nvarchar](max) NULL,
	[RatingDate] [datetime] NULL,
 CONSTRAINT [PK__Ratings__FCCDF87C2AF33893] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RejectProducts]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RejectProducts](
	[RejectId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ProductName] [nvarchar](max) NULL,
	[Username] [nvarchar](100) NULL,
	[OriginalPrice] [decimal](10, 2) NULL,
	[Date] [date] NULL,
	[Reason] [nvarchar](100) NULL,
 CONSTRAINT [PK_RejectProduct] PRIMARY KEY CLUSTERED 
(
	[RejectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reply]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply](
	[ReplyId] [int] IDENTITY(1,1) NOT NULL,
	[ReplyContent] [nvarchar](200) NOT NULL,
	[CommentId] [int] NULL,
	[ResponderId] [nvarchar](12) NULL,
	[ReceiverId] [nvarchar](12) NULL,
	[ReplyDate] [datetime] NULL,
 CONSTRAINT [PK__Reply__C25E46096ED8A4B8] PRIMARY KEY CLUSTERED 
(
	[ReplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Returns]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Returns](
	[ReturnId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ReturnDate] [datetime] NULL,
	[Reason] [nvarchar](150) NULL,
 CONSTRAINT [PK_Returns] PRIMARY KEY CLUSTERED 
(
	[ReturnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](12) NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Color] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TotalTicket]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalTicket](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](12) NULL,
	[Ticket] [int] NULL,
 CONSTRAINT [PK_TotalTicket] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [nvarchar](12) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[Address] [nvarchar](255) NULL,
	[Relationship] [nvarchar](40) NULL,
	[Introduction] [nvarchar](100) NULL,
	[Gender] [bit] NULL,
	[Birthday] [date] NULL,
	[Avatar] [nvarchar](max) NULL,
	[ViolationCount] [int] NULL,
	[Background] [nvarchar](max) NULL,
	[CreateDate] [date] NULL,
	[AccessTime] [datetime] NULL,
 CONSTRAINT [PK__Users__1788CC4CC4BE5522] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViolationProducts]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViolationProducts](
	[ViolationId] [int] IDENTITY(1,1) NOT NULL,
	[ReportDate] [datetime] NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [nvarchar](12) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ViolationProduct] PRIMARY KEY CLUSTERED 
(
	[ViolationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Violations]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Violations](
	[ViolationId] [int] IDENTITY(1,1) NOT NULL,
	[ReportDate] [datetime] NULL,
	[PostId] [int] NOT NULL,
	[UserId] [nvarchar](12) NOT NULL,
	[ViolationTypeId] [int] NOT NULL,
	[ViolationStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ViolationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViolationTypes]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViolationTypes](
	[ViolationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ViolationDescription] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK__Violatio__3B1A4D1D77FBE28C] PRIMARY KEY CLUSTERED 
(
	[ViolationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0000000001', N'$2a$10$zmY0wZnozaidyVpdNSQ7f.UN0lNmUOU4P7J33nDmtfLHjwoQOBcqW', N'kietle@gmail.com', N'NQQS81361886', 1, 1)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0000000002', N'$2a$10$8u.uwjskU6wwMEBnA6JTqe/oYt0x0THBJFetXLZ/owPXqeKRjZbI.', N'tham@gmail.com', N'IKSX45792153', 1, 2)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0123450001', N'$2a$10$.LTG.dakBo8vU0ZTCmIhUOrwvqg9rzEupaHrhujYDZ9Fpwr8ESZnu', N'ttmt1801@gmail.com', N'NEBY24305636', 2, 4)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0123450002', N'$2a$10$TbSkK7P7EpJqechQY/8MdeJZBldVct4ZZ5d42E3R0YF7I/SLnYbm6', N'quyhdpc04119@fpt.edu.vn', N'BZOL98493464', 1, 2)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0123450003', N'$2a$10$nE8ju1q1LiQ5z2zWbzrzXOuIY5elMMaKB2N1kPtdNQP5KG4vanpWW', N'vyltpc04067@fpt.edu.vn', N'UMJW24625532', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0123450004', N'$2a$10$HDzl1GKhn2bhDTQA4oqpKeCL2c7Owj2CZmNX96xiNW/2V6DKCjDMC', N'tuonglqpc040126@fpt.edu.vn', N'BQDQ46501241', 1, 4)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0123450005', N'$2a$10$HzCtd3lg1BrWujp.WX9P1O/5Y7g6L/fp1aQNqcQuobUTC5vDWZrVW', N'daynewtran@gmail.com', N'WHZN28606380', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0123450006', N'$2a$10$0emfzq/zoCjhXTNaIs.NYe7fsNsm62sV4zNd/kBpZCybDEHtyEvaS', N'lechithien123@gmail.com', N'ODPG49260468', 1, 4)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0123450007', N'$2a$10$OXD5mvHlFuJRVhObffM2BeQNBGS4K4KC8DsXcfSY3HhV9j5sRQ4m2', N'khanghuynh18@gmail.com', N'SUZP68387176', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0123450008', N'$2a$10$cc74v0NA4.br3EfkUMT2CuF84PcHKBHTT7O0scJiT4Nodi/VSqji.', N'trangam@gmail.com', N'KODS13374719', 1, 4)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0123450009', N'$2a$10$dqBrJxbif1qJXzPjr9xGx.YDm6X1u4nRiXMNzaE2kltWWVwXBsh0C', N'ngocvy@gmail.com', N'MZHS76059192', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0123450010', N'$2a$10$C9GA04/H6vuZMkB4tCaQd.5WAc0PlCVhw36elegXAwuPbkEeo91YC', N'vananh20@gmail.com', N'TNFH99027885', 1, 4)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0123456789', N'$2a$10$wddnmP4gDyhhtDDxEFXhlOHPj0VQPWGiAQyympbJ7xkT8MINwj6mW', N'lyquoctuong272@gmail.com', N'QQTD02705141', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0767161102', N'123', N'huynhduyquy2001@gmail.co', N'190720232311', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0793960634', N'$2a$10$NA.a/nouSFPdlxfJjs4HqekBtZnsnEJMkjis3n2cIgXnj7UVtqDf.', N'tt@gmail.com', N'RTYC46956549', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790001', N'123', N'trung@gmail.com', N'UI001', 1, 1)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790002', N'123', N'hiungu@gmail.com', N'UI002', 1, 2)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790003', N'123', N'16gb@gmail.com', N'UI003', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790004', N'123', N'tuongu@gmail.com', N'UI004', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790005', N'123', N'hong@gmail.com', N'UI005', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790006', N'111', N'khanghi@gmail.com', N'UI006', 1, 1)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790007', N'123', N'hoangphitan@gmail.com', N'UI007', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790008', N'123', N'thamne@gmail.com', N'UI008', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790009', N'123', N'vuonggia@gmail.com', N'UI009', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790010', N'123', N'ngoanne@gmail.com', N'UI010', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790011', N'123', N'duydoan@gmail.com', N'UI011', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790012', N'123', N'vucat@gmail.com', N'UI012', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790013', N'123', N'lamhuyen@gmail.com', N'UI013', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790014', N'123', N'ngophuong@gmail.com', N'UI014', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790015', N'123', N'diepbang@gmail.com', N'UI015', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790016', N'123', N'vantrong@gmail.com', N'UI016', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790017', N'123', N'linham@gmail.com', N'UI017', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790018', N'123', N'thanhlong@gmail.com', N'UI018', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790019', N'123', N'quanloi@gmail.com', N'UI019', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790020', N'123', N'dieunhi@gmail.com', N'UI020', 1, 3)
INSERT [dbo].[Accounts] ([PhoneNumber], [Password], [Email], [UserId], [StatusId], [RoleId]) VALUES (N'0939790021', N'123', N'nhatan@gmail.com', N'UI021', 1, 3)
GO
INSERT [dbo].[AccountStatus] ([StatusId], [StatusName]) VALUES (1, N'Công khai')
INSERT [dbo].[AccountStatus] ([StatusId], [StatusName]) VALUES (2, N'Chỉ theo dõi')
INSERT [dbo].[AccountStatus] ([StatusId], [StatusName]) VALUES (3, N'Tạm ẩn')
INSERT [dbo].[AccountStatus] ([StatusId], [StatusName]) VALUES (4, N'Bị khóa')
GO
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (N'1', N'Đỏ')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (N'2', N'Vàng')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (N'3', N'Cam')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (N'4', N'Xanh lục')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (N'5', N'Xanh dương')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (N'6', N'Tím')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (N'7', N'Hồng')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (N'8', N'Đen')
INSERT [dbo].[Colors] ([ColorId], [ColorName]) VALUES (N'9', N'Trắng')
GO
SET IDENTITY_INSERT [dbo].[DeliveryAddress] ON 

INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (9, 267, N'Hòa Bình', 2163, N'Huyện Mai Châu', 800052, N'Xã Đồng Tân', N'TNFH99027885', N'', N'03872762234', 0)
INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (10, 266, N'Sơn La', 2267, N'Huyện Yên Châu', 140812, N'Xã Sập Vạt', N'TNFH99027885', N'hẻm 12', N'03872762411', 1)
INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (11, 262, N'Bình Định', 3279, N'Huyện Tây Sơn', 370806, N'Xã Bình Thuận', N'TNFH99027885', N'hẻm 11', N'03872762422', 0)
INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (13, 202, N'Hồ Chí Minh', 1444, N'Quận 3', 20305, N'Phường 5', N'BQDQ46501241', N'Hẻm 3', N'0123450004', 1)
INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (14, 216, N'Đồng Tháp', 1961, N'Huyện Lấp Vò', 500803, N'Xã Bình Thạnh Trung', N'BZOL98493464', N'81', N'0123450002', 1)
INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (15, 220, N'Cần Thơ', 3250, N'Huyện Phong Điền', 550506, N'Xã Tân Thới', N'TNFH99027885', N'', N'0123450004', 0)
INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (16, 219, N'Kiên Giang', 2132, N'Huyện Gò Quao', 540806, N'Xã Vĩnh Hòa Hưng Bắc', N'TNFH99027885', N'', N'03872762422', 0)
INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (23, 262, N'Bình Định', 3279, N'Huyện Tây Sơn', 370814, N'Xã Tây Xuân', N'NEBY24305636', N'213', N'0939790299', 0)
INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (24, 268, N'Hưng Yên', 1828, N'Huyện Yên Mỹ', 220513, N'Xã Trung Hòa', N'NEBY24305636', N'3123', N'0939790299', 0)
INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (25, 267, N'Hòa Bình', 2157, N'Huyện Lạc Thủy', 230905, N'Xã Cố Nghĩa', N'BQDQ46501241', N'123', N'0939790299', 1)
INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (26, 264, N'Lai Châu', 1989, N'Huyện Phong Thổ', 70303, N'Xã Dào San', N'KODS13374719', N'123', N'0939790299', 1)
INSERT [dbo].[DeliveryAddress] ([Id], [ProvinceID], [ProvinceName], [DistrictID], [DistrictName], [WardCode], [WardName], [UserId], [DetailAddress], [DeliveryPhone], [AddressStore]) VALUES (36, 268, N'Hưng Yên', 2194, N'Huyện Phù Cừ', 220712, N'Xã Tiền Tiến', N'ODPG49260468', N'123', N'0939790299', 1)
SET IDENTITY_INSERT [dbo].[DeliveryAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[FavoriteProducts] ON 

INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (1, N'BQDQ46501241', 6, CAST(N'2023-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (2, N'BZOL98493464', 7, CAST(N'2023-09-18T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (3, N'IKSX45792153', 9, CAST(N'2023-09-18T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (4, N'KODS13374719', 10, CAST(N'2023-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (5, N'MZHS76059192', 13, CAST(N'2023-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (7, N'NQQS81361886', 15, CAST(N'2023-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (8, N'ODPG49260468', 14, CAST(N'2023-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (9, N'ODPG49260468', 28, CAST(N'2023-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (10, N'RTYC46956549', 13, CAST(N'2023-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (11, N'RTYC46956549', 29, CAST(N'2023-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (12, N'SUZP68387176', 10, CAST(N'2023-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (13, N'SUZP68387176', 30, CAST(N'2023-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (14, N'TNFH99027885', 9, CAST(N'2023-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (15, N'TNFH99027885', 31, CAST(N'2023-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (16, N'UMJW24625532', 7, CAST(N'2023-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (17, N'UMJW24625532', 32, CAST(N'2023-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (18, N'WHZN28606380', 6, CAST(N'2023-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (19, N'WHZN28606380', 33, CAST(N'2023-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (22, N'NEBY24305636', 6, CAST(N'2023-10-04T14:35:41.557' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (23, N'NEBY24305636', 14, CAST(N'2023-10-04T14:35:41.563' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (24, N'NEBY24305636', 15, CAST(N'2023-10-04T16:13:50.380' AS DateTime))
INSERT [dbo].[FavoriteProducts] ([Id], [UserId], [ProductId], [FavoriteDate]) VALUES (29, N'NEBY24305636', 33, CAST(N'2023-11-07T19:59:27.113' AS DateTime))
SET IDENTITY_INSERT [dbo].[FavoriteProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([LikeId], [UserId], [PostId], [LikeDate]) VALUES (256, N'TNFH99027885', 1245, CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Favorites] ([LikeId], [UserId], [PostId], [LikeDate]) VALUES (257, N'TNFH99027885', 1244, CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Favorites] ([LikeId], [UserId], [PostId], [LikeDate]) VALUES (258, N'TNFH99027885', 1243, CAST(N'2023-12-01' AS Date))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[Follow] ON 

INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (1, N'UI003', N'UI006', CAST(N'2023-06-20' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (2, N'UI004', N'UI006', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (4, N'UI006', N'UI005', CAST(N'2023-06-17' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (5, N'UI006', N'UI010', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (6, N'UI008', N'UI010', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (7, N'UI009', N'UI010', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (8, N'UI006', N'UI008', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (9, N'UI011', N'UI003', CAST(N'2023-06-29' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (10, N'UI011', N'UI004', CAST(N'2023-06-20' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (11, N'UI011', N'UI005', CAST(N'2023-06-20' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (12, N'UI011', N'UI006', CAST(N'2023-06-20' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (13, N'UI011', N'UI010', CAST(N'2023-06-16' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (15, N'UI010', N'UI006', CAST(N'2023-07-29' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (19, N'UI006', N'UI003', CAST(N'2023-07-30' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (20, N'UI006', N'UI004', CAST(N'2023-07-30' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (23, N'UI005', N'UI003', CAST(N'2023-07-31' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (75, N'UI005', N'UI010', CAST(N'2023-08-03' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (109, N'UI005', N'UI011', CAST(N'2023-08-03' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (110, N'BZOL98493464', N'NEBY24305636', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (113, N'UMJW24625532', N'NEBY24305636', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (117, N'BZOL98493464', N'UI005', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (122, N'BQDQ46501241', N'NEBY24305636', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (123, N'BQDQ46501241', N'BZOL98493464', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (124, N'WHZN28606380', N'NEBY24305636', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (125, N'WHZN28606380', N'BZOL98493464', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (126, N'WHZN28606380', N'UMJW24625532', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (127, N'WHZN28606380', N'UI005', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (128, N'WHZN28606380', N'BQDQ46501241', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (129, N'UMJW24625532', N'WHZN28606380', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (130, N'UMJW24625532', N'BZOL98493464', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (131, N'ODPG49260468', N'NEBY24305636', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (132, N'ODPG49260468', N'BZOL98493464', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (133, N'ODPG49260468', N'WHZN28606380', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (134, N'BQDQ46501241', N'ODPG49260468', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (135, N'WHZN28606380', N'ODPG49260468', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (136, N'SUZP68387176', N'BZOL98493464', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (137, N'SUZP68387176', N'UMJW24625532', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (138, N'SUZP68387176', N'NEBY24305636', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (139, N'SUZP68387176', N'ODPG49260468', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (140, N'SUZP68387176', N'WHZN28606380', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (141, N'ODPG49260468', N'SUZP68387176', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (142, N'BZOL98493464', N'ODPG49260468', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (143, N'BZOL98493464', N'SUZP68387176', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (144, N'SUZP68387176', N'BQDQ46501241', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (145, N'KODS13374719', N'UMJW24625532', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (146, N'KODS13374719', N'BZOL98493464', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (147, N'KODS13374719', N'BQDQ46501241', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (148, N'KODS13374719', N'NEBY24305636', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (149, N'KODS13374719', N'WHZN28606380', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (150, N'KODS13374719', N'SUZP68387176', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (151, N'KODS13374719', N'ODPG49260468', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (152, N'BZOL98493464', N'KODS13374719', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (153, N'MZHS76059192', N'UMJW24625532', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (154, N'BZOL98493464', N'MZHS76059192', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (155, N'KODS13374719', N'MZHS76059192', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (156, N'MZHS76059192', N'KODS13374719', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (157, N'SUZP68387176', N'MZHS76059192', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (158, N'SUZP68387176', N'KODS13374719', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (159, N'BZOL98493464', N'TNFH99027885', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (160, N'KODS13374719', N'TNFH99027885', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (161, N'MZHS76059192', N'TNFH99027885', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (162, N'NEBY24305636', N'WHZN28606380', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (165, N'NEBY24305636', N'SUZP68387176', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (166, N'NEBY24305636', N'TNFH99027885', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (167, N'UMJW24625532', N'MZHS76059192', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (168, N'BQDQ46501241', N'TNFH99027885', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (169, N'ODPG49260468', N'TNFH99027885', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (170, N'SUZP68387176', N'TNFH99027885', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (171, N'TNFH99027885', N'BZOL98493464', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (172, N'TNFH99027885', N'BQDQ46501241', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (173, N'TNFH99027885', N'MZHS76059192', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (174, N'TNFH99027885', N'SUZP68387176', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (175, N'TNFH99027885', N'KODS13374719', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (179, N'TNFH99027885', N'UI006', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (181, N'SUZP68387176', N'UI011', CAST(N'2023-08-04' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (182, N'BQDQ46501241', N'UMJW24625532', CAST(N'2023-08-07' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (191, N'BZOL98493464', N'BQDQ46501241', CAST(N'2023-09-17' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (192, N'NEBY24305636', N'BZOL98493464', CAST(N'2023-10-10' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (193, N'NEBY24305636', N'BQDQ46501241', CAST(N'2023-10-10' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (194, N'NEBY24305636', N'UMJW24625532', CAST(N'2023-10-10' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (195, N'NEBY24305636', N'ODPG49260468', CAST(N'2023-10-10' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (196, N'TNFH99027885', N'NEBY24305636', CAST(N'2023-10-10' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (197, N'TNFH99027885', N'ODPG49260468', CAST(N'2023-10-10' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (198, N'QQTD02705141', N'TNFH99027885', CAST(N'2023-12-10' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (199, N'TNFH99027885', N'QQTD02705141', CAST(N'2023-12-10' AS Date))
INSERT [dbo].[Follow] ([FollowId], [followerId], [followingId], [FollowDate]) VALUES (200, N'QQTD02705141', N'BQDQ46501241', CAST(N'2023-12-10' AS Date))
SET IDENTITY_INSERT [dbo].[Follow] OFF
GO
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (1, 1, N'TNFH99027885', 1, 10000, CAST(N'2023-11-11' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (10, 2, N'NEBY24305636', 12, 100000, CAST(N'2023-11-11' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (11, 2, N'NEBY24305636', 1, 10000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (12, 2, N'NEBY24305636', 1, 10000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (13, 2, N'NEBY24305636', 1, 10000, CAST(N'2023-11-11' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (14, 2, N'NEBY24305636', 1, 10000, CAST(N'2023-11-11' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (15, 2, N'NEBY24305636', 1, 10000, CAST(N'2023-11-12' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (16, 2, N'NEBY24305636', 1, 10000, CAST(N'2023-11-12' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (17, 2, N'NEBY24305636', 1, 10000, CAST(N'2023-11-12' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (18, 1, N'TNFH99027885', 1, 10000, CAST(N'2023-11-12' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (19, 1, N'TNFH99027885', 1, 10000, CAST(N'2023-11-12' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (20, 1, N'TNFH99027885', 1, 10000, CAST(N'2023-11-12' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (21, 1, N'TNFH99027885', 1, 10000, CAST(N'2023-11-12' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (22, 1, N'TNFH99027885', 1, 10000, CAST(N'2023-11-12' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (23, 1, N'TNFH99027885', 1, 10000, CAST(N'2023-11-12' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (24, 2, N'NEBY24305636', 1, 10000, CAST(N'2023-11-14' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (25, 2, N'NEBY24305636', 1, 10000, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (26, 2, N'NEBY24305636', 1, 10000, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (27, 2, N'NEBY24305636', 1, 10000, CAST(N'2023-11-19' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (28, 4, N'ODPG49260468', 1, 10000, CAST(N'2023-11-21' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (29, 4, N'ODPG49260468', 1, 10000, CAST(N'2023-11-21' AS Date))
INSERT [dbo].[History] ([HistoryId], [TicketId], [UserId], [ticketCount], [TotalAmount], [BuyDate]) VALUES (30, 6, N'KODS13374719', 10, 100000, CAST(N'2023-12-14' AS Date))
SET IDENTITY_INSERT [dbo].[History] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1065, 1104, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fbanner.png-20230804_055429.png?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1066, 1104, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fdiep-bang.jpeg-20230804_055429.jpeg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1067, 1104, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fngo-phuong.jpeg-20230804_055429.jpeg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1068, 1104, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fvan-trong.jpeg-20230804_055429.jpeg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1069, 1104, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Flinh-am.jpeg-20230804_055429.jpeg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1070, 1104, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Flam-huyen.png-20230804_055429.png?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1071, 1105, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fcetus_mix_old_town_2.png-20230804_055553.png?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1072, 1106, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F340241649_751933666438576_2513463583558019112_n.png-20230804_055615.png?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1073, 1107, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fbackground-chapter-0.png-20230804_055708.png?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1074, 1108, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Flevy3.jpg-20230804_061201.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1075, 1109, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Flevy.jpg-20230804_061232.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1076, 1109, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Flevy2.jpg-20230804_061232.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1077, 1110, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fhappybee.jpg-20230804_061257.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1078, 1111, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FpostQ.jpg-20230804_064120.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1079, 1112, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fvid1.mp4-20230804_064145.mp4?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1080, 1115, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fdaubep.jpg-20230804_064822.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1081, 1116, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fgordonramsay.jpg-20230804_064958.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1082, 1117, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fvid2.mp4-20230804_065021.mp4?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1083, 1118, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FminhHieu.jpg-20230804_070007.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1084, 1119, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fcamap4chan.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1085, 1120, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fhieu2.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1086, 1114, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fmikelodic.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1087, 1113, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fcamap4chan.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1088, 1121, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FchiThien.jpg-20230804_075348.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1089, 1122, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fbeach.jpg-20230804_075416.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1090, 1123, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4573541876599_6bb2F3e80f5a9cb5c731afad134e0e9410.jpg-20230804_091125.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1091, 1124, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fsontung3.jpg-20230804_091156.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1092, 1125, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1093, 1126, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1094, 1127, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1095, 1129, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1096, 1130, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1097, 1131, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1098, 1132, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1099, 1133, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1100, 1134, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1101, 1135, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1102, 1136, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1103, 1136, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 0)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1104, 1137, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1105, 1141, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 0)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1106, 1142, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 0)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1107, 1143, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1108, 1155, NULL, 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1109, 1156, NULL, 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1110, 1157, NULL, 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1111, 1158, NULL, 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1112, 1159, NULL, 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1113, 1160, NULL, 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1114, 1161, NULL, 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1115, 1162, NULL, 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1116, 1177, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1117, 1177, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1118, 1190, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1119, 1190, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4655055426128_5d68e81ec4f9bd43e92a734e8a4b9f43.jpg?alt=media&token=7fca8a79-da07-4784-833f-c6d7e4e38f50', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1120, 1191, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698936874616?alt=media&token=57397eb5-eb5d-46a5-9e8e-17886b628c15', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1121, 1192, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384787412_889761319175931_715834711859431114_n.jpg_1698936908275?alt=media&token=acb98b90-4327-4595-b954-60b4cd7b8fc9', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1122, 1193, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384787412_889761319175931_715834711859431114_n.jpg_1698936939324?alt=media&token=6ac11978-7c8c-48bb-9b8d-08d3c24d6082', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1123, 1198, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FScreenshot%202023-07-22%20082026.png_1698938990958?alt=media&token=bf2faeac-adfd-4415-b4e8-8769ef173f04', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1124, 1199, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698939259338?alt=media&token=5dd1a2bc-e784-47ba-aaf5-07b0a96c9872', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1125, 1200, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698939303768?alt=media&token=0d97a3de-d351-49c2-ba9b-f01d725881ba', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1126, 1201, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698939417037?alt=media&token=a27ce16f-5500-4556-a118-081ae461f7e1', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1127, 1202, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698939492442?alt=media&token=ca4b081c-204f-42c0-bad4-14f2a34157fd', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1128, 1203, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370084606_889761545842575_3485958905898639940_n.jpg_1698939552707?alt=media&token=ad4f1c18-dc8e-4c9d-9927-12f8051c1951', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1129, 1204, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698939638992?alt=media&token=85a331a1-0f7a-47f5-9c1c-4b779d21080c', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1130, 1205, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370040063_889761452509251_1664821001874156135_n.jpg_1698939746201?alt=media&token=f3a4a506-c1ee-4e53-aa61-d3613e9d1db3', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1131, 1206, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698939777379?alt=media&token=e291c8c4-b4a2-44e6-a6f3-0df18b607625', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1132, 1207, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384755837_889761715842558_8192351482471818013_n.jpg_1698939897376?alt=media&token=44d0ba46-92b9-459e-b46f-fa5cd91964cb', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1133, 1208, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fbruh.png_1698940000766?alt=media&token=577e9fc4-e28f-440f-abe6-ee4b6dd801b5', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1134, 1209, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F369037348_1771276363316643_1780082219524648304_n.jpg_1698940096767?alt=media&token=6a015287-2e13-4fa0-ab45-e60d203a5891', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1135, 1210, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384787412_889761319175931_715834711859431114_n.jpg_1698940200931?alt=media&token=b30883cd-0495-4cbe-8afd-fa0a2dff9a6d', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1136, 1211, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F385010224_889760919175971_2843257053950736592_n.jpg_1698940820561?alt=media&token=42144c12-032c-4043-82c3-aa2a00ee0c4d', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1137, 1212, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384755837_889761715842558_8192351482471818013_n.jpg_1698940991015?alt=media&token=0f810ef5-02e4-4106-a383-4d4c12304daa', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1138, 1213, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fkobeni___chainsaw_man_by_alisdreamland_dfr4w70-fullview.jpg_1698941021606?alt=media&token=2f142af5-f450-4e6c-bf27-f9eb8dfb2195', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1139, 1214, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384787412_889761319175931_715834711859431114_n.jpg_1698941264638?alt=media&token=f5e0646f-68a6-4128-92e1-79a2e585fc15', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1140, 1215, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384787412_889761319175931_715834711859431114_n.jpg_1698941464444?alt=media&token=58ccc065-57e5-4d07-a280-db0f8405a3e7', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1141, 1216, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384787412_889761319175931_715834711859431114_n.jpg_1698941640728?alt=media&token=7a519486-7eb1-477f-a21a-41c0966d2717', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1142, 1217, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Flogo.png_1698941904324?alt=media&token=28619e3c-7a19-499f-a2c1-59973d9fb76c', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1143, 1218, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384787412_889761319175931_715834711859431114_n.jpg_1698942019464?alt=media&token=0afdf762-18d1-4ad4-8639-4dba997d7a36', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1144, 1219, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fkobeni___chainsaw_man_by_alisdreamland_dfr4w70-fullview.jpg_1698942033193?alt=media&token=8231935e-1a32-49aa-93b3-bc12d064035d', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1145, 1220, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fkobeni___chainsaw_man_by_alisdreamland_dfr4w70-fullview.jpg_1698942079241?alt=media&token=e33c032b-0b8b-4cf7-99b9-670281138eca', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1146, 1221, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698942433736?alt=media&token=02d52da0-4381-4706-a5da-b7f78ffc0956', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1147, 1222, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698942742518?alt=media&token=2c1a3766-10e4-425b-9ddc-44c092d5caa3', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1148, 1223, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370084606_889761545842575_3485958905898639940_n.jpg_1698943270861?alt=media&token=7d5cbe1e-b99b-4da0-afbd-48aa86801480', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1149, 1224, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698943389027?alt=media&token=3c6997bd-a060-47e5-bc99-e8cac466a509', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1150, 1225, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370040063_889761452509251_1664821001874156135_n.jpg_1698943572939?alt=media&token=1084cef8-ba6f-4712-905d-81af47843c2c', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1151, 1226, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384755837_889761715842558_8192351482471818013_n.jpg_1698943785798?alt=media&token=df8895ba-db4e-4d13-a0f4-467d94195179', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1152, 1227, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Flogo.png_1698943863142?alt=media&token=48dc5229-36b0-41f6-aa92-6e129a956233', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1153, 1228, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384755837_889761715842558_8192351482471818013_n.jpg_1698944135616?alt=media&token=66b69918-c083-456f-a420-227c0ee70e86', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1154, 1229, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698944217619?alt=media&token=9aa32a3d-54b1-41a0-8ca7-84b7afd463ed', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1155, 1230, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384755837_889761715842558_8192351482471818013_n.jpg_1698944456775?alt=media&token=0e94ee43-298b-44cb-a022-f307e7d062e0', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1156, 1231, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384812832_889760935842636_7004189849685403829_n.jpg_1698944565008?alt=media&token=e943a275-e269-4ab4-bbb3-a6d231840316', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1157, 1232, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1698944594075?alt=media&token=8cdfbe73-53a3-45d3-a978-8ec6abcf7f66', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1158, 1233, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384801552_889761785842551_4761215008833918884_n.jpg_1698944704641?alt=media&token=55327f89-68cb-45a7-a45a-10bed67365fb', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1159, 1234, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384787412_889761319175931_715834711859431114_n.jpg_1698944736164?alt=media&token=90f594bc-b637-41be-859f-be4bdac8f232', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1160, 1236, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F385081865_889761035842626_2553049329052680287_n.jpg_1698944892116?alt=media&token=f950ffd9-83e6-491d-94fd-19707fe918e4', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1161, 1237, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fdacap.png_1698945164096?alt=media&token=0625afd5-0e9c-46f9-b737-6ceb967d5a74', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1162, 1239, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fbrh.jpg_1698945253770?alt=media&token=2a0df80a-1017-4d0b-ac2f-1ded5ecf459d', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1163, 1240, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F340241649_751933666438576_2513463583558019112_n.png_1699000678689?alt=media&token=74ffa234-b554-4dee-b7fc-bbfac00cbe55', 1)
GO
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1164, 1241, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fmhw.png_1699000705031?alt=media&token=9751d4f4-7474-497a-a788-80e71b5d4200', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1165, 1243, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FchiThien.jpg_1701416718318?alt=media&token=2b379d68-45a7-4838-b4f0-3ba2e818e1e0', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1166, 1244, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4932920581072_4b11f41d8c059fa3ec3607385b71ddda.jpg_1701416984301?alt=media&token=6ff2a714-a091-4af6-ae78-2cba5441e10b', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1167, 1245, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4932933425844_57e31176a62ebe2fb54849338fc1c348.jpg_1701417247259?alt=media&token=e861dcef-a7b5-4907-948f-267ccb03e915', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1168, 1245, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4932933802014_d145993b958745f3992bc4e992152359.jpg_1701417250797?alt=media&token=e4b6305f-f6d0-4384-8c4b-5b06bbd01107', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1169, 1246, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FVA.jpg_1701419445359?alt=media&token=18839c21-53b2-4a1b-864a-f19d16a703fe', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1170, 1247, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4565710414715_0d731634d8f91bc719d3ee41dbf23e1b.jpg-20230804_100436.jpg_1701419522874?alt=media&token=cf7cb775-3aa2-47c2-95b5-e3a2e5714c92', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1171, 1248, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F385082874_342597748112635_3656242161225322098_n.jpg_1701419750778?alt=media&token=974c1267-f23d-46c5-8920-8802efc51e4b', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1172, 1249, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F401473019_753913116781256_5972965920940275748_n.jpg_1701419790002?alt=media&token=ee2dd958-e8fb-42eb-a7e4-466f9af826f0', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1173, 1250, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FChu_bo.jpg_1702223962236?alt=media&token=332fbbb5-ff62-4c7e-8f39-e79ce688c1b8', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1174, 1250, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FChu_bo_1.jpg_1702223963479?alt=media&token=47a2cf9b-a777-4c04-a65f-1c6febf6f804', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1175, 1250, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FChu_bo_2.jpg_1702223965494?alt=media&token=3cff3bc3-9b5e-458e-987d-db4567b2cffa', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1176, 1250, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FChu_bo_3.jpg_1702223967462?alt=media&token=0980efc8-05f1-487e-870c-6e129765dab8', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1177, 1251, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FGio_hoa.jpg_1702224116628?alt=media&token=3efe8fdb-7eda-4027-949c-a5e1e28af3a8', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1178, 1251, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FGio_hoa_1.jpg_1702224118846?alt=media&token=a5259083-65f3-4880-8ae4-b0845b10323d', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1179, 1252, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FGio_hoa.jpg_1702224153143?alt=media&token=52fe3d5f-d690-44a6-b131-ed177cf48aaf', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1180, 1253, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FVong_tay.jpg_1702224363347?alt=media&token=4099dd8b-5e11-41ab-a1d3-ae7644585fc8', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1181, 1253, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FVong_tay_1.jpg_1702224365516?alt=media&token=880ee610-f22c-437b-be79-4b6b3dcc6930', 1)
INSERT [dbo].[Images] ([ImageId], [PostId], [ImageUrl], [Type]) VALUES (1182, 1254, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FDay_chuyen.jpg_1702224476424?alt=media&token=a359b2bc-93e6-41a0-8875-3d11b848a93d', 1)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Interactions] ON 

INSERT [dbo].[Interactions] ([InteracId], [InteractingPerson], [InteractedPerson], [InteractionCount], [MostRecentInteractionDate]) VALUES (67, N'TNFH99027885', N'NEBY24305636', 2, CAST(N'2023-12-01T15:37:36.697' AS DateTime))
INSERT [dbo].[Interactions] ([InteracId], [InteractingPerson], [InteractedPerson], [InteractionCount], [MostRecentInteractionDate]) VALUES (68, N'TNFH99027885', N'ODPG49260468', 1, CAST(N'2023-12-01T15:37:38.257' AS DateTime))
SET IDENTITY_INSERT [dbo].[Interactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Media] ON 

INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (4, 6, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FRong.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (5, 6, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FRong_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (6, 6, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FRong_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (7, 6, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FRong_3.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (8, 6, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FRong_4.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (9, 6, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FRong_5.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (10, 9, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FGuong.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (11, 9, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FGuong_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (12, 9, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FGuong_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (13, 7, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FDay_chuyen.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (14, 7, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FDay_chuyen_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (15, 7, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FDay_chuyen_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (16, 7, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FDay_chuyen_3.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (17, 10, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FVong_tay.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (18, 10, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FVong_tay_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (19, 10, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FVong_tay_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (20, 10, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FVong_tay_3.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (21, 10, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FVong_tay_4.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (22, 13, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FTui_xach.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (23, 13, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FTui_xach_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (24, 13, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FTui_xach_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (25, 13, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FTui_xach_3.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (26, 13, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FTui_xach_4.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (27, 14, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FMieng_lot_ly.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (28, 14, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FMieng_lot_ly_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (29, 14, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FMieng_lot_ly_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (30, 15, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FGio_hoa.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (31, 15, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FGio_hoa_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (32, 15, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FGio_hoa_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (33, 15, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FGio_hoa_3.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (34, 28, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FBong_hoa.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (35, 28, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FBong_hoa_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (36, 28, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FBong_hoa_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (37, 28, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FBong_hoa_3.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (38, 29, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FChu_vit_tren_trang.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (39, 29, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FChu_vit_tren_trang_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (40, 30, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FHoa_huong_duong.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (41, 30, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FHoa_huong_duong_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (42, 30, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FHoa_huong_duong_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (43, 30, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FHoa_huong_duong_3.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (44, 31, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FTui_dung_binh_nuoc.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (45, 31, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FTui_dung_binh_nuoc_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (46, 31, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FTui_dung_binh_nuoc_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (47, 31, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FTui_dung_binh_nuoc_3.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (48, 32, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FChu_bo.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (49, 32, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FChu_bo_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (50, 32, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FChu_bo_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (51, 32, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FChu_bo_3.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (52, 33, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FChau_sen_da.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (53, 33, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FChau_sen_da_1.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (54, 33, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FChau_sen_da_2.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (55, 33, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/products%2FChau_sen_da_3.jpg?alt=media&token=840bc4e0-4925-451c-be6e-b2f90d346c57', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (56, 34, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1699608516582?alt=media&token=9a7a550b-cedf-4339-8c73-7233358e2da4', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (57, 34, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384787412_889761319175931_715834711859431114_n.jpg_1699608518938?alt=media&token=56760139-b0e8-493e-975f-70329114e7d6', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (58, 34, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384812832_889760935842636_7004189849685403829_n.jpg_1699608520829?alt=media&token=ec2134e3-bb10-49f9-8aa2-7d03583bec1d', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (59, 34, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F385010224_889760919175971_2843257053950736592_n.jpg_1699608522914?alt=media&token=acc97384-c842-4d95-8a32-375818edcc77', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (61, 34, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F385092205_889760995842630_8874805564956968274_n.jpg_1699608526579?alt=media&token=c2c95ab0-4fe6-42ed-8a90-c9c26503822f', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (62, 34, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F385095464_889760925842637_7813052083283699942_n.jpg_1699608528332?alt=media&token=49501910-c3f9-4786-b852-3f2a556e5cc8', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (60, 34, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F385081865_889761035842626_2553049329052680287_n.jpg_1699608524611?alt=media&token=56d461b5-faed-4365-a24a-e7ca3b658f47', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (63, 34, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F385311949_889761562509240_7727418361362995519_n.jpg_1699608530033?alt=media&token=5ba3ac57-8beb-4c19-a1f3-879c02580c96', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (64, 35, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1701426678347?alt=media&token=eb833218-7ef4-4d59-baf0-bd3808f5acb2', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (65, 36, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Floc-4-hop-sua-dinh-duong-co-duong-vinamilk-adm-110ml-202308092029336377.jpg_1702532574970?alt=media&token=2d233a1d-72d0-4488-af87-3c3275bf624d', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (67, 37, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fa7cb4619351834e759bb92130935fb04_tn.jpg_1702533050538?alt=media&token=4c801f16-9e9d-4d7c-8c29-0922aabf58b5', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (68, 37, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fheo-ham-vissan-hop-150g-x-72-2-700x467.jpg_1702533052163?alt=media&token=0253123b-f330-4484-89dd-5df414fc8849', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (69, 38, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fph-11134201-7r98p-lm8xp8hj90gfbc_tn.jpg_1702533332483?alt=media&token=19de4416-a4ec-4219-b3a8-faee71f8906b', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (79, 41, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384787412_889761319175931_715834711859431114_n.jpg_1702534142508?alt=media&token=ac8fabd3-699f-40ca-8bd7-4d6fa4c91b9c', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (66, 36, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fsua-tiet-trung-vinamilk-adm-co-duong-hop-180-ml-1.jpg_1702532578194?alt=media&token=f7c6b8ca-ac0c-4a2a-9c3d-1aec069b766d', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (71, 38, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fa8339609fdb7d000d6965fbc69018500.jpg_1702533337000?alt=media&token=0db6ba42-e030-4c2d-9b09-a1ab4792e0f9', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (78, 41, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384755837_889761715842558_8192351482471818013_n.jpg_1702534140532?alt=media&token=dd792698-6639-4a27-950b-347fd036e639', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (70, 38, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fth-11134201-7r98u-lm8xqnw80rgn05_tn.jpg_1702533335067?alt=media&token=c6b718f8-6b7b-476b-ac38-7f8ee6f382e8', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (72, 39, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FIMG_9055-1-e1614856799858.jpg_1702533963503?alt=media&token=e961c34b-1f57-417f-94df-d11176908177', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (73, 39, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fmut-dau1.jpg_1702533967854?alt=media&token=3b86ed68-86d4-43bb-8d68-b4119cf149c6', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (74, 39, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fmut-dau-tay-da-lat.jpg_1702533970873?alt=media&token=6637fe2a-7d7a-4412-8dfe-f5a2e822ce05', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (75, 40, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F20230508-bewbauzvdm-575.jpeg_1702534065085?alt=media&token=aee2c875-7638-47ff-a0e4-a0507d959b7d', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (76, 40, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F1680326203.jpg_1702534067059?alt=media&token=747f1374-1cef-4f94-9148-cb6419a0b637', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (77, 41, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F370273332_889761872509209_137791970591343222_n.jpg_1702534138598?alt=media&token=01f1e387-6cc9-44e4-bedb-394c3c286d4b', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (80, 41, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384812832_889760935842636_7004189849685403829_n.jpg_1702534144197?alt=media&token=32b96f1a-e4df-4674-9dec-6922b77a1e12', 1)
INSERT [dbo].[Media] ([MediaId], [ProductId], [MediaUrl], [Type]) VALUES (81, 41, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F385010224_889760919175971_2843257053950736592_n.jpg_1702534145902?alt=media&token=1449557b-62d5-4651-86a6-33d7a20ae857', 1)
SET IDENTITY_INSERT [dbo].[Media] OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([MessId], [SenderId], [ReceiverId], [content], [image], [SendDate], [Status]) VALUES (720, N'BQDQ46501241', N'TNFH99027885', N'chào cô', N'', CAST(N'2023-12-01T15:40:20.330' AS DateTime), N'Đã xem')
INSERT [dbo].[Message] ([MessId], [SenderId], [ReceiverId], [content], [image], [SendDate], [Status]) VALUES (721, N'TNFH99027885', N'BQDQ46501241', N'chào em', N'', CAST(N'2023-12-01T15:40:54.603' AS DateTime), N'Đã xem')
INSERT [dbo].[Message] ([MessId], [SenderId], [ReceiverId], [content], [image], [SendDate], [Status]) VALUES (722, N'BQDQ46501241', N'TNFH99027885', N'hôm nay em có việc bận ở dưới quê nên xin phép nghỉ một buổi!', N'', CAST(N'2023-12-01T15:41:22.393' AS DateTime), N'Đã xem')
INSERT [dbo].[Message] ([MessId], [SenderId], [ReceiverId], [content], [image], [SendDate], [Status]) VALUES (723, N'TNFH99027885', N'BQDQ46501241', N'', N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2F384787412_889761319175931_715834711859431114_n.jpg_1701420202750?alt=media&token=c9962420-76f7-4e65-9434-6927927632d5', CAST(N'2023-12-01T15:43:25.047' AS DateTime), N'Đã gửi')
INSERT [dbo].[Message] ([MessId], [SenderId], [ReceiverId], [content], [image], [SendDate], [Status]) VALUES (724, N'NEBY24305636', N'BQDQ46501241', N'chào bạn', N'', CAST(N'2023-12-01T15:44:31.717' AS DateTime), N'Đã gửi')
INSERT [dbo].[Message] ([MessId], [SenderId], [ReceiverId], [content], [image], [SendDate], [Status]) VALUES (725, N'NEBY24305636', N'TNFH99027885', N'chào cô', N'', CAST(N'2023-12-01T15:44:42.917' AS DateTime), N'Đã xem')
INSERT [dbo].[Message] ([MessId], [SenderId], [ReceiverId], [content], [image], [SendDate], [Status]) VALUES (726, N'NEBY24305636', N'BQDQ46501241', N'chào em', N'', CAST(N'2023-12-01T19:21:00.997' AS DateTime), N'Đã gửi')
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (476, N'Trần Trung vừa đăng một bài viết mới', N'UMJW24625532', NULL, 1181, 1, CAST(N'2023-09-15T03:09:28.080' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (477, N'Trần Trung vừa đăng một bài viết mới', N'NEBY24305636', NULL, 1181, 1, CAST(N'2023-09-15T03:09:28.083' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (478, N'Trần Trung vừa đăng một bài viết mới', N'WHZN28606380', NULL, 1181, 1, CAST(N'2023-09-15T03:09:28.087' AS DateTime), 1)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (479, N'Trần Trung vừa đăng một bài viết mới', N'SUZP68387176', NULL, 1181, 1, CAST(N'2023-09-15T03:09:28.090' AS DateTime), 1)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (480, N'Trần Trung vừa đăng một bài viết mới', N'KODS13374719', NULL, 1181, 1, CAST(N'2023-09-15T03:09:28.093' AS DateTime), 1)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (482, N'Vân Anh vừa mua hàng trong cửa hàng của bạn', N'BQDQ46501241', N'TNFH99027885', NULL, 7, CAST(N'2023-11-15T11:00:43.867' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (483, N'Vân Anh vừa mua hàng trong cửa hàng của bạn', N'TNFH99027885', N'TNFH99027885', NULL, 7, CAST(N'2023-11-15T12:24:43.913' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (484, N'Lê Kiệt và -3 người khác đã thích bài viết của bạn', N'UMJW24625532', N'NQQS81361886', 1136, 3, CAST(N'2023-11-15T17:18:31.897' AS DateTime), 1)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (485, N'Lê Kiệt và 1 người khác đã thích bài viết của bạn', N'MZHS76059192', N'NQQS81361886', 1132, 3, CAST(N'2023-11-15T17:18:37.747' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (486, N'Lê Kiệt và 3 người khác đã bình luận bài viết của bạn', N'MZHS76059192', N'NQQS81361886', 1132, 4, CAST(N'2023-11-15T17:18:47.183' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (487, N'Lê Kiệt đã bình luận bài viết của bạn', N'UMJW24625532', N'NQQS81361886', 1109, 4, CAST(N'2023-11-15T17:20:17.337' AS DateTime), 1)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (488, N'Vân Anh đã thích bài viết của bạn', N'NEBY24305636', N'TNFH99027885', 1245, 3, CAST(N'2023-12-01T15:37:35.470' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (489, N'Vân Anh đã thích bài viết của bạn', N'NEBY24305636', N'TNFH99027885', 1244, 3, CAST(N'2023-12-01T15:37:36.700' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (490, N'Vân Anh đã thích bài viết của bạn', N'ODPG49260468', N'TNFH99027885', 1243, 3, CAST(N'2023-12-01T15:37:38.260' AS DateTime), 1)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (491, N'Trần Trung vừa mua hàng trong cửa hàng của bạn', N'TNFH99027885', N'NEBY24305636', NULL, 7, CAST(N'2023-12-10T20:58:03.120' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (492, N'Trần Trung vừa mua hàng trong cửa hàng của bạn', N'TNFH99027885', N'NEBY24305636', NULL, 7, CAST(N'2023-12-10T21:52:54.750' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (493, N'Trần Trung vừa mua hàng trong cửa hàng của bạn', N'TNFH99027885', N'NEBY24305636', NULL, 7, CAST(N'2023-12-10T21:53:06.477' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (494, N'Trần Trung vừa mua hàng trong cửa hàng của bạn', N'TNFH99027885', N'NEBY24305636', NULL, 7, CAST(N'2023-12-10T21:53:15.783' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (495, N'Trần Trung vừa mua hàng trong cửa hàng của bạn', N'BQDQ46501241', N'NEBY24305636', NULL, 7, CAST(N'2023-12-10T21:53:21.947' AS DateTime), 1)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (496, N'Trần Trung vừa mua hàng trong cửa hàng của bạn', N'TNFH99027885', N'NEBY24305636', NULL, 7, CAST(N'2023-12-10T21:54:06.840' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (497, N'Trần Trung vừa mua hàng trong cửa hàng của bạn', N'TNFH99027885', N'NEBY24305636', NULL, 7, CAST(N'2023-12-10T22:02:21.460' AS DateTime), 0)
INSERT [dbo].[Notifications] ([NotificationId], [NotificationContent], [ReceiverId], [SenderId], [PostId], [NotificationTypeId], [NotificationDate], [NotificationStatus]) VALUES (498, N'Trần Trung vừa mua hàng trong cửa hàng của bạn', N'TNFH99027885', N'NEBY24305636', NULL, 7, CAST(N'2023-12-10T22:05:40.543' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationType] ON 

INSERT [dbo].[NotificationType] ([TypeId], [TypeName]) VALUES (1, N'Đăng bài viết mới')
INSERT [dbo].[NotificationType] ([TypeId], [TypeName]) VALUES (2, N'Follow')
INSERT [dbo].[NotificationType] ([TypeId], [TypeName]) VALUES (3, N'Thích bài viết')
INSERT [dbo].[NotificationType] ([TypeId], [TypeName]) VALUES (4, N'Bình luận bài viết')
INSERT [dbo].[NotificationType] ([TypeId], [TypeName]) VALUES (5, N'Vi phạm chính sách')
INSERT [dbo].[NotificationType] ([TypeId], [TypeName]) VALUES (6, N'Trả lời bình luận')
INSERT [dbo].[NotificationType] ([TypeId], [TypeName]) VALUES (7, N'Vừa mua hàng của bạn')
SET IDENTITY_INSERT [dbo].[NotificationType] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (1, 6, 4, 1, CAST(69000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Đỏ')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (2, 7, 6, 1, CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (3, 8, 7, 1, CAST(90000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Cam')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (4, 9, 9, 5, CAST(345000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Đen')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (5, 10, 7, 1, CAST(80000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Trắng ')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (6, 11, 9, 1, CAST(130000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (7, 12, 7, 1, CAST(80000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Tím')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (8, 13, 9, 1, CAST(130000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Xanh dương')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (9, 14, 10, 2, CAST(138000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Xanh lục')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (10, 15, 10, 3, CAST(207000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Trắng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (11, 16, 9, 1, CAST(130000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Đen')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (12, 17, 9, 1, CAST(130000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (13, 18, 9, 3, CAST(207000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Xanh lục')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (14, 19, 13, 1, CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (15, 20, 14, 1, CAST(130000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (16, 21, 15, 1, CAST(160000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Đỏ')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (17, 22, 14, 1, CAST(130000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Đỏ')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (18, 23, 15, 1, CAST(160000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Đen')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (19, 24, 15, 1, CAST(160000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Tím')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (20, 25, 15, 1, CAST(160000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Xanh dương')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (21, 26, 13, 1, CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (43, 66, 4, 1, CAST(69000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Cam')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (57, 47, 4, 1, CAST(69000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Cam')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (58, 48, 6, 1, CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (59, 49, 7, 1, CAST(80000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Cam')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (60, 50, 9, 1, CAST(69000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Đỏ')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (61, 51, 10, 1, CAST(130000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (62, 52, 13, 1, CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Xanh dương')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (63, 53, 14, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Trắng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (64, 54, 15, 1, CAST(150000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Đen')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (65, 55, 28, 1, CAST(150000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (66, 56, 29, 1, CAST(190000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Tím')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (67, 57, 30, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Đen')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (68, 58, 31, 1, CAST(80000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Đen')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (69, 59, 32, 1, CAST(220000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (70, 60, 33, 1, CAST(290000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (71, 61, 4, 1, CAST(69000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (72, 62, 6, 1, CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Xanh lục')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (73, 63, 7, 1, CAST(80000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Xanh dương')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (74, 64, 9, 1, CAST(69000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (75, 65, 10, 1, CAST(130000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Đỏ')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (76, 66, 13, 1, CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Tím')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (77, 67, 10, 1, CAST(130000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Cam')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (78, 68, 14, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (79, 69, 6, 2, CAST(100000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), N'Cam')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (80, 70, 14, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (81, 71, 14, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (82, 72, 33, 2, CAST(290000.00 AS Decimal(10, 2)), CAST(290000.00 AS Decimal(10, 2)), N'Xanh dương')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (83, 73, 14, 5, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (84, 74, 14, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (85, 75, 33, 1, CAST(290000.00 AS Decimal(10, 2)), CAST(290000.00 AS Decimal(10, 2)), N'Xanh dương')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (86, 76, 33, 1, CAST(290000.00 AS Decimal(10, 2)), CAST(290000.00 AS Decimal(10, 2)), N'Xanh lục')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (87, 78, 6, 5, CAST(100000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (88, 79, 14, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'Tím')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (89, 80, 13, 3, CAST(100000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), N'Xanh lục')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (90, 81, 28, 2, CAST(150000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (91, 82, 28, 1, CAST(150000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (92, 83, 13, 1, CAST(100000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), N'Xanh dương')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (93, 84, 14, 2, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'Tím')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (94, 85, 14, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (95, 86, 33, 1, CAST(290000.00 AS Decimal(10, 2)), CAST(290000.00 AS Decimal(10, 2)), N'Cam')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (96, 87, 32, 1, CAST(220000.00 AS Decimal(10, 2)), CAST(220000.00 AS Decimal(10, 2)), N'Vàng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (97, 88, 30, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'Tím')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (98, 89, 15, 1, CAST(150000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), N'Đen')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (99, 90, 14, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'Hồng')
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [OriginalPrice], [SalePrice], [Color]) VALUES (100, 91, 14, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), N'Hồng')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (6, N'NEBY24305636', CAST(N'2023-05-01T00:00:00.000' AS DateTime), 4, N'81, Hẻm 11, đường Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 79000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (7, N'NEBY24305636', CAST(N'2023-05-05T00:00:00.000' AS DateTime), 5, N'81, Hẻm 11, đường Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 110000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (8, N'NEBY24305636', CAST(N'2023-05-07T00:00:00.000' AS DateTime), 4, N'81, Hẻm 11, đường Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 90000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (9, N'NEBY24305636', CAST(N'2023-05-08T00:00:00.000' AS DateTime), 4, N'81, Hẻm 11, đường Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 355000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (10, N'BZOL98493464', CAST(N'2023-05-08T00:00:00.000' AS DateTime), 5, N'Đ. Số 22, Thường Thạnh, Cái Răng, Cần Thơ ', 148000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (11, N'BZOL98493464', CAST(N'2023-05-19T00:00:00.000' AS DateTime), 4, N'Đ. Số 22, Thường Thạnh, Cái Răng, Cần Thơ ', 140000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (12, N'WHZN28606380', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 6, N'12, QL54, Đông Binh, Tx. Bình Minh, Vĩnh Long, Việt Nam', 90000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (13, N'WHZN28606380', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 4, N'12, QL54, Đông Binh, Tx. Bình Minh, Vĩnh Long, Việt Nam', 140000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (14, N'KODS13374719', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 5, N'39, An Nghiệp, An Phú, Ninh Kiều, Cần Thơ, Việt Nam', 79000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (15, N'KODS13374719', CAST(N'2023-06-10T00:00:00.000' AS DateTime), 4, N'39, An Nghiệp, An Phú, Ninh Kiều, Cần Thơ, Việt Nam', 148000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (16, N'WHZN28606380', CAST(N'2023-06-18T00:00:00.000' AS DateTime), 5, N'12, QL54, Đông Binh, Tx. Bình Minh, Vĩnh Long, Việt Nam', 140000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (17, N'WHZN28606380', CAST(N'2023-06-29T00:00:00.000' AS DateTime), 4, N'12, QL54, Đông Binh, Tx. Bình Minh, Vĩnh Long, Việt Nam', 140000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (18, N'KODS13374719', CAST(N'2023-07-03T00:00:00.000' AS DateTime), 5, N'39, An Nghiệp, An Phú, Ninh Kiều, Cần Thơ, Việt Nam', 217000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (19, N'ODPG49260468', CAST(N'2023-07-03T00:00:00.000' AS DateTime), 4, N'31, An Nghiệp, An Phú, Ninh Kiều, Cần Thơ, Việt Nam', 110000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (20, N'ODPG49260468', CAST(N'2023-07-03T00:00:00.000' AS DateTime), 6, N'31, An Nghiệp, An Phú, Ninh Kiều, Cần Thơ, Việt Nam', 130000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (21, N'ODPG49260468', CAST(N'2023-07-04T00:00:00.000' AS DateTime), 4, N'31, An Nghiệp, An Phú, Ninh Kiều, Cần Thơ, Việt Nam', 160000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (22, N'SUZP68387176', CAST(N'2023-07-04T00:00:00.000' AS DateTime), 4, N'33, An Nghiệp, An Phú, Ninh Kiều, Cần Thơ, Việt Nam', 130000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (23, N'SUZP68387176', CAST(N'2023-08-01T00:00:00.000' AS DateTime), 4, N'33, An Nghiệp, An Phú, Ninh Kiều, Cần Thơ, Việt Nam', 160000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (24, N'UMJW24625532', CAST(N'2023-08-16T00:00:00.000' AS DateTime), 3, N'17, An Nghiệp, An Phú, Ninh Kiều, Cần Thơ, Việt Nam', 160000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (25, N'NEBY24305636', CAST(N'2023-08-23T00:00:00.000' AS DateTime), 6, N'81, Hẻm 11, đường Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 160000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (26, N'NEBY24305636', CAST(N'2023-08-24T00:00:00.000' AS DateTime), 4, N'81, Hẻm 11, đường Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 110000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (47, N'UMJW24625532', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 1, N'123 Main St', 79000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (48, N'BQDQ46501241', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 2, N'456 Elm St', 110000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (49, N'BQDQ46501241', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 3, N'789 Oak St', 90000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (50, N'BQDQ46501241', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 4, N'101 Maple St', 79000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (51, N'BQDQ46501241', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 5, N'222 Pine St', 140000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (52, N'TNFH99027885', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 6, N'333 Birch St', 110000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (53, N'TNFH99027885', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 3, N'444 Cedar St', 130000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (54, N'TNFH99027885', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 3, N'555 Spruce St', 160000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (55, N'BQDQ46501241', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 3, N'666 Redwood St', 160000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (56, N'BQDQ46501241', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 4, N'777 Sequoia St', 200000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (57, N'TNFH99027885', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 5, N'888 Hemlock St', 130000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (58, N'TNFH99027885', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 6, N'999 Sycamore St', 90000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (59, N'TNFH99027885', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 2, N'111 Oak St', 230000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (60, N'TNFH99027885', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 2, N'222 Elm St', 300000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (61, N'UMJW24625532', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 3, N'333 Pine St', 79000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (62, N'UMJW24625532', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 4, N'444 Cedar St', 110000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (63, N'UMJW24625532', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 5, N'555 Spruce St', 90000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (64, N'UMJW24625532', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 6, N'666 Redwood St', 79000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (65, N'UMJW24625532', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 1, N'777 Sequoia St', 140000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (66, N'BQDQ46501241', CAST(N'2023-09-08T22:07:37.990' AS DateTime), 2, N'888 Hemlock St', 110000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (67, N'NEBY24305636', CAST(N'2023-05-07T00:00:00.000' AS DateTime), 6, N'81, Hẻm 11, đường Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 140000, 10000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (68, N'NEBY24305636', CAST(N'2023-11-05T19:41:25.703' AS DateTime), 6, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 156001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (69, N'NEBY24305636', CAST(N'2023-11-06T15:59:44.687' AS DateTime), 6, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 234000, 34000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (70, N'NEBY24305636', CAST(N'2023-11-06T22:33:29.033' AS DateTime), 2, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 156001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (71, N'NEBY24305636', CAST(N'2023-11-06T22:35:30.597' AS DateTime), 3, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 156001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (72, N'NEBY24305636', CAST(N'2023-11-07T20:52:50.550' AS DateTime), 1, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 616001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (73, N'NEBY24305636', CAST(N'2023-11-09T23:46:50.877' AS DateTime), 3, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 636001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (74, N'NEBY24305636', CAST(N'2023-11-09T23:48:08.987' AS DateTime), 1, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 156001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (75, N'NEBY24305636', CAST(N'2023-11-11T01:00:27.433' AS DateTime), 4, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 326001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (76, N'NEBY24305636', CAST(N'2023-11-12T19:12:28.707' AS DateTime), 6, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 326001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (78, N'NEBY24305636', CAST(N'2023-11-12T19:28:17.950' AS DateTime), 6, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 534000, 34000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (79, N'TNFH99027885', CAST(N'2023-11-12T21:36:16.417' AS DateTime), 1, N'hẻm 11 Xã Bình Thuận                                    Huyện Tây Sơn Bình Định', 156001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (80, N'TNFH99027885', CAST(N'2023-11-12T21:39:27.223' AS DateTime), 1, N'Xã Tân Thới                                    Huyện Phong Điền Cần Thơ', 329000, 29000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (81, N'TNFH99027885', CAST(N'2023-11-15T10:56:15.830' AS DateTime), 1, N'Xã Đồng Tân                                    Huyện Mai Châu Hòa Bình', 329000, 29000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (82, N'TNFH99027885', CAST(N'2023-11-15T11:00:43.853' AS DateTime), 1, N'Xã Đồng Tân                                    Huyện Mai Châu Hòa Bình', 179000, 29000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (83, N'TNFH99027885', CAST(N'2023-11-15T12:24:43.897' AS DateTime), 2, N'Xã Đồng Tân                                    Huyện Mai Châu Hòa Bình', 134000, 34000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (84, N'NEBY24305636', CAST(N'2023-12-10T20:58:03.057' AS DateTime), 1, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 276001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (85, N'NEBY24305636', CAST(N'2023-12-10T21:52:54.743' AS DateTime), 1, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 156001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (86, N'NEBY24305636', CAST(N'2023-12-10T21:53:06.473' AS DateTime), 1, N'3123 Xã Trung Hòa                                    Huyện Yên Mỹ Hưng Yên', 324000, 34000)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (87, N'NEBY24305636', CAST(N'2023-12-10T21:53:15.777' AS DateTime), 1, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 256001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (88, N'NEBY24305636', CAST(N'2023-12-10T21:53:21.940' AS DateTime), 6, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 156001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (89, N'NEBY24305636', CAST(N'2023-12-10T21:54:06.837' AS DateTime), 1, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 186001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (90, N'NEBY24305636', CAST(N'2023-12-10T22:02:21.453' AS DateTime), 1, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 156001, 36001)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [OrderDate], [StatusId], [Address], [TotalAmount], [ShippingFee]) VALUES (91, N'NEBY24305636', CAST(N'2023-12-10T22:05:40.527' AS DateTime), 1, N'213 Xã Tây Xuân                                    Huyện Tây Sơn Bình Định', 156001, 36001)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([StatusId], [StatusName]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName]) VALUES (2, N'Chờ lấy hàng')
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName]) VALUES (3, N'Đang giao hàng')
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName]) VALUES (4, N'Đã giao hàng')
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName]) VALUES (5, N'Trả hàng')
INSERT [dbo].[OrderStatus] ([StatusId], [StatusName]) VALUES (6, N'Đã hủy đơn hàng')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1, N'Hôm nay trời đẹp nè mọi người', 1, N'UI006', 0, 0, CAST(N'2023-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (2, N'Hôm nay tui buồn huhu', 1, N'UI010', 0, 0, CAST(N'2023-06-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (3, N'Em đẹp em có quyền "hong"', 1, N'UI005', 0, 0, CAST(N'2023-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (4, N'Nạp game 70k nè', 1, N'UI003', 0, 0, CAST(N'2023-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (5, N'Chạy bộ không?', 1, N'UI004', 0, 0, CAST(N'2023-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (6, N'18 giờ 10 phút tập hợp nào', 0, N'UI006', 0, 0, CAST(N'2023-06-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (7, N'Vietcombank 1023980xxx ai đi qua cho tôi xin 1k', 0, N'UI010', 0, 0, CAST(N'2023-06-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (8, N'Bán nghệ không bán hành', 1, N'UI006', 0, 0, CAST(N'2023-06-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (9, N'9h săn boss nào ae', 1, N'UI010', 0, 0, CAST(N'2023-06-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (10, N'Chào ngày mới', 1, N'UI013', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (11, N'Lấp Vò quê tôi', 0, N'UI013', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (12, N'Nhà phải có nóc', 0, N'UI013', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (13, N'Ăn ba tô cơm', 0, N'UI016', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (14, N'Không biết nhaa', 0, N'UI016', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (15, N'Chào cả nhà', 1, N'UI016', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (16, N'Ngày cá tháng 4 nè', 1, N'UI016', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (17, N'Sóng bắt đầu từ gió', 1, N'UI020', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (18, N'Đoạn Tuyệt Remix', 1, N'UI020', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (19, N'Nhà ta có đại quản gia', 0, N'UI020', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (20, N'Xin tên phim này', 0, N'UI020', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (21, N'Nhà hát con sò Sydney!', 0, N'UI012', 0, 0, CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (22, N'Đà Lạt nè', 1, N'UI012', 0, 0, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (23, N'Đi quân sự nào', 1, N'UI012', 0, 0, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (24, N'Trời đất ơiii', 1, N'UI014', 0, 0, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (25, N'Biết ông Thương không', 0, N'UI019', 0, 0, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (26, N'Mua game tại Divideshop.com', 1, N'UI018', 0, 0, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (27, N'Quá ghê gớm', 1, N'UI016', 0, 0, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (28, N'Meow ~~', 0, N'UI011', 0, 0, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (29, N'Hasagi', 0, N'UI004', 0, 0, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (30, N'Bắn PUGB nè ae', 1, N'UI001', 0, 0, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (31, N'Xin link nhạc này với', 1, N'UI012', 0, 0, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (32, N'Phản động cút đi', 0, N'UI011', 0, 0, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (33, N'Phản đối đường lưỡi bò', 0, N'UI017', 0, 0, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (34, N'Lướt shoppe', 1, N'UI017', 0, 0, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (35, N'Blackpink!!!', 0, N'UI019', 0, 0, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (36, N'Mua vé xem Blackpink nào', 1, N'UI021', 0, 0, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (37, N'Đi Hà Nội du lịch nè', 0, N'UI021', 0, 0, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (38, N'Dạo này mưa nhiều quá ae ra đường cẩn thận', 1, N'UI008', 0, 0, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (39, N'Em của ngày hôm qua', 1, N'UI011', 0, 0, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (40, N'Đep trai có gì sai', 1, N'UI003', 0, 0, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (41, N'Pentakill!!!', 0, N'UI009', 0, 0, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (42, N'Tài khoản chatGPT 100k T^T', 1, N'UI014', 0, 0, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (43, N'Alo alo', 0, N'UI014', 0, 0, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (44, N'Nam mô a di chatGPT', 1, N'UI004', 0, 0, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (45, N'Phổ độ chúng sinh', 0, N'UI005', 0, 0, CAST(N'2023-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1104, N'Last Game: Claws from Shadow và các nhân vật liên quan!', 1, N'NEBY24305636', 0, 0, CAST(N'2023-08-04T05:54:29.767' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1105, N'Thị Trấn Bóng Tối trong Claws from Shadow', 1, N'NEBY24305636', 0, 0, CAST(N'2023-08-04T05:55:53.503' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1106, N'ă đù ăng Senggg', 0, N'NEBY24305636', 0, 0, CAST(N'2023-08-04T05:56:15.363' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1107, N'Dự kiến sẽ xuất bản vào 12/12/2024', 0, N'NEBY24305636', 0, 0, CAST(N'2023-08-04T05:57:08.180' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1108, N'What is it hoe ? What''s up ?', 1, N'UMJW24625532', 0, 0, CAST(N'2023-08-04T06:12:01.050' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1109, N'🌸🌸🌸', 1, N'UMJW24625532', 0, 0, CAST(N'2023-08-04T06:12:32.237' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1110, N'Chào mừng K19.3 đến với FPT Polytechnic Cần Thơ!', 1, N'UMJW24625532', 0, 0, CAST(N'2023-08-04T06:12:57.427' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1111, N'Let Goooo!!!', 1, N'BZOL98493464', 0, 0, CAST(N'2023-08-04T06:41:20.583' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1112, N'demo sản phẩm video mới', 1, N'BZOL98493464', 0, 0, CAST(N'2023-08-04T06:41:45.310' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1113, N'Á đù cá mập 4 chân', 1, N'BZOL98493464', 0, 0, CAST(N'2023-08-04T06:43:15.463' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1114, N'Bài hát tôi nghe nhiều nhất gần đây 🥰', 1, N'BZOL98493464', 0, 0, CAST(N'2023-08-04T06:45:09.463' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1115, N'Nấu ăn là một công việc và đầu bếp cũng là một sự nghiệp. Danh xưng Đầu bếp được dành để gọi những người chịu trách nhiệm chế biến món ăn ở các quán ăn, nhà hàng, khách sạn, resort… Vị trí đầu tiên trong lộ trình là Phụ bếp và cao nhất là Bếp trưởng Điều hành. Mức lương dành cho đầu bếp hiện nay dao động ở mức 6 triệu đến hàng trăm triệu đồng mỗi tháng.', 1, N'BQDQ46501241', 0, 0, CAST(N'2023-08-04T06:48:22.307' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1116, N'Gordon Ramsay: Chủ nhân của những chiếc bếp', 1, N'BQDQ46501241', 0, 0, CAST(N'2023-08-04T06:49:58.860' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1117, N'Vào bếp nào!!', 0, N'BQDQ46501241', 0, 0, CAST(N'2023-08-04T06:50:21.810' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1118, N'Tôi thích cảm giác được là kẻ vô danh trên một vùng đất xa lạ.', 1, N'WHZN28606380', 0, 0, CAST(N'2023-08-04T07:00:07.657' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1119, N'Ơ cá mập 4 chân này!', 1, N'WHZN28606380', 0, 0, CAST(N'2023-08-04T07:00:58.627' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1120, N'Nếu ai hỏi tôi có gì lúc này, tôi sẽ trả lời “Tôi có em”.', 1, N'WHZN28606380', 0, 0, CAST(N'2023-08-04T07:02:17.660' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1121, N'Babe có làm anh suy?', 1, N'ODPG49260468', 0, 0, CAST(N'2023-08-04T07:53:48.237' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1122, N'Sẽ ra sao nếu ngắm biển cùng em vào mỗi sáng sớm...', 1, N'ODPG49260468', 0, 0, CAST(N'2023-08-04T07:54:16.080' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1123, N'Tiến lên!!!', 0, N'SUZP68387176', 0, 0, CAST(N'2023-08-04T09:11:25.487' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1124, N'', 1, N'SUZP68387176', 0, 0, CAST(N'2023-08-04T09:11:56.680' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1125, N'học sinh giỏi nè', 1, N'KODS13374719', 0, 0, CAST(N'2023-08-04T09:28:45.687' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1126, N'Người đẹp vì lụa, em đẹp vì ai', 1, N'KODS13374719', 0, 0, CAST(N'2023-08-04T09:29:44.557' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1127, N'Gion~ hoai` ni''', 1, N'KODS13374719', 0, 0, CAST(N'2023-08-04T09:31:01.947' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1128, N'Đi biển hong', 1, N'KODS13374719', 0, 0, CAST(N'2023-08-04T09:38:12.017' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1129, N'...', 1, N'MZHS76059192', 0, 0, CAST(N'2023-08-04T09:53:23.780' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1130, N'Đi đám cứ đồ ha', 1, N'MZHS76059192', 0, 0, CAST(N'2023-08-04T09:56:18.860' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1131, N'Hongggggg', 0, N'MZHS76059192', 0, 0, CAST(N'2023-08-04T09:57:05.917' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1132, N'honggggg', 1, N'MZHS76059192', 0, 0, CAST(N'2023-08-04T09:57:38.770' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1133, N'Hôm nay học toán hình, tròn vuông chẳng thấy mà toàn hình bóng anh.', 0, N'TNFH99027885', 0, 0, CAST(N'2023-08-04T10:02:07.997' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1134, N'Cần ai đó quan tâm, cần tin nhắn mỗi ngày để biết mình đang được yêu thương.', 0, N'TNFH99027885', 0, 0, CAST(N'2023-08-04T10:02:33.923' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1135, N'Hổng tym coi chừng cô', 0, N'TNFH99027885', 0, 0, CAST(N'2023-08-04T10:04:36.263' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1136, N'', 1, N'UMJW24625532', 0, 0, CAST(N'2023-08-07T10:39:26.963' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1137, N'tran thai yeah', 0, N'NEBY24305636', 0, 0, CAST(N'2023-08-07T15:12:40.287' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1138, N'', 0, N'NQQS81361886', 0, 0, CAST(N'2023-08-09T16:37:52.773' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1139, N'', 0, N'NQQS81361886', 0, 0, CAST(N'2023-08-09T16:44:46.590' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1140, N'', 0, N'NQQS81361886', 0, 0, CAST(N'2023-08-09T16:49:17.833' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1141, N'', 0, N'NQQS81361886', 0, 0, CAST(N'2023-08-09T17:07:17.243' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1142, N'', 0, N'NQQS81361886', 0, 0, CAST(N'2023-08-09T23:04:02.573' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1143, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-08-17T17:07:46.077' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1144, N'TestBanHang', 0, N'NEBY24305636', 0, 0, CAST(N'2023-08-22T12:00:10.877' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1145, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T08:47:25.633' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1146, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T09:17:22.367' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1147, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T09:19:55.693' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1148, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T09:20:45.457' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1149, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T09:28:41.713' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1150, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T09:31:38.487' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1151, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T09:32:38.740' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1152, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T09:34:28.077' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1153, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T10:32:40.107' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1154, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T10:34:51.443' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1155, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T10:39:43.827' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1156, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T10:46:51.863' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1157, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T11:18:32.153' AS DateTime))
GO
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1158, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T11:20:34.680' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1159, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T11:21:03.593' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1160, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T11:22:00.190' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1161, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T11:24:57.647' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1162, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T11:40:39.887' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1163, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T12:08:07.083' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1164, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T12:11:47.657' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1165, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T15:23:20.680' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1166, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T15:24:19.347' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1167, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T15:29:40.537' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1168, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T15:37:14.680' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1169, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T15:38:16.007' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1170, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T15:43:06.063' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1171, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T16:31:37.630' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1172, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T16:35:11.723' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1173, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T16:36:15.737' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1174, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T16:38:42.887' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1175, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T16:40:22.697' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1176, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-14T16:51:25.753' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1177, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T01:47:31.200' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1178, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T03:04:16.023' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1179, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T03:04:35.623' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1180, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T03:05:33.873' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1181, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T03:09:28.053' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1182, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T03:12:23.210' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1183, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T03:13:57.930' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1184, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T03:15:02.803' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1185, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T03:17:54.100' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1186, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T03:18:41.937' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1187, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T03:19:31.720' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1188, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T03:29:47.617' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1189, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T13:00:09.053' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1190, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-09-15T13:03:40.837' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1191, N'123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T21:54:34.607' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1192, N'123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T21:55:08.270' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1193, N'123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T21:55:39.320' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1194, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:25:57.367' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1195, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:26:07.183' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1196, N'2132133', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:27:07.607' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1197, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:28:44.903' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1198, N'3232', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:29:50.953' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1199, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:34:19.333' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1200, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:35:03.760' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1201, N'2342434234', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:36:57.030' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1202, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:38:12.437' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1203, N'123213', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:39:12.703' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1204, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:40:38.987' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1205, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:42:26.190' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1206, N'213123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:42:57.373' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1207, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:44:57.370' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1208, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:46:40.760' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1209, N'"Đánh thức ý thức: Đối mặt với lãng phí thực phẩm và tạo ra một tương lai bền vững"', 1, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:48:16.760' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1210, N'2132132', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T22:50:00.927' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1211, N'21323', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:00:20.557' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1212, N'123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:03:11.007' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1213, N'213123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:03:41.600' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1214, N'423', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:07:44.633' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1215, N'12312', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:11:04.437' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1216, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:14:00.720' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1217, N'312312212', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:18:24.317' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1218, N'21321', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:20:19.460' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1219, N'213123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:20:33.187' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1220, N'12312323', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:21:19.237' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1221, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:27:13.730' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1222, N'12312', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:32:22.507' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1223, N'jhgfdsdfg', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:41:10.853' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1224, N'213123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:43:09.020' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1225, N'213123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:46:12.933' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1226, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:49:45.790' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1227, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:51:03.133' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1228, N'213123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:55:35.527' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1229, N'123123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-02T23:56:57.533' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1230, N'213', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T00:00:56.767' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1231, N'12312', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T00:02:45.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1232, N'213', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T00:03:14.070' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1233, N'123323', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T00:05:04.633' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1234, N'13123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T00:05:36.157' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1235, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T00:07:50.083' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1236, N'213123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T00:08:12.110' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1237, N'213123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T00:12:44.090' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1238, N'123123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T00:13:44.230' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1239, N'213123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T00:14:13.767' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1240, N'213123', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T15:37:58.670' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1241, N'Montser Hunter World: Iceborne', 1, N'NEBY24305636', 0, 0, CAST(N'2023-11-03T15:38:25.027' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1242, N'', 0, N'NEBY24305636', 0, 0, CAST(N'2023-11-12T15:21:40.303' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1243, N'Thiện Sad boiz', 1, N'ODPG49260468', 1, 0, CAST(N'2023-12-01T14:45:18.297' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1244, N'Mũi Cà Mau - Cực Nam của Tổ quốc', 1, N'NEBY24305636', 1, 0, CAST(N'2023-12-01T14:49:44.240' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1245, N'Phát triển du lịch sinh thái, nghỉ dưỡng và giải trí ở vườn quốc gia U Minh Hạ một cách bền vững gắn với việc bảo tồn, phát triển hệ sinh thái rừng tràm và đa dạng sinh học của vùng đất U Minh Hạ.', 1, N'NEBY24305636', 1, 0, CAST(N'2023-12-01T14:54:07.223' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1246, N'hù', 0, N'TNFH99027885', 0, 0, CAST(N'2023-12-01T15:30:45.353' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1247, N'Yêu thích sách và sức mạnh màu hồng! 💖🔨📖', 1, N'TNFH99027885', 0, 0, CAST(N'2023-12-01T15:32:02.870' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1248, N'Ai tiep xuc voi minh rui se thay minh rat la dang iu lun', 1, N'TNFH99027885', 0, 0, CAST(N'2023-12-01T15:35:50.773' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1249, N'Có một cuộc thi dễ thương và một thí sinh dễ thương đã âm thầm làm tặng cô mình mà hổng nói cho cô biết luôn ❤️', 1, N'TNFH99027885', 0, 0, CAST(N'2023-12-01T15:36:30.000' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1250, N'Hôm nay vừa mới đan xong những chú bóe bòa xinh xắn. Mọi người ai quan tâm xin ghé cửa hàng ủng hộ em!!（づ￣3￣）づ╭❤️～', 1, N'TNFH99027885', 0, 0, CAST(N'2023-12-10T22:59:22.200' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1251, N'Hôm nay đi du lịch sắm được mấy chậu hoa bé bé xinh xinh. Ủng hộ tại Shop của Vân Anh  q(≧▽≦q)', 0, N'TNFH99027885', 0, 0, CAST(N'2023-12-10T23:01:56.600' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1252, N'Hôm nay đi du lịch sắm được mấy chậu hoa bé bé xinh xinh. Ủng hộ tại Shop của Vân Anh q(≧▽≦q)', 1, N'TNFH99027885', 0, 0, CAST(N'2023-12-10T23:02:33.137' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1253, N'Nhân dịp Noel  anh chai nào chưa có ý tưởng quà tặng người thương thì ghé shop em ( ﾉ ﾟｰﾟ)ﾉ', 1, N'BQDQ46501241', 0, 0, CAST(N'2023-12-10T23:06:03.313' AS DateTime))
INSERT [dbo].[Posts] ([PostId], [Content], [IsActive], [UserId], [LikeCount], [CommentCount], [PostDate]) VALUES (1254, N'Phụ kiện không thể thiếu với các chị em nhân dịp năm mới. Sản phẩm đến từ Châu Âu thời thượng - Dây Chuyền Chữ Thập.', 1, N'BQDQ46501241', 0, 0, CAST(N'2023-12-10T23:07:56.420' AS DateTime))
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColors] ON 

INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (1, 6, N'1', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (3, 6, N'2', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (4, 6, N'3', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (5, 7, N'4', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (6, 7, N'5', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (7, 7, N'6', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (8, 9, N'7', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (9, 9, N'8', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (10, 9, N'9', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (12, 10, N'1', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (13, 10, N'2', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (14, 10, N'3', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (15, 13, N'4', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (16, 13, N'5', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (19, 15, N'8', 99)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (20, 15, N'9', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (22, 28, N'1', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (23, 28, N'2', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (24, 29, N'3', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (25, 29, N'4', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (26, 30, N'5', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (27, 30, N'6', 99)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (28, 30, N'7', 10)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (29, 31, N'8', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (30, 31, N'9', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (31, 32, N'1', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (32, 32, N'2', 99)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (33, 33, N'3', 99)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (34, 33, N'4', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (35, 33, N'5', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (36, 34, N'5', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (39, 14, N'7', 95)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (40, 14, N'6', 98)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (41, 35, N'5', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (42, 36, N'4', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (43, 36, N'1', 200)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (44, 37, N'3', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (45, 37, N'5', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (46, 38, N'4', 50)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (47, 38, N'3', 50)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (48, 38, N'1', 50)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (49, 39, N'1', 16)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (50, 39, N'7', 16)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (51, 40, N'4', 142)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (52, 40, N'2', 122)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (53, 41, N'4', 100)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [Quantity]) VALUES (54, 41, N'7', 100)
SET IDENTITY_INSERT [dbo].[ProductColors] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (6, N'Rồng con đan len', CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Sản phẩm handmade đan len hình chú rồng con.', 0, 0, 0, 2, 15, 1, 11, N'Vải len', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'BZOL98493464', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (7, N'Dây chuyền chữ thập Banshee', CAST(80000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Dây chuyền nghệ thuật unisex.', 0, 0, 0, 5, 3, 1, 12, N'Nhựa', CAST(N'2023-02-01T00:00:00.000' AS DateTime), N'BQDQ46501241', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (9, N'Gương lừa gạc Tricktser', CAST(69000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Gương lừa gạc 2 chiều nghệ thuật.', 0, 0, 0, 2, 3, 1.2, 6, N'Kính', CAST(N'2023-02-01T00:00:00.000' AS DateTime), N'BQDQ46501241', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (10, N'Vòng tay Targon', CAST(130000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Vòng tay mạnh mẽ cho phái nam.', 0, 0, 0, 3, 2, 1, 5, N'Nhựa', CAST(N'2023-03-01T00:00:00.000' AS DateTime), N'BQDQ46501241', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (13, N'Túi xách con ngỗng', CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Mói mói mói.', 0, 0, 9, 4, 3, 5, 2, N'Vải', CAST(N'2023-03-01T00:00:00.000' AS DateTime), N'TNFH99027885', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (14, N'Miếng lót ly nhân vật hoạt hìnhh', CAST(120000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Miếng lót chuột các nhân hoạt hình tuổi thơ.', 0, 0, 0, 4, 2, 1, 6, N'Nhựa dẻo', CAST(N'2023-11-10T16:30:27.140' AS DateTime), N'TNFH99027885', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (15, N'Giỏ hoa đan len', CAST(150000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Sản phẩm handmade đan len hình giỏ hoa.', 0, 0, 0, 2, 2, 1, 8, N'Vải len', CAST(N'2023-04-01T00:00:00.000' AS DateTime), N'TNFH99027885', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (28, N'Bông hoa đan len', CAST(150000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Bông hoa đan len màu hồng, kích thước 10x10 cm. Sản phẩm được làm thủ công từ len tự nhiên, rất đẹp và mềm mại. Sản phẩm phù hợp để trang trí và làm quà tặng cho người thân.', 0, 0, 0, 2, 1, 1, 3, N'Len tự nhiên', CAST(N'2023-07-25T00:00:00.000' AS DateTime), N'BQDQ46501241', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (29, N'Chú vịt trên trăng đan len', CAST(190000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Chú vịt trên trăng đan len với màu sắc tươi sáng, kích thước 15x15 cm. Sản phẩm được làm thủ công từ len tự nhiên, rất đáng yêu và phù hợp để trang trí phòng ngủ của trẻ em.', 0, 0, 0, 2, 1, 1, 12, N'Len tự nhiên', CAST(N'2023-07-26T00:00:00.000' AS DateTime), N'BQDQ46501241', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (30, N'Hoa hướng dương đan len', CAST(120000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Hoa hướng dương đan len màu vàng tươi, kích thước 12x12 cm. Sản phẩm rất thích hợp để trang trí trong căn phòng của bạn.', 0, 0, 0, 1, 2, 1, 11, N'Len tự nhiên', CAST(N'2023-07-27T00:00:00.000' AS DateTime), N'BQDQ46501241', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (31, N'Túi đựng bình nước đan len', CAST(80000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Túi đựng bình nước đan len màu xanh lá cây, kích thước phù hợp để đựng bình nước 500ml. Sản phẩm được làm từ len tự nhiên, giữ nhiệt tốt.', 0, 0, 0, 2, 2, 1, 21, N'Len tự nhiên', CAST(N'2023-07-28T00:00:00.000' AS DateTime), N'TNFH99027885', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (32, N'Chú bò sữa đan len', CAST(220000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Chú bò sữa đan len màu trắng và đen, kích thước 18x18 cm. Sản phẩm được làm thủ công với chất liệu len cao cấp.', 0, 0, 0, 3, 2, 1, 45, N'Len tự nhiên', CAST(N'2023-07-29T00:00:00.000' AS DateTime), N'TNFH99027885', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (33, N'Chậu sen đá đan len', CAST(290000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Chậu sen đá đan len màu nâu, kích thước 20x20 cm. Sản phẩm độc đáo và tinh tế, làm bằng len tự nhiên.', 0, 0, 0, 4, 2, 1, 2, N'Len tự nhiên', CAST(N'2023-07-30T00:00:00.000' AS DateTime), N'TNFH99027885', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (34, N'Sticker Bug Capoo', CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Sticker cute của nhân vật Bug Capoo', 0, 0, 0, 10, 10, 10, NULL, N'Giấy', CAST(N'2023-11-10T16:28:36.567' AS DateTime), N'KODS13374719', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (35, N'Sticker', CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Sticker', 0, 0, 0, 1, 1, 1, 1, N'giấy', CAST(N'2023-12-01T17:31:18.333' AS DateTime), N'BQDQ46501241', NULL)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (36, N'Sữa tươi Vinamilk', CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Sữa tươi không đường Vinamilk', 0, 0, 0, 15, 4, 500, 7, N'Sữa', CAST(N'2023-12-14T12:42:54.933' AS DateTime), N'NEBY24305636', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (37, N'Thịt hộp các loại', CAST(100000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Thịt ngon ngon!!', 0, 0, 0, 20, 30, 1000, 30, N'Thịt', CAST(N'2023-12-14T12:50:50.523' AS DateTime), N'NEBY24305636', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (38, N'Áo khoác Evisu', CAST(499000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Áo khoác Evisu cực chất giành cho giới trẻ', 0, 0, 0, 120, 70, 1200, 120, N'Áo', CAST(N'2023-12-14T12:55:32.463' AS DateTime), N'ODPG49260468', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (39, N'Mứt dâu', CAST(500000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Mức dâu cực ngon', 0, 0, 0, 123, 213, 1000, 213, N'Mức', CAST(N'2023-12-14T13:06:03.490' AS DateTime), N'KODS13374719', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (40, N'Bánh Quy Cosy', CAST(121212.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'Bánh Quy Cosy nổi tiếng ngon ngọt', 0, 0, 0, 122, 2123, 12312, 121, N'Bánh', CAST(N'2023-12-14T13:07:45.077' AS DateTime), N'KODS13374719', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [OriginalPrice], [Promotion], [Description], [ViewsCount], [RatingsCount], [SoldQuantity], [Height], [Width], [Weight], [Length], [Material], [DatePost], [UserId], [StatusId]) VALUES (41, N'Sticker Bugcat', CAST(10000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Sticker giấy dán note cực xinh', 0, 0, 0, 1, 10, 10, 10, N'Giấy', CAST(N'2023-12-14T13:08:58.577' AS DateTime), N'KODS13374719', 3)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductStatus] ON 

INSERT [dbo].[ProductStatus] ([StatusId], [StatusName]) VALUES (1, N'Đang bán')
INSERT [dbo].[ProductStatus] ([StatusId], [StatusName]) VALUES (2, N'Ngưng kinh doanh')
INSERT [dbo].[ProductStatus] ([StatusId], [StatusName]) VALUES (3, N'Đang kiểm duyệt')
INSERT [dbo].[ProductStatus] ([StatusId], [StatusName]) VALUES (4, N'Không qua kiểm duyệt')
SET IDENTITY_INSERT [dbo].[ProductStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductsTemp] ON 

INSERT [dbo].[ProductsTemp] ([TempId], [ProductId], [ProductName], [OriginalPrice], [DatePost], [UserName]) VALUES (1, 36, N'Sữa tươi Vinamilk', CAST(100000.00 AS Decimal(10, 2)), CAST(N'2023-12-14T12:42:54.933' AS DateTime), NULL)
INSERT [dbo].[ProductsTemp] ([TempId], [ProductId], [ProductName], [OriginalPrice], [DatePost], [UserName]) VALUES (2, 37, N'Thịt hộp các loại', CAST(100000.00 AS Decimal(10, 2)), CAST(N'2023-12-14T12:50:50.523' AS DateTime), NULL)
INSERT [dbo].[ProductsTemp] ([TempId], [ProductId], [ProductName], [OriginalPrice], [DatePost], [UserName]) VALUES (3, 38, N'Áo khoác Evisu', CAST(499000.00 AS Decimal(10, 2)), CAST(N'2023-12-14T12:55:32.463' AS DateTime), NULL)
INSERT [dbo].[ProductsTemp] ([TempId], [ProductId], [ProductName], [OriginalPrice], [DatePost], [UserName]) VALUES (4, 39, N'Mứt dâu', CAST(500000.00 AS Decimal(10, 2)), CAST(N'2023-12-14T13:06:03.490' AS DateTime), NULL)
INSERT [dbo].[ProductsTemp] ([TempId], [ProductId], [ProductName], [OriginalPrice], [DatePost], [UserName]) VALUES (6, 41, N'Sticker Bugcat', CAST(10000.00 AS Decimal(10, 2)), CAST(N'2023-12-14T13:08:58.577' AS DateTime), NULL)
INSERT [dbo].[ProductsTemp] ([TempId], [ProductId], [ProductName], [OriginalPrice], [DatePost], [UserName]) VALUES (5, 40, N'Bánh Quy Cosy', CAST(121212.00 AS Decimal(10, 2)), CAST(N'2023-12-14T13:07:45.077' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ProductsTemp] OFF
GO
SET IDENTITY_INSERT [dbo].[Promotions] ON 

INSERT [dbo].[Promotions] ([PromotionId], [PercentValue], [MinimumValue], [StartDate], [EndDate], [Code]) VALUES (1, CAST(10.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), CAST(N'2023-08-22' AS Date), CAST(N'2023-09-15' AS Date), N'MUANGAY')
INSERT [dbo].[Promotions] ([PromotionId], [PercentValue], [MinimumValue], [StartDate], [EndDate], [Code]) VALUES (2, CAST(15.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)), CAST(N'2023-08-22' AS Date), CAST(N'2023-12-30' AS Date), N'HEDENROI')
INSERT [dbo].[Promotions] ([PromotionId], [PercentValue], [MinimumValue], [StartDate], [EndDate], [Code]) VALUES (3, CAST(5.00 AS Decimal(10, 2)), CAST(2000000.00 AS Decimal(10, 2)), CAST(N'2023-09-01' AS Date), CAST(N'2023-09-05' AS Date), N'CHAOMUNGT9')
INSERT [dbo].[Promotions] ([PromotionId], [PercentValue], [MinimumValue], [StartDate], [EndDate], [Code]) VALUES (4, CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(N'2023-09-01' AS Date), CAST(N'2023-09-08' AS Date), N'TUANLEVANG')
SET IDENTITY_INSERT [dbo].[Promotions] OFF
GO
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (3, 6, N'NEBY24305636', 4, N'Dây chuyền nói chung cũng được', CAST(N'2023-11-07T20:07:04.950' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (4, 6, N'BZOL98493464', 3, N'Tui tưởng cái này là trang sức chứ...', CAST(N'2023-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (5, 6, N'WHZN28606380', 5, N'Ngon! Quá tuyệt vời, ship siêu lẹ nè.', CAST(N'2023-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (6, 9, N'NEBY24305636', 5, N'Gương này treo tường là một cái gì đấy!', CAST(N'2023-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (8, 9, N'BZOL98493464', 5, N'Gương này đẹp phết.', CAST(N'2023-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (9, 9, N'WHZN28606380', 4, N'Không đẹp như tôi tưởng.', CAST(N'2023-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (10, 10, N'KODS13374719', 5, N'Vòng tay nhìn lực quá anh em!', CAST(N'2023-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (11, 9, N'WHZN28606380', 1, N'Giao hàng lâu, giao đến nơi thì gương bị vỡ, shop tệ quá!', CAST(N'2023-07-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (12, 13, N'ODPG49260468', 5, N'Mói mói mói!', CAST(N'2023-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (13, 15, N'ODPG49260468', 5, N'Giỏ hoa xinh quá.', CAST(N'2023-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (14, 14, N'SUZP68387176', 4, N'Miếng lót chuột cánh cụt dễ thương quá.', CAST(N'2023-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (15, 15, N'SUZP68387176', 3, N'Giao hàng chậm, sản phẩm bị hư một chút.', CAST(N'2023-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (16, 7, N'NEBY24305636', 5, N'1235', NULL)
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [UserId], [RatingValue], [RatingContent], [RatingDate]) VALUES (17, 14, N'NEBY24305636', 5, N'1', CAST(N'2023-11-07T20:02:43.473' AS DateTime))
SET IDENTITY_INSERT [dbo].[Ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[RejectProducts] ON 

INSERT [dbo].[RejectProducts] ([RejectId], [ProductId], [ProductName], [Username], [OriginalPrice], [Date], [Reason]) VALUES (1, 35, N'Sticker', N'Lý Tường', CAST(10000.00 AS Decimal(10, 2)), CAST(N'2023-12-01' AS Date), N'Sản phẩm không phù hợp!')
SET IDENTITY_INSERT [dbo].[RejectProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Returns] ON 

INSERT [dbo].[Returns] ([ReturnId], [OrderId], [ReturnDate], [Reason]) VALUES (1, 7, CAST(N'2023-05-09T00:00:00.000' AS DateTime), N'Honggg thít')
INSERT [dbo].[Returns] ([ReturnId], [OrderId], [ReturnDate], [Reason]) VALUES (2, 10, CAST(N'2023-05-13T00:00:00.000' AS DateTime), N'Hàng bị hỏng')
INSERT [dbo].[Returns] ([ReturnId], [OrderId], [ReturnDate], [Reason]) VALUES (3, 14, CAST(N'2023-06-08T00:00:00.000' AS DateTime), N'Hàng không giống hình')
INSERT [dbo].[Returns] ([ReturnId], [OrderId], [ReturnDate], [Reason]) VALUES (4, 16, CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'...')
INSERT [dbo].[Returns] ([ReturnId], [OrderId], [ReturnDate], [Reason]) VALUES (5, 18, CAST(N'2023-07-03T00:00:00.000' AS DateTime), N'Chất lượng tệ')
INSERT [dbo].[Returns] ([ReturnId], [OrderId], [ReturnDate], [Reason]) VALUES (6, 51, CAST(N'2023-09-08T22:07:37.990' AS DateTime), NULL)
INSERT [dbo].[Returns] ([ReturnId], [OrderId], [ReturnDate], [Reason]) VALUES (7, 57, CAST(N'2023-09-08T22:07:37.990' AS DateTime), N'Boom chơi')
INSERT [dbo].[Returns] ([ReturnId], [OrderId], [ReturnDate], [Reason]) VALUES (8, 63, CAST(N'2023-09-08T22:07:37.990' AS DateTime), N'Boom hàng nè')
SET IDENTITY_INSERT [dbo].[Returns] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Staff')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (3, N'User')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (4, N'Enterprise')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCart] ON 

INSERT [dbo].[ShoppingCart] ([CartId], [UserId], [ProductId], [Quantity], [Color]) VALUES (74, N'TNFH99027885', 14, 1, N'Hồng')
SET IDENTITY_INSERT [dbo].[ShoppingCart] OFF
GO
SET IDENTITY_INSERT [dbo].[TotalTicket] ON 

INSERT [dbo].[TotalTicket] ([TicketId], [UserId], [Ticket]) VALUES (1, N'TNFH99027885', 7)
INSERT [dbo].[TotalTicket] ([TicketId], [UserId], [Ticket]) VALUES (2, N'NEBY24305636', 24)
INSERT [dbo].[TotalTicket] ([TicketId], [UserId], [Ticket]) VALUES (4, N'ODPG49260468', 1)
INSERT [dbo].[TotalTicket] ([TicketId], [UserId], [Ticket]) VALUES (5, N'BQDQ46501241', 0)
INSERT [dbo].[TotalTicket] ([TicketId], [UserId], [Ticket]) VALUES (6, N'KODS13374719', 7)
SET IDENTITY_INSERT [dbo].[TotalTicket] OFF
GO
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'190720232311', N'Huỳnh Duy Quý', N'Lai Vung', NULL, NULL, 0, CAST(N'1983-01-18' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar1.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-07-19' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'BQDQ46501241', N'Lý Tường', N'Cần Thơ', N'Đã kết hôn', N'Ước mơ trở thành đầu bếp!', 0, CAST(N'1991-08-04' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Ftuong1.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fpexels-photo-583842.jpeg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-04' AS Date), CAST(N'2023-12-10T23:08:09.817' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'BZOL98493464', N'Huỳnh Quý', N'Lai Vung', N'Đang hẹn hò', N'一生平安', 1, CAST(N'1990-08-04' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FduyQuy.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-03' AS Date), CAST(N'2023-11-15T12:29:53.320' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'IKSX45792153', N'Hồng Thắm', NULL, NULL, NULL, 0, CAST(N'2023-08-04' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar2.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-04' AS Date), CAST(N'2023-12-14T13:37:32.040' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'KODS13374719', N'Gấm Nè', N'Cần Thơ', N'Đang hẹn hò', N'Thanh xuân như một tách trà. Ăn vài miếng bánh hết bà thanh xuân.', 0, CAST(N'1990-08-04' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fgam1.jpg-20230804_092845.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fgam2.jpg-20230804_092944.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-04' AS Date), CAST(N'2023-12-14T13:09:07.553' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'MZHS76059192', N'Ngọc Vy', N'Sa Đéc', N'Đang hẹn hò', N'iu tuan vyx', 0, CAST(N'1987-03-28' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fngocvy1.jpg-20230804_095323.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FminhHieuBia.jpg-20230804_095738.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-03' AS Date), CAST(N'2023-12-14T12:56:07.433' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'NEBY24305636', N'Trần Trung', N'Lấp Vò', N'Độc thân', N'Tôi là Trung, tôi là lập trình viên', 1, CAST(N'2000-08-04' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fbrh.jpg_1698945253770?alt=media&token=2a0df80a-1017-4d0b-ac2f-1ded5ecf459d', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fmhw.png_1699000705031?alt=media&token=9751d4f4-7474-497a-a788-80e71b5d4200', CAST(N'2023-08-04' AS Date), CAST(N'2023-12-14T21:30:12.180' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'NQQS81361886', N'Lê Kiệt', NULL, NULL, NULL, 0, CAST(N'2003-08-04' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar1.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-04' AS Date), CAST(N'2023-12-14T12:52:00.637' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'ODPG49260468', N'Lê Thiện', N'Cần Therrr', N'Yêu em ❤', N'Cần ai đó quan tâm, cần tin nhắn mỗi ngày để biết mình đang được yêu thương.', 1, CAST(N'1994-12-12' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FchiThien.jpg_1701416718318?alt=media&token=2b379d68-45a7-4838-b4f0-3ba2e818e1e0', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fbeach.jpg-20230804_075416.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-06' AS Date), CAST(N'2023-12-14T12:55:40.647' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'QQTD02705141', N'Trần Anh', N'Cần Thơ', N'Đang rảnh rỗi', N'Xin chào!', 1, CAST(N'2005-12-10' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar1.jpg?alt=media&token=cf64cf86-fabd-46db-9b65-1cf860cc1b8a', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FAAKl0Wq.jfif_1699179685495?alt=media&token=8a7784ee-a767-4352-bbfd-4a0df2e50feb', CAST(N'2023-12-10' AS Date), CAST(N'2023-12-10T23:11:27.467' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'RTYC46956549', N'Vỹ', NULL, NULL, NULL, 0, CAST(N'2005-08-10' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar1.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-10' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'SUZP68387176', N'Huỳnh Khang', N'Cà Mau', N'Đã kết hôn', N'Code to the moon!', 1, CAST(N'2023-08-04' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4573541876599_6bb3e80f5a9cb5c731afad134e0e9410.jpg-20230804_091125.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fsontung3.jpg-20230804_091156.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-06' AS Date), CAST(N'2023-12-14T12:52:42.517' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'TNFH99027885', N'Vân Anh', N'Cần Thơ', N'Đoán xem', N'Cô Vân Anh dạy kỹ năng mềm nè mấy đứa!', 0, CAST(N'1999-08-01' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4573535113309_9dc466de06ab57d437903fa120cbb5de.jpg-20230804_100207.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fz4573538728986_d9681ef01a084acdfc8c6c2d9c09fce1.jpg-20230804_100233.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-04' AS Date), CAST(N'2023-12-14T21:30:29.730' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI001', N'Trần Trung', N'Lấp Vò', N'Độc thân', N'Trung nè', 1, CAST(N'2003-01-18' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FminhHieuBia.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FnenDn.jpeg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI002', N'Bùi Hiếu', N'Cần Thơ', N'Độc thân', N'Híu nè', 1, CAST(N'1983-05-19' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI003', N'Huỳnh Quý', N'Lai Vung', N'Đang hẹn hò', N'Quý nè', 1, CAST(N'2001-01-01' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI004', N'Lý Tường', N'Cần Thơ', N'Đang hẹn hò', N'Tường nè', 1, CAST(N'1991-05-01' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI005', N'Lê Null', N'Sa Đéc', N'Đang hẹn hò', N'Vỹ nèe', 0, CAST(N'1992-01-01' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnhut1.png?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI006', N'Huỳnh Khang', N'Lai Vung', N'Đã kết hôn', N'Khang nè', 0, CAST(N'2001-09-24' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar1.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI007', N'Phi Hồng', N'Trà Vinh', N'Đang hẹn hò', N'Phi nè', 1, CAST(N'2003-01-01' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI008', N'Hồng Thắm', N'Cần Thơ', N'Độc thân', N'Thắm nè', 0, CAST(N'1983-12-11' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI009', N'Văn Vương', N'Phú Quốc', N'Đang hẹn hò', N'Vương trong vương giả!', 1, CAST(N'2003-12-01' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fwinter.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI010', N'Hồng Ngoan', N'Cần Thơ', N'Độc thân', N'Ngoan nè', 0, CAST(N'2003-11-01' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI011', N'Đoàn Duy', N'Cần Thơ', N'Độc thân', N'Duy nè', 1, CAST(N'1991-05-02' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI012', N'Vu Cát', N'Cần Thơ', N'Đang hẹn hò', N'Cát nè', 1, CAST(N'2003-05-02' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI013', N'Lâm Huyền', N'Cần Thơ', N'Độc thân', N'Huyền nè', 1, CAST(N'1991-05-02' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 4, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI014', N'Ngô Phượng', N'Cần Thơ', N'Đang hẹn hò', N'Phượng nè', 0, CAST(N'2003-05-02' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI015', N'Diệp Băng', N'Đồng Tháp', N'Độc thân', N'Băng nè', 0, CAST(N'2003-05-02' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI016', N'Văn Trọng', N'Đồng Tháp', N'Độc thân', N'Trọng nè', 1, CAST(N'1991-05-02' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 3, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI017', N'Linh Âm', N'Đồng Tháp', N'Đang hẹn hò', N'Âm nè', 0, CAST(N'2003-05-02' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI018', N'Thanh Long', N'Đồng Tháp', N'Độc thân', N'Long nè', 1, CAST(N'1991-05-02' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI019', N'Quan Lợi', N'An Giang', N'Độc thân', N'Lợi nè', 1, CAST(N'1991-05-02' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI020', N'Diệu Nhi', N'An Giang', N'Đang hẹn hò', N'Nhi nè', 0, CAST(N'2003-05-02' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 1, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UI021', N'Nhật An', N'An Giang', N'Đã kết hôn', N'An nè', 1, CAST(N'2003-05-02' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Favatar.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'UMJW24625532', N'Lê Vỹ', N'Sa Đéc', N'Đang hẹn hò', N'fall in luv with Dii <3', 0, CAST(N'1991-08-04' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FleVy.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FleVyBia.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-04' AS Date), CAST(N'2023-11-15T10:55:08.763' AS DateTime))
INSERT [dbo].[Users] ([UserId], [Username], [Address], [Relationship], [Introduction], [Gender], [Birthday], [Avatar], [ViolationCount], [Background], [CreateDate], [AccessTime]) VALUES (N'WHZN28606380', N'Bùi Hiếu', N'Cần Thơ', N'Độc thân', N'Thà rằng cô đơn vì không yêu ai, còn hơn yêu một ai đó nhưng trong lòng vẫn cô đơn. ❤', 0, CAST(N'1991-01-12' AS Date), N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2FminhHieu.jpg-20230804_070007.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', 0, N'https://firebasestorage.googleapis.com/v0/b/viesonet-datn.appspot.com/o/images%2Fnen.jpg?alt=media&token=4d387e21-a558-4710-adf9-1a4683ffc292', CAST(N'2023-08-04' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Violations] ON 

INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (65, CAST(N'2023-08-03T10:19:48.257' AS DateTime), 1130, N'NQQS81361886', 2, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (66, CAST(N'2023-07-29T23:21:22.887' AS DateTime), 1132, N'NQQS81361886', 9, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (67, CAST(N'2023-07-29T23:21:22.887' AS DateTime), 1109, N'NQQS81361886', 8, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (68, CAST(N'2023-07-29T23:21:22.887' AS DateTime), 1108, N'NQQS81361886', 3, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (69, CAST(N'2023-08-03T10:19:56.263' AS DateTime), 1108, N'NQQS81361886', 1, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (73, CAST(N'2023-07-29T23:21:22.887' AS DateTime), 1120, N'WHZN28606380', 8, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (74, CAST(N'2023-07-29T23:21:22.887' AS DateTime), 1120, N'WHZN28606380', 8, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (75, CAST(N'2023-08-03T10:19:56.263' AS DateTime), 1120, N'WHZN28606380', 8, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (76, CAST(N'2023-08-04T10:25:08.853' AS DateTime), 1120, N'WHZN28606380', 5, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (77, CAST(N'2023-08-04T10:25:11.477' AS DateTime), 1120, N'WHZN28606380', 2, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (78, CAST(N'2023-08-04T10:33:30.430' AS DateTime), 1114, N'BZOL98493464', 5, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (79, CAST(N'2023-08-04T10:33:32.693' AS DateTime), 1114, N'BZOL98493464', 5, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (80, CAST(N'2023-08-04T10:33:56.897' AS DateTime), 1112, N'BZOL98493464', 5, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (81, CAST(N'2023-08-04T10:33:59.293' AS DateTime), 1112, N'BZOL98493464', 5, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (82, CAST(N'2023-08-04T10:34:01.470' AS DateTime), 1112, N'BZOL98493464', 5, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (83, CAST(N'2023-08-04T10:34:04.030' AS DateTime), 1112, N'BZOL98493464', 5, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (84, CAST(N'2023-08-04T10:34:06.717' AS DateTime), 1112, N'BZOL98493464', 5, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (85, CAST(N'2023-08-04T10:45:58.350' AS DateTime), 1132, N'TNFH99027885', 9, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (86, CAST(N'2023-08-04T10:46:00.747' AS DateTime), 1132, N'TNFH99027885', 4, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (87, CAST(N'2023-08-04T10:46:06.053' AS DateTime), 1130, N'TNFH99027885', 6, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (88, CAST(N'2023-08-04T10:46:07.917' AS DateTime), 1130, N'TNFH99027885', 6, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (100, CAST(N'2023-06-04T11:29:04.630' AS DateTime), 1127, N'KODS13374719', 3, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (101, CAST(N'2023-06-04T11:29:04.630' AS DateTime), 1127, N'KODS13374719', 3, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (102, CAST(N'2023-06-04T11:29:04.630' AS DateTime), 1127, N'KODS13374719', 3, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (103, CAST(N'2022-12-09T11:29:04.630' AS DateTime), 1127, N'KODS13374719', 3, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (104, CAST(N'2023-06-04T11:29:04.630' AS DateTime), 1126, N'KODS13374719', 6, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (105, CAST(N'2022-12-09T11:29:04.630' AS DateTime), 1126, N'KODS13374719', 1, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (106, CAST(N'2023-06-04T11:29:04.630' AS DateTime), 1121, N'ODPG49260468', 8, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (107, CAST(N'2023-02-04T11:29:04.630' AS DateTime), 1121, N'ODPG49260468', 8, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (108, CAST(N'2023-02-04T11:29:04.630' AS DateTime), 1122, N'ODPG49260468', 3, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (109, CAST(N'2023-01-04T11:33:32.210' AS DateTime), 1122, N'ODPG49260468', 5, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (110, CAST(N'2023-01-04T11:33:32.210' AS DateTime), 1135, N'SUZP68387176', 9, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (111, CAST(N'2023-01-04T11:33:32.210' AS DateTime), 1134, N'SUZP68387176', 4, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (112, CAST(N'2023-01-04T11:33:32.210' AS DateTime), 1132, N'SUZP68387176', 8, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (117, CAST(N'2023-01-04T11:33:32.210' AS DateTime), 1117, N'BQDQ46501241', 8, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (118, CAST(N'2023-03-09T11:29:04.630' AS DateTime), 1117, N'BQDQ46501241', 2, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (119, CAST(N'2023-01-04T11:33:32.210' AS DateTime), 1117, N'BQDQ46501241', 1, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (120, CAST(N'2023-03-09T11:29:04.630' AS DateTime), 1116, N'BQDQ46501241', 7, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (121, CAST(N'2023-01-04T11:33:32.210' AS DateTime), 1115, N'BQDQ46501241', 4, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (122, CAST(N'2023-03-09T11:29:04.630' AS DateTime), 1115, N'BQDQ46501241', 2, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (123, CAST(N'2022-12-09T11:29:04.630' AS DateTime), 1107, N'NEBY24305636', 9, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (124, CAST(N'2022-12-09T11:29:04.630' AS DateTime), 1106, N'NEBY24305636', 8, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (125, CAST(N'2022-12-09T11:29:04.630' AS DateTime), 1106, N'NEBY24305636', 8, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (126, CAST(N'2022-12-09T11:29:04.630' AS DateTime), 1106, N'NEBY24305636', 8, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (127, CAST(N'2022-12-09T11:29:04.630' AS DateTime), 1106, N'NEBY24305636', 3, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (128, CAST(N'2022-12-09T11:29:04.630' AS DateTime), 1106, N'NEBY24305636', 1, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (129, CAST(N'2022-12-09T11:29:04.630' AS DateTime), 1105, N'NEBY24305636', 10, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (130, CAST(N'2022-12-09T11:29:04.630' AS DateTime), 1105, N'NEBY24305636', 10, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (131, CAST(N'2022-12-09T11:29:04.630' AS DateTime), 1104, N'NEBY24305636', 10, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (132, CAST(N'2022-11-09T11:29:04.630' AS DateTime), 1104, N'NEBY24305636', 4, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (133, CAST(N'2022-11-09T11:29:04.630' AS DateTime), 1128, N'KODS13374719', 9, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (134, CAST(N'2022-11-09T11:29:04.630' AS DateTime), 1127, N'KODS13374719', 6, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (135, CAST(N'2022-11-09T11:29:04.630' AS DateTime), 1125, N'KODS13374719', 8, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (136, CAST(N'2022-11-09T11:29:04.630' AS DateTime), 1132, N'MZHS76059192', 9, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (137, CAST(N'2022-11-09T11:29:04.630' AS DateTime), 1132, N'MZHS76059192', 5, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (138, CAST(N'2022-11-09T11:29:04.630' AS DateTime), 1132, N'MZHS76059192', 6, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (139, CAST(N'2022-11-09T11:29:04.630' AS DateTime), 1132, N'MZHS76059192', 2, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (140, CAST(N'2022-10-19T11:29:04.630' AS DateTime), 1130, N'MZHS76059192', 2, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (141, CAST(N'2022-10-19T11:29:04.630' AS DateTime), 1130, N'MZHS76059192', 2, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (142, CAST(N'2022-10-19T11:29:04.630' AS DateTime), 1130, N'MZHS76059192', 1, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (143, CAST(N'2022-10-19T11:29:04.630' AS DateTime), 1129, N'MZHS76059192', 10, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (144, CAST(N'2022-09-29T11:29:04.630' AS DateTime), 1129, N'MZHS76059192', 10, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (145, CAST(N'2022-09-29T11:29:04.630' AS DateTime), 1129, N'MZHS76059192', 3, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (146, CAST(N'2022-09-29T11:29:04.630' AS DateTime), 1133, N'TNFH99027885', 8, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (147, CAST(N'2022-09-29T11:29:04.630' AS DateTime), 1134, N'TNFH99027885', 8, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (148, CAST(N'2022-09-29T11:29:04.630' AS DateTime), 1135, N'TNFH99027885', 8, 0)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (149, CAST(N'2023-08-10T16:55:34.380' AS DateTime), 1122, N'NEBY24305636', 6, 1)
INSERT [dbo].[Violations] ([ViolationId], [ReportDate], [PostId], [UserId], [ViolationTypeId], [ViolationStatus]) VALUES (150, CAST(N'2023-08-10T16:56:15.960' AS DateTime), 1122, N'NEBY24305636', 9, 1)
SET IDENTITY_INSERT [dbo].[Violations] OFF
GO
SET IDENTITY_INSERT [dbo].[ViolationTypes] ON 

INSERT [dbo].[ViolationTypes] ([ViolationTypeId], [ViolationDescription]) VALUES (1, N'Ngôn từ gây thù ghét')
INSERT [dbo].[ViolationTypes] ([ViolationTypeId], [ViolationDescription]) VALUES (2, N'Spam')
INSERT [dbo].[ViolationTypes] ([ViolationTypeId], [ViolationDescription]) VALUES (3, N'Ảnh khỏa thân')
INSERT [dbo].[ViolationTypes] ([ViolationTypeId], [ViolationDescription]) VALUES (4, N'Bán hàng trái phép')
INSERT [dbo].[ViolationTypes] ([ViolationTypeId], [ViolationDescription]) VALUES (5, N'Bạo lực')
INSERT [dbo].[ViolationTypes] ([ViolationTypeId], [ViolationDescription]) VALUES (6, N'Quấy rối')
INSERT [dbo].[ViolationTypes] ([ViolationTypeId], [ViolationDescription]) VALUES (7, N'Khủng bố')
INSERT [dbo].[ViolationTypes] ([ViolationTypeId], [ViolationDescription]) VALUES (8, N'Thông tin sai sự thật')
INSERT [dbo].[ViolationTypes] ([ViolationTypeId], [ViolationDescription]) VALUES (9, N'Tự tử hoặc tự gây thương tích')
INSERT [dbo].[ViolationTypes] ([ViolationTypeId], [ViolationDescription]) VALUES (10, N'ba chấm')
SET IDENTITY_INSERT [dbo].[ViolationTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_account_email]    Script Date: 14/12/2023 10:56:08 pm ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [unique_account_email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notifications] ADD  CONSTRAINT [DF__Notificat__Notif__534D60F1]  DEFAULT (getdate()) FOR [NotificationDate]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF__Posts__PostDate__5441852A]  DEFAULT (getdate()) FOR [PostDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__Promot__6383C8BA]  DEFAULT ((0)) FOR [Promotion]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__ViewsC__6477ECF3]  DEFAULT ((0)) FOR [ViewsCount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__Rating__656C112C]  DEFAULT ((0)) FOR [RatingsCount]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__SoldQu__66603565]  DEFAULT ((0)) FOR [SoldQuantity]
GO
ALTER TABLE [dbo].[Reply] ADD  CONSTRAINT [DF__Reply__ReplyDate__52593CB8]  DEFAULT (getdate()) FOR [ReplyDate]
GO
ALTER TABLE [dbo].[Violations] ADD  DEFAULT (getdate()) FOR [ReportDate]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_AccountStatus_Account] FOREIGN KEY([StatusId])
REFERENCES [dbo].[AccountStatus] ([StatusId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_AccountStatus_Account]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Role_Account]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_User_Account] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_User_Account]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Post_Comment] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Post_Comment]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_User_Comment] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_User_Comment]
GO
ALTER TABLE [dbo].[DeliveryAddress]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryAddress_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[DeliveryAddress] CHECK CONSTRAINT [FK_DeliveryAddress_Users]
GO
ALTER TABLE [dbo].[FavoriteProducts]  WITH CHECK ADD  CONSTRAINT [FK_favorite_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[FavoriteProducts] CHECK CONSTRAINT [FK_favorite_users]
GO
ALTER TABLE [dbo].[FavoriteProducts]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[FavoriteProducts] CHECK CONSTRAINT [FK_FavoriteProducts_Products]
GO
ALTER TABLE [dbo].[FavoriteProducts]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteProducts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[FavoriteProducts] CHECK CONSTRAINT [FK_FavoriteProducts_Users]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Post_Favorite] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Post_Favorite]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_User_Favorite] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_User_Favorite]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_User_follower] FOREIGN KEY([followerId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_User_follower]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK_User_following] FOREIGN KEY([followingId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK_User_following]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_TotalTicket] FOREIGN KEY([TicketId])
REFERENCES [dbo].[TotalTicket] ([TicketId])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_TotalTicket]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Users]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Post_Image] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Post_Image]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [FK_Media_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [FK_Media_Products]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Users] FOREIGN KEY([SenderId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Users]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Userss] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Userss]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_NotificationType_Notification] FOREIGN KEY([NotificationTypeId])
REFERENCES [dbo].[NotificationType] ([TypeId])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_NotificationType_Notification]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Post_Notifications] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Post_Notifications]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_User_Notifications] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_User_Notifications]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__4D5F7D71] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Order__4D5F7D71]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__Customer__4A8310C6] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__Customer__4A8310C6]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrdersStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OrderStatus] ([StatusId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrdersStatus]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_User_Post] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_User_Post]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK__ProductCo__Color__03F0984C] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([ColorId])
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK__ProductCo__Color__03F0984C]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK__ProductCo__Produ__41EDCAC5] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK__ProductCo__Produ__41EDCAC5]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__UserId__7C4F7684] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__UserId__7C4F7684]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ProductStatus] ([StatusId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductStatus]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Products]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Users]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Reply] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comments] ([CommentId])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_Comment_Reply]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Receiver_Reply] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_Receiver_Reply]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_User_Reply] FOREIGN KEY([ResponderId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_User_Reply]
GO
ALTER TABLE [dbo].[Returns]  WITH CHECK ADD  CONSTRAINT [FK_Refunds_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Returns] CHECK CONSTRAINT [FK_Refunds_Orders]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_cart_user] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_cart_user]
GO
ALTER TABLE [dbo].[TotalTicket]  WITH CHECK ADD  CONSTRAINT [FK_TotalTicket_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[TotalTicket] CHECK CONSTRAINT [FK_TotalTicket_Users]
GO
ALTER TABLE [dbo].[ViolationProducts]  WITH CHECK ADD  CONSTRAINT [Violation_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ViolationProducts] CHECK CONSTRAINT [Violation_Product]
GO
ALTER TABLE [dbo].[ViolationProducts]  WITH CHECK ADD  CONSTRAINT [Violation_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ViolationProducts] CHECK CONSTRAINT [Violation_User]
GO
ALTER TABLE [dbo].[Violations]  WITH CHECK ADD  CONSTRAINT [FK_Post_Violations] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[Violations] CHECK CONSTRAINT [FK_Post_Violations]
GO
ALTER TABLE [dbo].[Violations]  WITH CHECK ADD  CONSTRAINT [FK_User_Violations] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Violations] CHECK CONSTRAINT [FK_User_Violations]
GO
ALTER TABLE [dbo].[Violations]  WITH CHECK ADD  CONSTRAINT [FK_Violations_ViolationTypes] FOREIGN KEY([ViolationTypeId])
REFERENCES [dbo].[ViolationTypes] ([ViolationTypeId])
GO
ALTER TABLE [dbo].[Violations] CHECK CONSTRAINT [FK_Violations_ViolationTypes]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [CK__Ratings__RatingV__3B40CD36] CHECK  (([RatingValue]>=(1) AND [RatingValue]<=(5)))
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [CK__Ratings__RatingV__3B40CD36]
GO
/****** Object:  StoredProcedure [dbo].[GetGroupedYearsFromOrders]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGroupedYearsFromOrders]
AS
BEGIN
    SELECT DISTINCT YEAR(orderDate) AS orderYear
    FROM Orders
    ORDER BY orderYear;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetOrderCacelCountByYear]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrderCacelCountByYear]
    @Year INT
AS
BEGIN
    SELECT 
           COUNT(*) AS OrderCount
    FROM Orders o
	JOIN OrderStatus os on o.StatusId = os.StatusId
    WHERE YEAR(orderDate) = @Year
	AnD os.StatusId = '5' --Đã hủy
    GROUP BY YEAR(orderDate);
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrderCountByYear]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrderCountByYear]
    @Year INT
AS
BEGIN
    SELECT 
           COUNT(*) AS OrderCount
    FROM Orders o
	JOIN OrderStatus os on o.StatusId = os.StatusId
    WHERE YEAR(orderDate) = @Year
	AnD os.StatusId = '4' --Đã giao hàng
    GROUP BY YEAR(orderDate);
END
GO
/****** Object:  StoredProcedure [dbo].[GetTotalSalesForYearAndCustomer]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTotalSalesForYearAndCustomer](
    @customerId nvarchar(50),
    @year int)
AS
BEGIN
    -- Tạo bảng tạm thời để lưu các năm độc nhất
    CREATE TABLE #UniqueYears (Year int);

    -- Lấy danh sách các năm độc nhất từ bảng "Orders"
    INSERT INTO #UniqueYears (Year)
    SELECT DISTINCT YEAR(orderDate) AS Year FROM Orders;

    -- Lấy danh sách các năm độc nhất từ bảng "OrderDetails"
    INSERT INTO #UniqueYears (Year)
    SELECT DISTINCT YEAR(o.orderDate) AS Year
    FROM Orders o
    JOIN OrderDetails od ON o.orderId = od.orderId;

    -- Tìm tổng số tiền của đơn hàng của khách hàng trong năm được chỉ định
    SELECT COALESCE(SUM(o.TotalAmount),0) AS totalSales
    FROM Orders o
    JOIN OrderDetails od ON o.orderId = od.orderId
    WHERE o.statusId = 4
    AND o.CustomerId = @customerId
    AND YEAR(o.orderDate) = @year;

    -- Xóa bảng tạm thời
    DROP TABLE #UniqueYears;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_doanhThuThang]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_doanhThuThang](
    @idUSER varchar(255)
)
AS
BEGIN
    -- Tạo bảng tạm chứa 12 tháng
    WITH Thang(Thang) AS (
        SELECT 1
        UNION ALL
        SELECT Thang + 1 FROM Thang WHERE Thang < 12
    ), 
    -- Lấy doanh thu
    ThongKe(Thang, doanh_thu_thang) AS (				
        SELECT all_months.thang,  COALESCE(SUM(o.TotalAmount), 0) AS doanh_thu_thang 
        FROM Thang all_months
         LEFT JOIN Orders o ON MONTH(o.OrderDate) = all_months.thang
         LEFT JOIN OrderStatus os ON o.StatusId = os.StatusId
         LEFT JOIN OrderDetails od ON o.OrderId = od.OrderId 
         LEFT JOIN Products p ON od.ProductId = p.ProductId 
         LEFT JOIN Users u ON u.UserId = p.UserId 
         where u.UserId = @idUSER
        GROUP BY all_months.thang
    )

    -- Kết hợp thông tin với bảng tạm chứa 12 tháng và thêm ORDER BY ở đây
    SELECT Thang.Thang, ISNULL(doanh_thu_thang, 0) AS doanh_thu_thang
    FROM Thang
    LEFT JOIN ThongKe ON Thang.Thang = ThongKe.Thang
    ORDER BY Thang.Thang;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_FilterPostLike]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_FilterPostLike](@id INT) 
AS
BEGIN
    SELECT
        ROW_NUMBER() OVER (ORDER BY (SELECT COUNT(*) FROM Favorites f WHERE f.PostId = p.PostId) DESC) AS stt,
        (SELECT STRING_AGG(i.ImageUrl, ', ') FROM Images i WHERE i.PostId = p.PostId) AS images,
        p.PostId AS postId,
        p.PostDate AS postDate,
        u.Username AS userPost,
		u.Avatar AS avatarUser,
        p.Content AS content,
        (SELECT COUNT(*) FROM Favorites f WHERE f.PostId = p.PostId) AS likeCount,
        (SELECT COUNT(*) FROM Comments c WHERE c.PostId = p.PostId) AS commentCount
    FROM Posts p
    LEFT JOIN Users u ON p.UserId = u.UserId
	where p.PostId = @id
    ORDER BY likeCount DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListAcc]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListAcc]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StartDate DATE = DATEADD(DAY, -6, CAST(GETDATE() AS DATE));
    DECLARE @EndDate DATE = CAST(GETDATE() AS DATE);

    WITH DateList AS (
        SELECT @StartDate AS Day
        UNION ALL
        SELECT DATEADD(DAY, 1, Day)
        FROM DateList
        WHERE DATEADD(DAY, 1, Day) <= @EndDate
    )
    SELECT CONVERT(varchar, dl.Day, 103) AS Day, COUNT(u.CreateDate) AS AccountCount
    FROM DateList dl
    LEFT JOIN Users u ON CAST(u.CreateDate AS DATE) = dl.Day
    GROUP BY dl.Day
    OPTION (MAXRECURSION 0);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListYear]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListYear]
AS
BEGIN
    SELECT DISTINCT YEAR(ReportDate) Years 
    FROM Violations
END
GO
/****** Object:  StoredProcedure [dbo].[sp_NumberReport]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_NumberReport] (
    @Year INT
)
AS
BEGIN
    -- Tạo bảng tạm chứa 12 tháng
    WITH months(months) AS (
        SELECT 1
        UNION ALL
        SELECT months + 1 FROM months WHERE months < 12
    ), 
   
    Report(months, numberReport) AS (
        SELECT MONTH(ReportDate), COUNT(DISTINCT ViolationId)
        FROM Violations
        WHERE YEAR(ReportDate) = @Year  and ViolationStatus = 0
        GROUP BY MONTH(ReportDate)
    )
    -- Kết hợp thông tin với bảng tạm chứa 12 tháng
    SELECT months.months, ISNULL(numberReport, 0) AS numberReport
    FROM months
    LEFT JOIN Report ON months.months = Report.months

END
GO
/****** Object:  StoredProcedure [dbo].[sp_PostsViolations]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PostsViolations]
AS
BEGIN
    SELECT DISTINCT
        p.PostId,
        u.Avatar,
        u.Username,
        p.PostDate,
        (SELECT STRING_AGG(i.ImageUrl, ', ') FROM Images i WHERE i.PostId = p.PostId) AS AllImages,
        p.Content,
        p.LikeCount,
        p.CommentCount
    FROM
        Users u
        INNER JOIN Posts p ON u.UserId = p.UserId
        INNER JOIN Violations v ON p.PostId = v.PostId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ReportViolationPosts]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ReportViolationPosts] (
    @Year INT
)
AS
BEGIN
    -- Tạo bảng tạm chứa 12 tháng
    WITH months(months) AS (
        SELECT 1
        UNION ALL
        SELECT months + 1 FROM months WHERE months < 12
    ), 
    
    Report(months, ViolationPosts) AS (
        SELECT MONTH(ReportDate), COUNT(DISTINCT ViolationId)
        FROM Violations
        WHERE YEAR(ReportDate) = @Year  and ViolationStatus = 1
        GROUP BY MONTH(ReportDate)
    )
    -- Kết hợp thông tin với bảng tạm chứa 12 tháng
    SELECT months.months, ISNULL(ViolationPosts, 0) AS ViolationPosts
    FROM months
    LEFT JOIN Report ON months.months = Report.months

END
GO
/****** Object:  StoredProcedure [dbo].[sp_SoLuongDonHangDuyet]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SoLuongDonHangDuyet](
    @idUSER varchar(255)
)
AS
BEGIN
    -- Tạo bảng tạm chứa 12 tháng
    WITH Thang(Thang) AS (
        SELECT 1
        UNION ALL
        SELECT Thang + 1 FROM Thang WHERE Thang < 12
    ), 
    -- Lấy số lượng đơn hàng được duyệt theo từng tháng
    ThongKe(Thang, soLuongDonHangDuyet) AS (				
        SELECT all_months.thang, COALESCE(COUNT(o.OrderId), 0) AS soLuongDonHangDuyet
        FROM Thang all_months
        LEFT JOIN Orders o ON MONTH(o.OrderDate) = all_months.thang
        LEFT JOIN OrderStatus os ON o.StatusId = os.StatusId
        LEFT JOIN OrderDetails od ON o.OrderId = od.OrderId
        LEFT JOIN Products p ON od.ProductId = p.ProductId
        LEFT JOIN Users u ON u.UserId = p.UserId
        WHERE u.UserId = @idUSER
        GROUP BY all_months.thang
    )

    -- Kết hợp thông tin với bảng tạm chứa 12 tháng và thêm ORDER BY ở đây
    SELECT Thang.Thang, ISNULL(soLuongDonHangDuyet, 0) AS SoLuongDonHangDuyet
    FROM Thang
    LEFT JOIN ThongKe ON Thang.Thang = ThongKe.Thang
    ORDER BY Thang.Thang;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SPBANCHAY]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SPBANCHAY](
    @idUSER varchar(255),
	 @Year INT
)
AS
BEGIN
SELECT
    p.ProductId,
    p.ProductName,
    p.OriginalPrice,
    COUNT(od.OrderId) AS soluong,
	SUM(od.OriginalPrice*od.Quantity) as tongtien,
    u.UserId AS TenMuaHang
FROM Products p
JOIN OrderDetails od ON p.ProductId = od.ProductId
JOIN Orders o ON od.OrderId = o.OrderId
JOIN Users u ON p.UserId = u.UserId
JOIN OrderStatus os ON os.StatusId = o.StatusId
WHERE p.UserId =  @idUSER 
 and YEAR(orderDate) = @Year
 and os.StatusId = '4'
GROUP BY p.ProductId, p.ProductName, p.OriginalPrice, u.UserId
ORDER BY soluong DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TopPostLike]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_TopPostLike] 
AS
BEGIN
    WITH RankedPosts AS (
        SELECT
            ROW_NUMBER() OVER (ORDER BY (SELECT COUNT(*) FROM Favorites f WHERE f.PostId = p.PostId) DESC) AS stt,
            (SELECT STRING_AGG(i.ImageUrl, ', ') FROM Images i WHERE i.PostId = p.PostId) AS images,
            p.PostId AS postId,
            p.PostDate AS postDate,
            u.Username AS userPost,
            u.Avatar AS avatarUser,
            p.Content AS content,
            (SELECT COUNT(*) FROM Favorites f WHERE f.PostId = p.PostId) AS likeCount,
            (SELECT COUNT(*) FROM Comments c WHERE c.PostId = p.PostId) AS commentCount
        FROM
            Posts p
            LEFT JOIN Users u ON p.UserId = u.UserId
    )
    SELECT
        stt,
        images,
        postId,
        postDate,
        userPost,
        avatarUser,
        content,
        likeCount,
        commentCount
    FROM
        RankedPosts
    WHERE
        stt <= 5
    ORDER BY
        likeCount DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TotalPosts]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TotalPosts]
AS
BEGIN
    SELECT TOP 5 ROW_NUMBER() OVER (ORDER BY COUNT(p.PostId) DESC) AS stt,
           u.Avatar AS Avatar,
           u.Username AS Username,
           COUNT(p.PostId) AS TotalPosts
    FROM Users u
    LEFT JOIN Posts p ON u.UserId = p.UserId
    WHERE p.IsActive = 1 -- Lọc người dùng hoạt động (tùy chọn)
    GROUP BY u.Avatar, u.Username
    ORDER BY TotalPosts DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[YourStoredProcedureName]    Script Date: 14/12/2023 10:56:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[YourStoredProcedureName](
 @customerId nvarchar(50),
    @year int)
AS
BEGIN
    SELECT SUM(tongtien) as totalTongtien
    FROM (
        SELECT SUM(od.OriginalPrice * od.Quantity - (od.SalePrice + o.ShippingFee)) as tongtien
        FROM Orders o
        JOIN orderDetails od on o.OrderId = od.OrderId
        JOIN Products p on p.ProductId = od.ProductId
        WHERE o.statusId = 4 
        AND p.userId = @customerId
        AND YEAR(o.orderDate) = @year
        GROUP BY p.OriginalPrice, od.SalePrice, o.ShippingFee
    ) subquery
END
GO
USE [master]
GO
ALTER DATABASE [Viesonet_DATN] SET  READ_WRITE 
GO
