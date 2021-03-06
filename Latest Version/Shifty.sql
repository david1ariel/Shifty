USE [master]
GO
/****** Object:  Database [Tomedia Shifts Management]    Script Date: 27/12/2020 21:23:00 ******/
CREATE DATABASE [Tomedia Shifts Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tomedia Shifts Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tomedia Shifts Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tomedia Shifts Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tomedia Shifts Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tomedia Shifts Management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tomedia Shifts Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tomedia Shifts Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tomedia Shifts Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tomedia Shifts Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tomedia Shifts Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tomedia Shifts Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tomedia Shifts Management] SET  MULTI_USER 
GO
ALTER DATABASE [Tomedia Shifts Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tomedia Shifts Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tomedia Shifts Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tomedia Shifts Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tomedia Shifts Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tomedia Shifts Management] SET QUERY_STORE = OFF
GO
USE [Tomedia Shifts Management]
GO
/****** Object:  Table [dbo].[ShiftTypes]    Script Date: 27/12/2020 21:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftTypes](
	[ShiftTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeTitle] [nvarchar](30) NOT NULL,
	[Starts] [time](7) NULL,
	[Ends] [time](7) NULL,
 CONSTRAINT [PK_ShiftTypes] PRIMARY KEY CLUSTERED 
(
	[ShiftTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 27/12/2020 21:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Adress] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](7) NULL,
	[Phone1] [nvarchar](50) NULL,
	[Phone2] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[Photo] [image] NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[IDCard] [nvarchar](20) NULL,
	[Username] [nvarchar](15) NULL,
	[Password] [nvarchar](20) NULL,
	[Role] [nvarchar](15) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ShiftsToDisplay]    Script Date: 27/12/2020 21:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ShiftsToDisplay]
AS
SELECT       dbo.ShiftTypes.TypeTitle, dbo.Employees.FirstName, dbo.Employees.LastName, dbo.PastShifts.Started, dbo.PastShifts.Ended
FROM          dbo.PastShifts INNER JOIN
                    dbo.Employees ON dbo.Employees.EmployeeID = dbo.PastShifts.EmployeeID INNER JOIN
                    dbo.ShiftTypes ON dbo.ShiftTypes.ShiftTypeID = dbo.PastShifts.ShiftTypeID
GO
/****** Object:  Table [dbo].[Business]    Script Date: 27/12/2020 21:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business](
	[BusinessID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessName] [nvarchar](20) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[LineOfBusiness] [nvarchar](15) NULL,
	[ManagerName] [nvarchar](20) NULL,
	[Phone] [nvarchar](15) NULL,
	[EstimatedEmployeesNum] [int] NULL,
	[ContactName] [nvarchar](15) NULL,
	[ContactPhone] [nvarchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FutureShifts]    Script Date: 27/12/2020 21:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FutureShifts](
	[FutureShiftID] [int] IDENTITY(1,1) NOT NULL,
	[ShiftTypeID] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_FutureShifts] PRIMARY KEY CLUSTERED 
(
	[FutureShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FutureShiftsEmployees]    Script Date: 27/12/2020 21:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FutureShiftsEmployees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FutureShiftId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_FutureShiftsEmployees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 27/12/2020 21:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftTypeId] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_Shifts] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiftsEmployees]    Script Date: 27/12/2020 21:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftsEmployees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiftId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_ShiftsEmloyees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [Title], [BirthDate], [HireDate], [Adress], [PostalCode], [Phone1], [Phone2], [Notes], [Photo], [PhotoPath], [IDCard], [Username], [Password], [Role]) VALUES (1, N'Moishe', N'Ufnik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Moshiko', N'1234', N'admin')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [Title], [BirthDate], [HireDate], [Adress], [PostalCode], [Phone1], [Phone2], [Notes], [Photo], [PhotoPath], [IDCard], [Username], [Password], [Role]) VALUES (2, N'Kipi', N'Ben-Kipod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Kipkip', N'abcd', N'manager')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [Title], [BirthDate], [HireDate], [Adress], [PostalCode], [Phone1], [Phone2], [Notes], [Photo], [PhotoPath], [IDCard], [Username], [Password], [Role]) VALUES (3, N'Ugi', N'Fletzet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'coocky', N'ab12', N'user')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [Title], [BirthDate], [HireDate], [Adress], [PostalCode], [Phone1], [Phone2], [Notes], [Photo], [PhotoPath], [IDCard], [Username], [Password], [Role]) VALUES (4, N'Kruvi', N'Ben-Kruv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'cabbage', N'ab12', N'user')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [Title], [BirthDate], [HireDate], [Adress], [PostalCode], [Phone1], [Phone2], [Notes], [Photo], [PhotoPath], [IDCard], [Username], [Password], [Role]) VALUES (5, N'Arik', N'Henson', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'einstein', N'ab12', N'user')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [Title], [BirthDate], [HireDate], [Adress], [PostalCode], [Phone1], [Phone2], [Notes], [Photo], [PhotoPath], [IDCard], [Username], [Password], [Role]) VALUES (6, N'Shmulik', N'Kipod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'shmul', N'abcd', N'manager')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [Title], [BirthDate], [HireDate], [Adress], [PostalCode], [Phone1], [Phone2], [Notes], [Photo], [PhotoPath], [IDCard], [Username], [Password], [Role]) VALUES (7, N'Mitz', N'Petel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'rabbit', N'ab12', N'user')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[FutureShifts] ON 

INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (1, 1, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (2, 2, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (3, 3, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (4, 4, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (5, 5, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (6, 6, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (7, 7, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (8, 8, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (9, 9, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (10, 10, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (11, 11, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (12, 12, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (13, 13, NULL, NULL)
INSERT [dbo].[FutureShifts] ([FutureShiftID], [ShiftTypeID], [StartTime], [EndTime]) VALUES (15, 14, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FutureShifts] OFF
GO
SET IDENTITY_INSERT [dbo].[FutureShiftsEmployees] ON 

INSERT [dbo].[FutureShiftsEmployees] ([Id], [FutureShiftId], [EmployeeId]) VALUES (1, 1, 1)
INSERT [dbo].[FutureShiftsEmployees] ([Id], [FutureShiftId], [EmployeeId]) VALUES (2, 2, 1)
INSERT [dbo].[FutureShiftsEmployees] ([Id], [FutureShiftId], [EmployeeId]) VALUES (3, 8, 1)
INSERT [dbo].[FutureShiftsEmployees] ([Id], [FutureShiftId], [EmployeeId]) VALUES (4, 4, 1)
INSERT [dbo].[FutureShiftsEmployees] ([Id], [FutureShiftId], [EmployeeId]) VALUES (5, 6, 1)
INSERT [dbo].[FutureShiftsEmployees] ([Id], [FutureShiftId], [EmployeeId]) VALUES (6, 10, 1)
SET IDENTITY_INSERT [dbo].[FutureShiftsEmployees] OFF
GO
SET IDENTITY_INSERT [dbo].[Shifts] ON 

INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (1, 1, CAST(N'2020-09-06T10:00:00.000' AS DateTime), CAST(N'2020-09-06T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (2, 14, CAST(N'2020-09-24T17:00:00.000' AS DateTime), CAST(N'2020-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (3, 14, CAST(N'2020-09-24T17:00:00.000' AS DateTime), CAST(N'2020-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (4, 14, CAST(N'2020-09-24T17:00:00.000' AS DateTime), CAST(N'2020-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (5, 14, CAST(N'2020-09-24T17:00:00.000' AS DateTime), CAST(N'2020-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (6, 1, CAST(N'2020-09-25T10:00:00.000' AS DateTime), CAST(N'2020-09-25T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (7, 1, CAST(N'2020-09-25T10:00:00.000' AS DateTime), CAST(N'2020-09-25T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (8, 1, CAST(N'2020-09-25T10:00:00.000' AS DateTime), CAST(N'2020-09-25T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (9, 13, CAST(N'2020-09-24T10:00:00.000' AS DateTime), CAST(N'2020-09-24T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (10, 2, CAST(N'2020-09-25T17:00:00.000' AS DateTime), CAST(N'2020-09-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (11, 2, CAST(N'2020-09-25T17:00:00.000' AS DateTime), CAST(N'2020-09-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (12, 2, CAST(N'2020-09-25T17:00:00.000' AS DateTime), CAST(N'2020-09-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (13, 3, CAST(N'2020-09-26T10:00:00.000' AS DateTime), CAST(N'2020-09-26T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (14, 3, CAST(N'2020-09-26T10:00:00.000' AS DateTime), CAST(N'2020-09-26T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (15, 3, CAST(N'2020-09-26T10:00:00.000' AS DateTime), CAST(N'2020-09-26T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (16, 3, CAST(N'2020-09-26T10:00:00.000' AS DateTime), CAST(N'2020-09-26T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (17, 4, CAST(N'2020-09-26T17:00:00.000' AS DateTime), CAST(N'2020-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (18, 2, CAST(N'2020-09-25T17:00:00.000' AS DateTime), CAST(N'2020-09-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (19, 13, CAST(N'2020-09-24T10:00:00.000' AS DateTime), CAST(N'2020-09-24T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (20, 13, CAST(N'2020-09-24T10:00:00.000' AS DateTime), CAST(N'2020-09-24T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (21, 13, CAST(N'2020-09-24T10:00:00.000' AS DateTime), CAST(N'2020-09-24T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (22, 8, CAST(N'2020-09-21T17:00:00.000' AS DateTime), CAST(N'2020-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (23, 9, CAST(N'2020-09-22T10:00:00.000' AS DateTime), CAST(N'2020-09-22T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (24, 9, CAST(N'2020-09-22T10:00:00.000' AS DateTime), CAST(N'2020-09-22T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (25, 9, CAST(N'2020-09-22T10:00:00.000' AS DateTime), CAST(N'2020-09-22T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (26, 9, CAST(N'2020-09-22T10:00:00.000' AS DateTime), CAST(N'2020-09-22T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (27, 10, CAST(N'2020-09-22T17:00:00.000' AS DateTime), CAST(N'2020-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (28, 10, CAST(N'2020-09-22T17:00:00.000' AS DateTime), CAST(N'2020-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (29, 10, CAST(N'2020-09-22T17:00:00.000' AS DateTime), CAST(N'2020-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (30, 10, CAST(N'2020-09-22T17:00:00.000' AS DateTime), CAST(N'2020-09-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (31, 11, CAST(N'2020-09-23T10:00:00.000' AS DateTime), CAST(N'2020-09-23T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (32, 11, CAST(N'2020-09-23T10:00:00.000' AS DateTime), CAST(N'2020-09-23T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (33, 11, CAST(N'2020-09-23T10:00:00.000' AS DateTime), CAST(N'2020-09-23T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (34, 11, CAST(N'2020-09-23T10:00:00.000' AS DateTime), CAST(N'2020-09-23T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (35, 12, CAST(N'2020-09-23T17:00:00.000' AS DateTime), CAST(N'2020-09-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (36, 12, CAST(N'2020-09-23T17:00:00.000' AS DateTime), CAST(N'2020-09-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (37, 12, CAST(N'2020-09-23T17:00:00.000' AS DateTime), CAST(N'2020-09-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (38, 12, CAST(N'2020-09-23T17:00:00.000' AS DateTime), CAST(N'2020-09-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (39, 4, CAST(N'2020-09-26T17:00:00.000' AS DateTime), CAST(N'2020-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (40, 4, CAST(N'2020-09-26T17:00:00.000' AS DateTime), CAST(N'2020-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (41, 4, CAST(N'2020-09-26T17:00:00.000' AS DateTime), CAST(N'2020-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (42, 5, CAST(N'2020-09-27T10:00:00.000' AS DateTime), CAST(N'2020-09-27T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (43, 10, CAST(N'2020-09-29T17:00:00.000' AS DateTime), CAST(N'2020-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (44, 10, CAST(N'2020-09-29T17:00:00.000' AS DateTime), CAST(N'2020-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (45, 11, CAST(N'2020-09-30T10:00:00.000' AS DateTime), CAST(N'2020-09-30T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (46, 11, CAST(N'2020-09-30T10:00:00.000' AS DateTime), CAST(N'2020-09-30T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (47, 11, CAST(N'2020-09-30T10:00:00.000' AS DateTime), CAST(N'2020-09-30T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (48, 11, CAST(N'2020-09-30T10:00:00.000' AS DateTime), CAST(N'2020-09-30T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (49, 12, CAST(N'2020-09-30T17:00:00.000' AS DateTime), CAST(N'2020-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (50, 12, CAST(N'2020-09-30T17:00:00.000' AS DateTime), CAST(N'2020-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (51, 12, CAST(N'2020-09-30T17:00:00.000' AS DateTime), CAST(N'2020-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (52, 12, CAST(N'2020-09-30T17:00:00.000' AS DateTime), CAST(N'2020-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (53, 13, CAST(N'2020-10-01T10:00:00.000' AS DateTime), CAST(N'2020-10-01T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (54, 13, CAST(N'2020-10-01T10:00:00.000' AS DateTime), CAST(N'2020-10-01T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (55, 13, CAST(N'2020-10-01T10:00:00.000' AS DateTime), CAST(N'2020-10-01T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (56, 13, CAST(N'2020-10-01T10:00:00.000' AS DateTime), CAST(N'2020-10-01T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (57, 14, CAST(N'2020-10-01T17:00:00.000' AS DateTime), CAST(N'2020-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (58, 14, CAST(N'2020-10-01T17:00:00.000' AS DateTime), CAST(N'2020-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (59, 14, CAST(N'2020-10-01T17:00:00.000' AS DateTime), CAST(N'2020-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (60, 10, CAST(N'2020-09-29T17:00:00.000' AS DateTime), CAST(N'2020-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (61, 8, CAST(N'2020-09-21T17:00:00.000' AS DateTime), CAST(N'2020-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (62, 10, CAST(N'2020-09-29T17:00:00.000' AS DateTime), CAST(N'2020-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (63, 9, CAST(N'2020-09-29T10:00:00.000' AS DateTime), CAST(N'2020-09-29T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (64, 5, CAST(N'2020-09-27T10:00:00.000' AS DateTime), CAST(N'2020-09-27T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (65, 5, CAST(N'2020-09-27T10:00:00.000' AS DateTime), CAST(N'2020-09-27T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (66, 5, CAST(N'2020-09-27T10:00:00.000' AS DateTime), CAST(N'2020-09-27T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (67, 6, CAST(N'2020-09-27T17:00:00.000' AS DateTime), CAST(N'2020-09-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (68, 6, CAST(N'2020-09-27T17:00:00.000' AS DateTime), CAST(N'2020-09-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (69, 6, CAST(N'2020-09-27T17:00:00.000' AS DateTime), CAST(N'2020-09-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (70, 6, CAST(N'2020-09-27T17:00:00.000' AS DateTime), CAST(N'2020-09-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (71, 7, CAST(N'2020-09-28T10:00:00.000' AS DateTime), CAST(N'2020-09-28T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (72, 7, CAST(N'2020-09-28T10:00:00.000' AS DateTime), CAST(N'2020-09-28T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (73, 7, CAST(N'2020-09-28T10:00:00.000' AS DateTime), CAST(N'2020-09-28T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (74, 7, CAST(N'2020-09-28T10:00:00.000' AS DateTime), CAST(N'2020-09-28T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (75, 8, CAST(N'2020-09-28T17:00:00.000' AS DateTime), CAST(N'2020-09-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (76, 8, CAST(N'2020-09-28T17:00:00.000' AS DateTime), CAST(N'2020-09-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (77, 8, CAST(N'2020-09-28T17:00:00.000' AS DateTime), CAST(N'2020-09-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (78, 8, CAST(N'2020-09-28T17:00:00.000' AS DateTime), CAST(N'2020-09-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (79, 9, CAST(N'2020-09-29T10:00:00.000' AS DateTime), CAST(N'2020-09-29T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (80, 9, CAST(N'2020-09-29T10:00:00.000' AS DateTime), CAST(N'2020-09-29T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (81, 9, CAST(N'2020-09-29T10:00:00.000' AS DateTime), CAST(N'2020-09-29T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (82, 8, CAST(N'2020-09-21T17:00:00.000' AS DateTime), CAST(N'2020-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (83, 8, CAST(N'2020-09-21T17:00:00.000' AS DateTime), CAST(N'2020-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (84, 7, CAST(N'2020-09-21T10:00:00.000' AS DateTime), CAST(N'2020-09-21T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (85, 6, CAST(N'2020-09-10T17:00:00.000' AS DateTime), CAST(N'2020-09-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (86, 7, CAST(N'2020-09-11T10:00:00.000' AS DateTime), CAST(N'2020-09-12T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (87, 7, CAST(N'2020-09-11T10:00:00.000' AS DateTime), CAST(N'2020-09-12T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (88, 7, CAST(N'2020-09-11T10:00:00.000' AS DateTime), CAST(N'2020-09-12T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (89, 7, CAST(N'2020-09-11T10:00:00.000' AS DateTime), CAST(N'2020-09-12T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (90, 8, CAST(N'2020-09-12T17:00:00.000' AS DateTime), CAST(N'2020-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (91, 8, CAST(N'2020-09-12T17:00:00.000' AS DateTime), CAST(N'2020-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (92, 8, CAST(N'2020-09-12T17:00:00.000' AS DateTime), CAST(N'2020-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (93, 8, CAST(N'2020-09-12T17:00:00.000' AS DateTime), CAST(N'2020-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (94, 9, CAST(N'2020-09-13T10:00:00.000' AS DateTime), CAST(N'2020-09-13T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (95, 9, CAST(N'2020-09-13T10:00:00.000' AS DateTime), CAST(N'2020-09-13T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (96, 9, CAST(N'2020-09-13T10:00:00.000' AS DateTime), CAST(N'2020-09-13T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (97, 9, CAST(N'2020-09-13T10:00:00.000' AS DateTime), CAST(N'2020-09-13T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (98, 10, CAST(N'2020-09-13T17:00:00.000' AS DateTime), CAST(N'2020-09-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (99, 10, CAST(N'2020-09-13T17:00:00.000' AS DateTime), CAST(N'2020-09-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (100, 10, CAST(N'2020-09-13T17:00:00.000' AS DateTime), CAST(N'2020-09-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (101, 10, CAST(N'2020-09-13T17:00:00.000' AS DateTime), CAST(N'2020-09-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (102, 6, CAST(N'2020-09-10T17:00:00.000' AS DateTime), CAST(N'2020-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (103, 11, CAST(N'2020-09-14T10:00:00.000' AS DateTime), CAST(N'2020-09-15T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (104, 6, CAST(N'2020-09-10T17:00:00.000' AS DateTime), CAST(N'2020-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (105, 5, CAST(N'2020-09-09T00:00:00.000' AS DateTime), CAST(N'2020-09-10T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (106, 1, CAST(N'2020-09-06T10:00:00.000' AS DateTime), CAST(N'2020-09-06T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (107, 1, CAST(N'2020-09-06T10:00:00.000' AS DateTime), CAST(N'2020-09-06T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (108, 2, CAST(N'2020-09-06T17:00:00.000' AS DateTime), CAST(N'2020-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (109, 2, CAST(N'2020-09-06T17:00:00.000' AS DateTime), CAST(N'2020-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (110, 2, CAST(N'2020-09-06T17:00:00.000' AS DateTime), CAST(N'2020-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (111, 2, CAST(N'2020-09-06T17:00:00.000' AS DateTime), CAST(N'2020-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (112, 3, CAST(N'2020-09-07T10:00:00.000' AS DateTime), CAST(N'2020-09-07T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (113, 3, CAST(N'2020-09-07T10:00:00.000' AS DateTime), CAST(N'2020-09-07T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (114, 3, CAST(N'2020-09-07T10:00:00.000' AS DateTime), CAST(N'2020-09-07T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (115, 3, CAST(N'2020-09-07T10:00:00.000' AS DateTime), CAST(N'2020-09-07T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (116, 4, CAST(N'2020-09-08T17:00:00.000' AS DateTime), CAST(N'2020-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (117, 4, CAST(N'2020-09-08T17:00:00.000' AS DateTime), CAST(N'2020-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (118, 4, CAST(N'2020-09-08T17:00:00.000' AS DateTime), CAST(N'2020-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (119, 4, CAST(N'2020-09-08T17:00:00.000' AS DateTime), CAST(N'2020-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (120, 5, CAST(N'2020-09-09T00:00:00.000' AS DateTime), CAST(N'2020-09-10T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (121, 5, CAST(N'2020-09-09T00:00:00.000' AS DateTime), CAST(N'2020-09-10T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (122, 5, CAST(N'2020-09-09T00:00:00.000' AS DateTime), CAST(N'2020-09-10T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (123, 6, CAST(N'2020-09-10T17:00:00.000' AS DateTime), CAST(N'2020-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (124, 14, CAST(N'2020-10-01T17:00:00.000' AS DateTime), CAST(N'2020-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (125, 11, CAST(N'2020-09-14T10:00:00.000' AS DateTime), CAST(N'2020-09-15T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (126, 11, CAST(N'2020-09-14T10:00:00.000' AS DateTime), CAST(N'2020-09-15T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (127, 3, CAST(N'2020-09-19T10:00:00.000' AS DateTime), CAST(N'2020-09-19T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (128, 3, CAST(N'2020-09-19T10:00:00.000' AS DateTime), CAST(N'2020-09-19T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (129, 4, CAST(N'2020-09-19T17:00:00.000' AS DateTime), CAST(N'2020-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (130, 4, CAST(N'2020-09-19T17:00:00.000' AS DateTime), CAST(N'2020-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (131, 4, CAST(N'2020-09-19T17:00:00.000' AS DateTime), CAST(N'2020-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (132, 4, CAST(N'2020-09-19T17:00:00.000' AS DateTime), CAST(N'2020-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (133, 5, CAST(N'2020-09-20T10:00:00.000' AS DateTime), CAST(N'2020-09-20T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (134, 5, CAST(N'2020-09-20T10:00:00.000' AS DateTime), CAST(N'2020-09-20T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (135, 5, CAST(N'2020-09-20T10:00:00.000' AS DateTime), CAST(N'2020-09-20T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (136, 5, CAST(N'2020-09-20T10:00:00.000' AS DateTime), CAST(N'2020-09-20T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (137, 6, CAST(N'2020-09-20T17:00:00.000' AS DateTime), CAST(N'2020-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (138, 6, CAST(N'2020-09-20T17:00:00.000' AS DateTime), CAST(N'2020-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (139, 6, CAST(N'2020-09-20T17:00:00.000' AS DateTime), CAST(N'2020-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (140, 6, CAST(N'2020-09-20T17:00:00.000' AS DateTime), CAST(N'2020-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (141, 7, CAST(N'2020-09-21T10:00:00.000' AS DateTime), CAST(N'2020-09-21T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (142, 7, CAST(N'2020-09-21T10:00:00.000' AS DateTime), CAST(N'2020-09-21T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (143, 7, CAST(N'2020-09-21T10:00:00.000' AS DateTime), CAST(N'2020-09-21T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (144, 3, CAST(N'2020-09-19T10:00:00.000' AS DateTime), CAST(N'2020-09-19T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (145, 11, CAST(N'2020-09-14T10:00:00.000' AS DateTime), CAST(N'2020-09-15T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (146, 3, CAST(N'2020-09-19T10:00:00.000' AS DateTime), CAST(N'2020-09-19T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (147, 2, CAST(N'2020-09-18T17:00:00.000' AS DateTime), CAST(N'2020-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (148, 12, CAST(N'2020-09-15T17:00:00.000' AS DateTime), CAST(N'2020-09-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (149, 12, CAST(N'2020-09-15T17:00:00.000' AS DateTime), CAST(N'2020-09-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (150, 12, CAST(N'2020-09-15T17:00:00.000' AS DateTime), CAST(N'2020-09-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (151, 12, CAST(N'2020-09-15T17:00:00.000' AS DateTime), CAST(N'2020-09-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (152, 13, CAST(N'2020-09-16T10:00:00.000' AS DateTime), CAST(N'2020-09-17T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (153, 13, CAST(N'2020-09-16T10:00:00.000' AS DateTime), CAST(N'2020-09-17T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (154, 13, CAST(N'2020-09-16T10:00:00.000' AS DateTime), CAST(N'2020-09-17T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (155, 13, CAST(N'2020-09-16T10:00:00.000' AS DateTime), CAST(N'2020-09-17T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (156, 14, CAST(N'2020-09-17T17:00:00.000' AS DateTime), CAST(N'2020-09-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (157, 14, CAST(N'2020-09-17T17:00:00.000' AS DateTime), CAST(N'2020-09-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (158, 14, CAST(N'2020-09-17T17:00:00.000' AS DateTime), CAST(N'2020-09-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (159, 14, CAST(N'2020-09-17T17:00:00.000' AS DateTime), CAST(N'2020-09-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (160, 1, CAST(N'2020-09-18T10:00:00.000' AS DateTime), CAST(N'2020-09-18T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (161, 1, CAST(N'2020-09-18T10:00:00.000' AS DateTime), CAST(N'2020-09-18T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (162, 1, CAST(N'2020-09-18T10:00:00.000' AS DateTime), CAST(N'2020-09-18T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (163, 2, CAST(N'2020-09-18T17:00:00.000' AS DateTime), CAST(N'2020-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (164, 2, CAST(N'2020-09-18T17:00:00.000' AS DateTime), CAST(N'2020-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (165, 2, CAST(N'2020-09-18T17:00:00.000' AS DateTime), CAST(N'2020-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (166, 1, CAST(N'2020-09-06T10:00:00.000' AS DateTime), CAST(N'2020-09-06T17:00:00.000' AS DateTime))
INSERT [dbo].[Shifts] ([ShiftId], [ShiftTypeId], [StartTime], [EndTime]) VALUES (665, 4, CAST(N'2020-09-30T20:48:03.253' AS DateTime), CAST(N'2020-10-01T00:48:03.263' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shifts] OFF
GO
SET IDENTITY_INSERT [dbo].[ShiftsEmployees] ON 

INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (1, 1, 1)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (2, 1, 3)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (3, 1, 5)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (4, 1, 7)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (5, 2, 2)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (6, 2, 4)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (7, 2, 5)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (8, 2, 6)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (9, 3, 4)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (10, 3, 6)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (11, 3, 5)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (12, 3, 4)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (13, 4, 3)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (14, 4, 7)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (15, 4, 4)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (16, 4, 3)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (17, 5, 1)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (18, 5, 6)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (19, 5, 3)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (20, 5, 2)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (21, 6, 5)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (22, 6, 1)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (23, 6, 4)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (24, 6, 2)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (25, 7, 5)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (26, 7, 6)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (27, 7, 3)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (28, 9, 2)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (29, 10, 4)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (30, 13, 5)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (31, 17, 1)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (32, 18, 7)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (33, 19, 2)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (34, 22, 3)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (35, 24, 6)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (36, 9, 5)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (37, 10, 2)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (38, 19, 3)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (39, 108, 4)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (40, 108, 6)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (41, 108, 7)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (42, 109, 2)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (43, 109, 5)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (44, 109, 6)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (45, 110, 1)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (46, 110, 3)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (47, 110, 6)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (48, 111, 2)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (49, 111, 7)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (50, 112, 3)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (51, 112, 4)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (52, 113, 6)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (53, 113, 5)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (54, 114, 2)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (55, 114, 1)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (56, 54, 4)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (57, 56, 2)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (58, 57, 3)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (59, 58, 4)
INSERT [dbo].[ShiftsEmployees] ([Id], [ShiftId], [EmployeeId]) VALUES (60, 59, 1)
SET IDENTITY_INSERT [dbo].[ShiftsEmployees] OFF
GO
SET IDENTITY_INSERT [dbo].[ShiftTypes] ON 

INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (1, N'Sunday Morning', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (2, N'Sunday Evening', CAST(N'17:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (3, N'Monday Morning', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (4, N'Monday Evening', CAST(N'17:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (5, N'Tuseday Morning', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (6, N'Tuseday Evening', CAST(N'17:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (7, N'Wednesday Morning', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (8, N'Wednesday Evening', CAST(N'17:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (9, N'Thursday Morning', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (10, N'Thursday Evening', CAST(N'17:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (11, N'Friday Morning', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (12, N'Friday Evening', CAST(N'17:00:00' AS Time), CAST(N'00:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (13, N'Saturday Morning', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[ShiftTypes] ([ShiftTypeID], [TypeTitle], [Starts], [Ends]) VALUES (14, N'Saturday Evening', CAST(N'17:00:00' AS Time), CAST(N'00:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[ShiftTypes] OFF
GO
ALTER TABLE [dbo].[FutureShifts]  WITH CHECK ADD  CONSTRAINT [FK_FutureShifts_ShiftTypes] FOREIGN KEY([ShiftTypeID])
REFERENCES [dbo].[ShiftTypes] ([ShiftTypeID])
GO
ALTER TABLE [dbo].[FutureShifts] CHECK CONSTRAINT [FK_FutureShifts_ShiftTypes]
GO
ALTER TABLE [dbo].[FutureShiftsEmployees]  WITH CHECK ADD  CONSTRAINT [FK_FutureShiftsEmployees_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[FutureShiftsEmployees] CHECK CONSTRAINT [FK_FutureShiftsEmployees_Employees]
GO
ALTER TABLE [dbo].[FutureShiftsEmployees]  WITH CHECK ADD  CONSTRAINT [FK_FutureShiftsEmployees_FutureShifts] FOREIGN KEY([FutureShiftId])
REFERENCES [dbo].[FutureShifts] ([FutureShiftID])
GO
ALTER TABLE [dbo].[FutureShiftsEmployees] CHECK CONSTRAINT [FK_FutureShiftsEmployees_FutureShifts]
GO
ALTER TABLE [dbo].[Shifts]  WITH CHECK ADD  CONSTRAINT [FK_Shifts_ShiftTypes] FOREIGN KEY([ShiftTypeId])
REFERENCES [dbo].[ShiftTypes] ([ShiftTypeID])
GO
ALTER TABLE [dbo].[Shifts] CHECK CONSTRAINT [FK_Shifts_ShiftTypes]
GO
ALTER TABLE [dbo].[ShiftsEmployees]  WITH CHECK ADD  CONSTRAINT [FK_ShiftsEmloyees_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[ShiftsEmployees] CHECK CONSTRAINT [FK_ShiftsEmloyees_Employees]
GO
ALTER TABLE [dbo].[ShiftsEmployees]  WITH CHECK ADD  CONSTRAINT [FK_ShiftsEmloyees_Shifts] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Shifts] ([ShiftId])
GO
ALTER TABLE [dbo].[ShiftsEmployees] CHECK CONSTRAINT [FK_ShiftsEmloyees_Shifts]
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
         Begin Table = "PastShifts"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShiftTypes"
            Begin Extent = 
               Top = 150
               Left = 38
               Bottom = 290
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employees"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 146
               Right = 450
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ShiftsToDisplay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ShiftsToDisplay'
GO
USE [master]
GO
ALTER DATABASE [Tomedia Shifts Management] SET  READ_WRITE 
GO
