USE [master]
GO
/****** Object:  Database [EventSystem]    Script Date: 16-09-2016 13:48:25 ******/
CREATE DATABASE [EventSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EventSystem.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EventSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EventSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EventSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EventSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EventSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EventSystem] SET  MULTI_USER 
GO
ALTER DATABASE [EventSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EventSystem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EventSystem]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16-09-2016 13:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 16-09-2016 13:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Events]    Script Date: 16-09-2016 13:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[EventStart] [datetime] NOT NULL,
	[EventEnd] [datetime] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[NoOfTickets] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[FK_Category] [int] NOT NULL,
	[FK_Location] [int] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventsInOrders]    Script Date: 16-09-2016 13:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventsInOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Event] [int] NOT NULL,
	[FK_Order] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_EventsInOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 16-09-2016 13:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[Zipcode] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Media]    Script Date: 16-09-2016 13:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[FK_Type] [int] NOT NULL,
	[FK_Event] [int] NOT NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MediaTypes]    Script Date: 16-09-2016 13:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MediaTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 16-09-2016 13:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FK_Customer] [int] NOT NULL,
	[FK_Status] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 16-09-2016 13:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ViewCustomerOrders]    Script Date: 16-09-2016 13:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCustomerOrders]
AS
SELECT        dbo.Orders.Id, dbo.Orders.Created, dbo.Customers.FirstName, dbo.Customers.LastName, dbo.Customers.Adress, dbo.Customers.ZipCode, dbo.Customers.City, dbo.Status.Name AS StatusName, 
                         dbo.EventsInOrders.Quantity, dbo.Events.Name AS EventName, dbo.Events.EventStart, dbo.Events.EventEnd, dbo.Events.Price, dbo.Events.NoOfTickets, dbo.Events.Description, 
                         dbo.Location.Adress AS EventAdress, dbo.Location.Zipcode AS EventZipCode, dbo.Location.City AS EventCity
FROM            dbo.Orders INNER JOIN
                         dbo.Customers ON dbo.Orders.FK_Customer = dbo.Customers.Id INNER JOIN
                         dbo.Status ON dbo.Orders.FK_Status = dbo.Status.Id INNER JOIN
                         dbo.EventsInOrders ON dbo.Orders.Id = dbo.EventsInOrders.FK_Order INNER JOIN
                         dbo.Events ON dbo.EventsInOrders.FK_Event = dbo.Events.Id INNER JOIN
                         dbo.Location ON dbo.Events.FK_Location = dbo.Location.Id


GO
/****** Object:  View [dbo].[ViewEvent]    Script Date: 16-09-2016 13:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEvent]
AS
SELECT        dbo.Events.Id, dbo.Events.Name, dbo.Events.EventStart, dbo.Events.EventEnd, dbo.Events.Price, dbo.Events.NoOfTickets, dbo.Events.Description, dbo.Location.Adress, dbo.Location.Zipcode, dbo.Location.City, 
                         dbo.Categories.Name AS CategoryName
FROM            dbo.Events INNER JOIN
                         dbo.Location ON dbo.Events.FK_Location = dbo.Location.Id INNER JOIN
                         dbo.Categories ON dbo.Events.FK_Category = dbo.Categories.Id


GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Categories] FOREIGN KEY([FK_Category])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Categories]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Location] FOREIGN KEY([FK_Location])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Location]
GO
ALTER TABLE [dbo].[EventsInOrders]  WITH CHECK ADD  CONSTRAINT [FK_EventsInOrders_Events] FOREIGN KEY([FK_Event])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[EventsInOrders] CHECK CONSTRAINT [FK_EventsInOrders_Events]
GO
ALTER TABLE [dbo].[EventsInOrders]  WITH CHECK ADD  CONSTRAINT [FK_EventsInOrders_Orders] FOREIGN KEY([FK_Order])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[EventsInOrders] CHECK CONSTRAINT [FK_EventsInOrders_Orders]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [FK_Media_Events] FOREIGN KEY([FK_Event])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [FK_Media_Events]
GO
ALTER TABLE [dbo].[Media]  WITH CHECK ADD  CONSTRAINT [FK_Media_MediaTypes] FOREIGN KEY([FK_Type])
REFERENCES [dbo].[MediaTypes] ([Id])
GO
ALTER TABLE [dbo].[Media] CHECK CONSTRAINT [FK_Media_MediaTypes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([FK_Customer])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([FK_Status])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[16] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Status"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EventsInOrders"
            Begin Extent = 
               Top = 6
               Left = 676
               Bottom = 136
               Right = 846
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Events"
            Begin Extent = 
               Top = 6
               Left = 891
               Bottom = 237
               Right = 1054
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location"
            Begin Extent = 
               Top = 6
               Left = 1092
               Bottom = 136
               Right = 1262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCustomerOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCustomerOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCustomerOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Events"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 239
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 194
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categories"
            Begin Extent = 
               Top = 198
               Left = 246
               Bottom = 294
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewEvent'
GO
USE [master]
GO
ALTER DATABASE [EventSystem] SET  READ_WRITE 
GO
