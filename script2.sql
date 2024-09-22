USE [master]
GO
/****** Object:  Database [PaperDB]    Script Date: 22.09.2024 19:17:20 ******/
CREATE DATABASE [PaperDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PaperDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PaperDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PaperDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PaperDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PaperDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PaperDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PaperDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PaperDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PaperDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PaperDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PaperDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PaperDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PaperDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PaperDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PaperDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PaperDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PaperDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PaperDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PaperDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PaperDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PaperDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PaperDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PaperDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PaperDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PaperDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PaperDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PaperDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PaperDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PaperDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PaperDB] SET  MULTI_USER 
GO
ALTER DATABASE [PaperDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PaperDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PaperDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PaperDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PaperDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PaperDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PaperDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [PaperDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PaperDB]
GO
/****** Object:  Table [dbo].[ChangeHistory]    Script Date: 22.09.2024 19:17:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDocument] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[ChangeDescription] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 22.09.2024 19:17:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 22.09.2024 19:17:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[IdDocumentType] [int] NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[IdDepartment] [int] NOT NULL,
	[IdStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentStatus]    Script Date: 22.09.2024 19:17:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentType]    Script Date: 22.09.2024 19:17:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 22.09.2024 19:17:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[IdPosition] [int] NOT NULL,
	[IdDepartment] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 22.09.2024 19:17:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChangeHistory] ON 

INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (1, 1, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Создание документа')
INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (2, 1, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Изменение статуса на "В процессе"')
INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (3, 2, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Создание документа')
INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (4, 2, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Документ утвержден')
INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (5, 3, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Создание документа')
INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (6, 3, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Отправлено на утверждение')
INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (7, 4, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Создание документа')
INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (8, 5, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Создание документа')
INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (9, 6, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Создание документа')
INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (10, 6, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Изменение статуса на "На утверждении"')
INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (11, 7, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Создание документа')
INSERT [dbo].[ChangeHistory] ([Id], [IdDocument], [ChangeDate], [ChangeDescription]) VALUES (12, 8, CAST(N'2024-09-22T19:15:08.743' AS DateTime), N'Создание документа')
SET IDENTITY_INSERT [dbo].[ChangeHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [DepartmentName]) VALUES (1, N'Отдел разработки')
INSERT [dbo].[Department] ([Id], [DepartmentName]) VALUES (2, N'Бухгалтерия')
INSERT [dbo].[Department] ([Id], [DepartmentName]) VALUES (3, N'Маркетинг')
INSERT [dbo].[Department] ([Id], [DepartmentName]) VALUES (4, N'HR')
INSERT [dbo].[Department] ([Id], [DepartmentName]) VALUES (5, N'Отдел продаж')
INSERT [dbo].[Department] ([Id], [DepartmentName]) VALUES (6, N'IT Поддержка')
INSERT [dbo].[Department] ([Id], [DepartmentName]) VALUES (7, N'Юридический отдел')
INSERT [dbo].[Department] ([Id], [DepartmentName]) VALUES (8, N'Администрация')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([Id], [Title], [IdDocumentType], [IdEmployee], [IdDepartment], [IdStatus]) VALUES (1, N'Технический отчет', 1, 1, 1, 2)
INSERT [dbo].[Document] ([Id], [Title], [IdDocumentType], [IdEmployee], [IdDepartment], [IdStatus]) VALUES (2, N'Финансовый отчет за 2023 год', 2, 2, 2, 4)
INSERT [dbo].[Document] ([Id], [Title], [IdDocumentType], [IdEmployee], [IdDepartment], [IdStatus]) VALUES (3, N'Маркетинговый план на 2024 год', 3, 3, 3, 3)
INSERT [dbo].[Document] ([Id], [Title], [IdDocumentType], [IdEmployee], [IdDepartment], [IdStatus]) VALUES (4, N'Документ о найме сотрудника', 4, 4, 4, 2)
INSERT [dbo].[Document] ([Id], [Title], [IdDocumentType], [IdEmployee], [IdDepartment], [IdStatus]) VALUES (5, N'Отчет по продажам за квартал', 5, 5, 5, 4)
INSERT [dbo].[Document] ([Id], [Title], [IdDocumentType], [IdEmployee], [IdDepartment], [IdStatus]) VALUES (6, N'Запрос на обслуживание сервера', 6, 6, 6, 2)
INSERT [dbo].[Document] ([Id], [Title], [IdDocumentType], [IdEmployee], [IdDepartment], [IdStatus]) VALUES (7, N'Юридическая консультация по договору', 7, 7, 7, 3)
INSERT [dbo].[Document] ([Id], [Title], [IdDocumentType], [IdEmployee], [IdDepartment], [IdStatus]) VALUES (8, N'Приказ о проведении корпоратива', 8, 8, 8, 4)
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentStatus] ON 

INSERT [dbo].[DocumentStatus] ([Id], [StatusName]) VALUES (1, N'Черновик')
INSERT [dbo].[DocumentStatus] ([Id], [StatusName]) VALUES (2, N'В процессе')
INSERT [dbo].[DocumentStatus] ([Id], [StatusName]) VALUES (3, N'На утверждении')
INSERT [dbo].[DocumentStatus] ([Id], [StatusName]) VALUES (4, N'Утвержден')
INSERT [dbo].[DocumentStatus] ([Id], [StatusName]) VALUES (5, N'Отклонен')
SET IDENTITY_INSERT [dbo].[DocumentStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentType] ON 

INSERT [dbo].[DocumentType] ([Id], [TypeName]) VALUES (1, N'Техническая документация')
INSERT [dbo].[DocumentType] ([Id], [TypeName]) VALUES (2, N'Финансовый отчет')
INSERT [dbo].[DocumentType] ([Id], [TypeName]) VALUES (3, N'Маркетинговый план')
INSERT [dbo].[DocumentType] ([Id], [TypeName]) VALUES (4, N'Кадровый документ')
INSERT [dbo].[DocumentType] ([Id], [TypeName]) VALUES (5, N'Отчет по продажам')
INSERT [dbo].[DocumentType] ([Id], [TypeName]) VALUES (6, N'Запрос на обслуживание')
INSERT [dbo].[DocumentType] ([Id], [TypeName]) VALUES (7, N'Юридический документ')
INSERT [dbo].[DocumentType] ([Id], [TypeName]) VALUES (8, N'Административный приказ')
SET IDENTITY_INSERT [dbo].[DocumentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [FullName], [IdPosition], [IdDepartment]) VALUES (1, N'Иванов Иван', 1, 1)
INSERT [dbo].[Employee] ([Id], [FullName], [IdPosition], [IdDepartment]) VALUES (2, N'Петров Петр', 2, 2)
INSERT [dbo].[Employee] ([Id], [FullName], [IdPosition], [IdDepartment]) VALUES (3, N'Сидорова Мария', 3, 3)
INSERT [dbo].[Employee] ([Id], [FullName], [IdPosition], [IdDepartment]) VALUES (4, N'Кузнецова Анна', 4, 4)
INSERT [dbo].[Employee] ([Id], [FullName], [IdPosition], [IdDepartment]) VALUES (5, N'Алексеев Алексей', 5, 5)
INSERT [dbo].[Employee] ([Id], [FullName], [IdPosition], [IdDepartment]) VALUES (6, N'Николаев Никита', 6, 6)
INSERT [dbo].[Employee] ([Id], [FullName], [IdPosition], [IdDepartment]) VALUES (7, N'Федоров Федор', 7, 7)
INSERT [dbo].[Employee] ([Id], [FullName], [IdPosition], [IdDepartment]) VALUES (8, N'Григорьев Григорий', 8, 8)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([Id], [PositionName]) VALUES (1, N'Разработчик')
INSERT [dbo].[Position] ([Id], [PositionName]) VALUES (2, N'Главный бухгалтер')
INSERT [dbo].[Position] ([Id], [PositionName]) VALUES (3, N'Маркетолог')
INSERT [dbo].[Position] ([Id], [PositionName]) VALUES (4, N'Менеджер по персоналу')
INSERT [dbo].[Position] ([Id], [PositionName]) VALUES (5, N'Менеджер по продажам')
INSERT [dbo].[Position] ([Id], [PositionName]) VALUES (6, N'Техник')
INSERT [dbo].[Position] ([Id], [PositionName]) VALUES (7, N'Юрист')
INSERT [dbo].[Position] ([Id], [PositionName]) VALUES (8, N'Администратор')
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
ALTER TABLE [dbo].[ChangeHistory] ADD  DEFAULT (getdate()) FOR [ChangeDate]
GO
ALTER TABLE [dbo].[ChangeHistory]  WITH CHECK ADD FOREIGN KEY([IdDocument])
REFERENCES [dbo].[Document] ([Id])
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD FOREIGN KEY([IdDepartment])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD FOREIGN KEY([IdDocumentType])
REFERENCES [dbo].[DocumentType] ([Id])
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD FOREIGN KEY([IdStatus])
REFERENCES [dbo].[DocumentStatus] ([Id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([IdDepartment])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([IdPosition])
REFERENCES [dbo].[Position] ([Id])
GO
USE [master]
GO
ALTER DATABASE [PaperDB] SET  READ_WRITE 
GO
