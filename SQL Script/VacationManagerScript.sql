USE [master]
GO
/****** Object:  Database [VacationManager]    Script Date: 11/27/2022 10:40:56 PM ******/
CREATE DATABASE [VacationManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VacationManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VacationManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VacationManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VacationManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VacationManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VacationManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VacationManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VacationManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VacationManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VacationManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [VacationManager] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VacationManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VacationManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VacationManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VacationManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VacationManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VacationManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VacationManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VacationManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VacationManager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VacationManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VacationManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VacationManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VacationManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VacationManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VacationManager] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [VacationManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VacationManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VacationManager] SET  MULTI_USER 
GO
ALTER DATABASE [VacationManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VacationManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VacationManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VacationManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VacationManager] SET DELAYED_DURABILITY = DISABLED 
GO
USE [VacationManager]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/27/2022 10:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 11/27/2022 10:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](300) NULL,
	[TeamId] [int] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 11/27/2022 10:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Developers] [nvarchar](max) NULL,
	[ProjectId] [int] NULL,
	[TeamLeader] [int] NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/27/2022 10:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](64) NOT NULL,
	[Password] [nvarchar](64) NOT NULL,
	[FirstName] [nvarchar](32) NOT NULL,
	[LastName] [nvarchar](32) NOT NULL,
	[Role] [nvarchar](max) NULL,
	[TeamId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacations]    Script Date: 11/27/2022 10:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateRequest] [datetime2](7) NOT NULL,
	[HalfDay] [bit] NULL,
	[Accpeted] [bit] NULL,
	[Applicant] [int] NOT NULL,
 CONSTRAINT [PK_Vacations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221127173303_AddTablesToDatabase', N'6.0.11')
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [Name], [Developers], [ProjectId], [TeamLeader]) VALUES (1, N'Team 007', N'None', NULL, 1)
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Role], [TeamId]) VALUES (1, N'Gegata', N'gegata123', N'Georgi', N'Kalchev', N'CEO', 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Role], [TeamId]) VALUES (3, N'SomeoneSpecial', N'iskamdazavursha', N'Ivan', N'Dimov', N'The one above all', NULL)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [Role], [TeamId]) VALUES (4, N'NikoBg', N'nikoniko', N'Nikola', N'NIkolaev', N'Manager', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Projects_TeamId]    Script Date: 11/27/2022 10:40:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_Projects_TeamId] ON [dbo].[Projects]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Teams_ProjectId]    Script Date: 11/27/2022 10:40:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_Teams_ProjectId] ON [dbo].[Teams]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Teams_TeamLeader]    Script Date: 11/27/2022 10:40:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_Teams_TeamLeader] ON [dbo].[Teams]
(
	[TeamLeader] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_TeamId]    Script Date: 11/27/2022 10:40:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_TeamId] ON [dbo].[Users]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vacations_Applicant]    Script Date: 11/27/2022 10:40:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_Vacations_Applicant] ON [dbo].[Vacations]
(
	[Applicant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Teams_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Teams_TeamId]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Projects_ProjectId]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Users_TeamLeader] FOREIGN KEY([TeamLeader])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Users_TeamLeader]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Teams_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Teams_TeamId]
GO
ALTER TABLE [dbo].[Vacations]  WITH CHECK ADD  CONSTRAINT [FK_Vacations_Users_Applicant] FOREIGN KEY([Applicant])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vacations] CHECK CONSTRAINT [FK_Vacations_Users_Applicant]
GO
USE [master]
GO
ALTER DATABASE [VacationManager] SET  READ_WRITE 
GO
