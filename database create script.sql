USE [master]
GO
/****** Object:  Database [Mamalian]    Script Date: 9-6-2017 10:12:27 ******/
CREATE DATABASE [Mamalian]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mamalian', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Mamalian.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Mamalian_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Mamalian_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Mamalian] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mamalian].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mamalian] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mamalian] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mamalian] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mamalian] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mamalian] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mamalian] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mamalian] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mamalian] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mamalian] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mamalian] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mamalian] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mamalian] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mamalian] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mamalian] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mamalian] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Mamalian] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mamalian] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mamalian] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mamalian] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mamalian] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mamalian] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mamalian] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mamalian] SET RECOVERY FULL 
GO
ALTER DATABASE [Mamalian] SET  MULTI_USER 
GO
ALTER DATABASE [Mamalian] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mamalian] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mamalian] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mamalian] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Mamalian] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Mamalian', N'ON'
GO
ALTER DATABASE [Mamalian] SET QUERY_STORE = OFF
GO
USE [Mamalian]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Mamalian]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PhysDamage] [int] NULL,
	[PhysReduction] [int] NULL,
	[ElemDamage] [int] NULL,
	[ElemReduction] [int] NULL,
	[Skills] [varchar](100) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enemy]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enemy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Race] [varchar](50) NOT NULL,
	[PhysDamage] [int] NULL,
	[ElemDamage] [int] NULL,
	[PhysReduction] [int] NULL,
	[ElemReduction] [int] NULL,
 CONSTRAINT [PK_Enemy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EnemyStats]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnemyStats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnemyId] [int] NOT NULL,
	[StatsId] [int] NOT NULL,
 CONSTRAINT [PK_EnemyStats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[GoldValue] [int] NOT NULL,
	[AttackSpeed] [real] NULL,
	[PhysDamage] [int] NULL,
	[ElemDamage] [int] NULL,
	[PhysReduction] [int] NULL,
	[ElemReduction] [int] NULL,
 CONSTRAINT [PK_Item_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Player]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Race] [varchar](50) NOT NULL,
	[Gold] [int] NULL,
	[Deaths] [int] NULL,
	[HighestWave] [int] NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlayerStats]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerStats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerId] [int] NOT NULL,
	[StatsId] [int] NOT NULL,
 CONSTRAINT [PK_PlayerStats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PotionStats]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PotionStats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PotionId] [int] NOT NULL,
	[StatsId] [int] NOT NULL,
 CONSTRAINT [PK_PotionStats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PowerUpBoost]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerUpBoost](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PowerUpId] [int] NOT NULL,
	[StatsId] [int] NOT NULL,
 CONSTRAINT [PK_PowerUpBoost] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PowerUps]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerUps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Duration] [int] NOT NULL,
 CONSTRAINT [PK_PowerUps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stats]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Level] [int] NULL,
	[Experience] [int] NULL,
	[Health] [int] NOT NULL,
	[Spirit] [int] NOT NULL,
	[HealthRegen] [float] NOT NULL,
	[SpiritRegen] [float] NOT NULL,
	[Strength] [int] NOT NULL,
	[Dexterity] [int] NOT NULL,
	[Intelligence] [int] NOT NULL,
 CONSTRAINT [PK_Stats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeamUpWith]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamUpWith](
	[SessionId] [int] IDENTITY(1,1) NOT NULL,
	[PlayerHost] [int] NOT NULL,
	[PlayerJoin] [int] NULL,
 CONSTRAINT [PK_TeamUpWith] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wave]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wave](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatMultiplier] [float] NOT NULL,
	[MaxMonsters] [int] NOT NULL,
 CONSTRAINT [PK_Wave] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WaveEnemies]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WaveEnemies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WaveId] [int] NOT NULL,
	[EnemyId] [int] NOT NULL,
 CONSTRAINT [PK_WaveEnemies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WavePowerUps]    Script Date: 9-6-2017 10:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WavePowerUps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WaveId] [int] NOT NULL,
	[PowerUpId] [int] NOT NULL,
 CONSTRAINT [PK_WavePowerUps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (1, N'Warrior', 11, 38, 0, 0, N'Tackle')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (2, N'Warrior', 150, 44, 0, 0, N'Bash')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (3, N'Warrior', 77, 83, 0, 0, N'War Cry')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (4, N'Warrior', 18, 86, 0, 0, N'War Cry')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (5, N'Warrior', 43, 1, 0, 0, N'Tackle')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (6, N'Warrior', 31, 67, 0, 0, N'Tackle')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (7, N'Warrior', 14, 75, 0, 0, N'War Cry')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (8, N'Warrior', 50, 8, 0, 0, N'Sweep')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (9, N'Warrior', 58, 29, 0, 0, N'Sweep')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (10, N'Warrior', 34, 97, 0, 0, N'Tackle')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (11, N'Warrior', 72, 59, 0, 0, N'Sweep')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (12, N'Warrior', 29, 67, 0, 0, N'War Cry')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (13, N'Warrior', 82, 12, 0, 0, N'War Cry')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (14, N'Warrior', 16, 11, 0, 0, N'Sweep')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (15, N'Warrior', 91, 10, 0, 0, N'Sweep')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (16, N'Warrior', 64, 14, 0, 0, N'War Cry')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (17, N'Warrior', 54, 91, 0, 0, N'Sweep')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (18, N'Warrior', 30, 91, 0, 0, N'Sweep')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (19, N'Warrior', 97, 32, 0, 0, N'Tackle')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (20, N'Warrior', 83, 66, 0, 0, N'Bash')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (21, N'Warrior', 78, 99, 0, 0, N'Bash')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (22, N'Warrior', 97, 56, 0, 0, N'Tackle')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (23, N'Warrior', 19, 77, 0, 0, N'Tackle')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (24, N'Warrior', 14, 86, 0, 0, N'Bash')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (25, N'Warrior', 33, 64, 0, 0, N'Sweep')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (26, N'Elementalist', 0, 0, 27, 17, N'Freezing Breath')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (27, N'Elementalist', 0, 0, 12, 30, N'Earth Shatter')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (28, N'Elementalist', 0, 0, 91, 18, N'Fiery Touch')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (29, N'Elementalist', 0, 0, 22, 68, N'Sizzling Gust')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (30, N'Elementalist', 0, 0, 1, 54, N'Sizzling Gust')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (31, N'Elementalist', 0, 0, 35, 14, N'Freezing Breath')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (32, N'Elementalist', 0, 0, 25, 47, N'Fiery Touch')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (33, N'Elementalist', 0, 0, 48, 94, N'Freezing Breath')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (34, N'Elementalist', 0, 0, 78, 80, N'Fiery Touch')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (35, N'Elementalist', 0, 0, 65, 1, N'Freezing Breath')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (36, N'Elementalist', 0, 0, 97, 53, N'Fiery Touch')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (37, N'Elementalist', 0, 0, 96, 9, N'Sizzling Gust')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (38, N'Elementalist', 0, 0, 29, 77, N'Sizzling Gust')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (39, N'Elementalist', 0, 0, 58, 93, N'Earth Shatter')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (40, N'Elementalist', 0, 0, 34, 4, N'Sizzling Gust')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (41, N'Elementalist', 0, 0, 84, 12, N'Sizzling Gust')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (42, N'Elementalist', 0, 0, 46, 74, N'Fiery Touch')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (43, N'Elementalist', 0, 0, 37, 60, N'Freezing Breath')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (44, N'Elementalist', 0, 0, 25, 57, N'Fiery Touch')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (45, N'Elementalist', 0, 0, 98, 59, N'Freezing Breath')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (46, N'Elementalist', 0, 0, 68, 22, N'Fiery Touch')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (47, N'Elementalist', 0, 0, 18, 58, N'Sizzling Gust')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (48, N'Elementalist', 0, 0, 14, 69, N'Fiery Touch')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (49, N'Elementalist', 0, 0, 45, 45, N'Freezing Breath')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (50, N'Elementalist', 0, 0, 92, 96, N'Fiery Touch')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (61, N'Warrior', 10, 5, 0, 0, N'Bash')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (62, N'Warrior', 10, 5, 0, 0, N'Bash')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (63, N'Warrior', 10, 5, 0, 0, N'Bash')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (64, N'Warrior', 10, 5, 0, 0, N'Bash')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (65, N'Warrior', 10, 5, 0, 0, N'Bash')
INSERT [dbo].[Class] ([Id], [Name], [PhysDamage], [PhysReduction], [ElemDamage], [ElemReduction], [Skills]) VALUES (66, N'Warrior', 10, 5, 0, 0, N'Bash')
SET IDENTITY_INSERT [dbo].[Enemy] ON 

INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (1, N'Nicole', N'Female', N'Fish', 81, 47, 95, 7)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (2, N'Bonnie', N'Female', N'Fish', 96, 8, 78, 84)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (3, N'Henry', N'Male', N'Fish', 40, 53, 80, 85)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (4, N'Louise', N'Female', N'Fish', 21, 81, 36, 22)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (5, N'Phyllis', N'Female', N'Fish', 57, 22, 89, 73)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (6, N'Ruth', N'Male', N'Dog', 12, 12, 91, 31)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (7, N'Marilyn', N'Female', N'Dog', 24, 45, 76, 49)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (8, N'Beverly', N'Female', N'Fish', 5, 55, 85, 19)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (9, N'Shirley', N'Female', N'Fish', 51, 23, 87, 38)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (10, N'Gerald', N'Male', N'Cat', 4, 65, 11, 2)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (11, N'Debra', N'Female', N'Fish', 81, 52, 87, 37)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (12, N'Jonathan', N'Male', N'Cat', 3, 45, 2, 73)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (13, N'Shawn', N'Male', N'Fish', 78, 58, 25, 14)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (14, N'Donna', N'Female', N'Cat', 50, 17, 63, 44)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (15, N'Ruby', N'Female', N'Fish', 51, 91, 55, 16)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (16, N'Christina', N'Female', N'Cat', 35, 93, 47, 92)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (17, N'Louise', N'Female', N'Fish', 39, 47, 16, 79)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (18, N'Steve', N'Male', N'Pidgeon', 16, 36, 48, 21)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (19, N'Betty', N'Female', N'Cat', 33, 33, 44, 16)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (20, N'Jane', N'Female', N'Pidgeon', 63, 30, 41, 96)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (21, N'Fred', N'Male', N'Fish', 40, 13, 35, 91)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (22, NULL, N'Male', N'Dog', 28, 77, 98, 47)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (23, N'Jeremy', N'Male', N'Pidgeon', 86, 57, 84, 74)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (24, N'Jerry', N'Male', N'Pidgeon', 66, 11, 9, 71)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (25, N'Adam', N'Male', N'Fish', 19, 45, 3, 99)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (26, N'Betty', N'Female', N'Dog', 48, 51, 50, 19)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (27, N'Ronald', N'Male', N'Pidgeon', 54, 69, 35, 25)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (28, N'Deborah', N'Female', N'Dog', 5, 65, 25, 91)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (29, N'Joe', N'Male', N'Fish', 81, 2, 25, 22)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (30, NULL, N'Male', N'Dog', 17, 62, 82, 79)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (31, N'Edward', N'Male', N'Cat', 35, 27, 7, 72)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (32, N'Todd', N'Male', N'Dog', 100, 70, 38, 74)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (33, N'Alan', N'Male', N'Dog', 79, 12, 67, 93)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (34, N'Gary', N'Male', N'Pidgeon', 12, 90, 72, 37)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (35, N'Wayne', N'Male', N'Pidgeon', 47, 39, 26, 53)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (36, N'Lawrence', N'Male', N'Fish', 58, 35, 72, 4)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (37, N'Anna', N'Female', N'Fish', 70, 76, 68, 2)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (38, N'Lisa', N'Female', N'Pidgeon', 6, 91, 68, 48)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (39, N'Sean', N'Male', N'Cat', 92, 73, 35, 24)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (40, N'Lisa', N'Female', N'Cat', 78, 24, 23, 71)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (41, N'William', N'Male', N'Fish', 43, 68, 69, 62)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (42, N'Victor', N'Male', N'Fish', 2, 95, 12, 100)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (43, NULL, N'Male', N'Cat', 31, 47, 71, 6)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (44, N'Michelle', N'Female', N'Pidgeon', 73, 80, 98, 84)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (45, N'Betty', N'Female', N'Pidgeon', 94, 94, 70, 89)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (46, N'Joe', N'Male', N'Cat', 100, 68, 86, 48)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (47, N'Nicholas', N'Male', N'Pidgeon', 41, 46, 57, 48)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (48, N'Julia', N'Female', N'Pidgeon', 64, 7, 21, 44)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (49, N'Frank', N'Male', N'Dog', 52, 62, 1, 32)
INSERT [dbo].[Enemy] ([Id], [Name], [Gender], [Race], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (50, N'Albert', N'Male', N'Pidgeon', 31, 44, 99, 59)
SET IDENTITY_INSERT [dbo].[Enemy] OFF
SET IDENTITY_INSERT [dbo].[EnemyStats] ON 

INSERT [dbo].[EnemyStats] ([Id], [EnemyId], [StatsId]) VALUES (1, 1, 4)
INSERT [dbo].[EnemyStats] ([Id], [EnemyId], [StatsId]) VALUES (2, 2, 5)
INSERT [dbo].[EnemyStats] ([Id], [EnemyId], [StatsId]) VALUES (3, 3, 6)
INSERT [dbo].[EnemyStats] ([Id], [EnemyId], [StatsId]) VALUES (4, 4, 7)
INSERT [dbo].[EnemyStats] ([Id], [EnemyId], [StatsId]) VALUES (5, 5, 8)
INSERT [dbo].[EnemyStats] ([Id], [EnemyId], [StatsId]) VALUES (6, 6, 9)
INSERT [dbo].[EnemyStats] ([Id], [EnemyId], [StatsId]) VALUES (7, 7, 10)
INSERT [dbo].[EnemyStats] ([Id], [EnemyId], [StatsId]) VALUES (8, 8, 11)
INSERT [dbo].[EnemyStats] ([Id], [EnemyId], [StatsId]) VALUES (9, 9, 12)
INSERT [dbo].[EnemyStats] ([Id], [EnemyId], [StatsId]) VALUES (10, 10, 13)
INSERT [dbo].[EnemyStats] ([Id], [EnemyId], [StatsId]) VALUES (11, 11, 14)
SET IDENTITY_INSERT [dbo].[EnemyStats] OFF
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([Id], [PlayerId], [ItemId]) VALUES (1, 1, 1)
INSERT [dbo].[Inventory] ([Id], [PlayerId], [ItemId]) VALUES (6, 2, 1)
INSERT [dbo].[Inventory] ([Id], [PlayerId], [ItemId]) VALUES (2, 1, 2)
INSERT [dbo].[Inventory] ([Id], [PlayerId], [ItemId]) VALUES (7, 2, 2)
INSERT [dbo].[Inventory] ([Id], [PlayerId], [ItemId]) VALUES (3, 1, 3)
INSERT [dbo].[Inventory] ([Id], [PlayerId], [ItemId]) VALUES (8, 2, 3)
INSERT [dbo].[Inventory] ([Id], [PlayerId], [ItemId]) VALUES (4, 1, 4)
INSERT [dbo].[Inventory] ([Id], [PlayerId], [ItemId]) VALUES (9, 3, 4)
INSERT [dbo].[Inventory] ([Id], [PlayerId], [ItemId]) VALUES (5, 1, 7)
INSERT [dbo].[Inventory] ([Id], [PlayerId], [ItemId]) VALUES (10, 3, 7)
SET IDENTITY_INSERT [dbo].[Inventory] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [Type], [Name], [Description], [GoldValue], [AttackSpeed], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (1, 3, N'Spirit Potion', N'Restores a bit of Spirit', 150, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Item] ([Id], [Type], [Name], [Description], [GoldValue], [AttackSpeed], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (2, 3, N'Health Potion', N'Restores a bit of Health', 150, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Item] ([Id], [Type], [Name], [Description], [GoldValue], [AttackSpeed], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (3, 2, N'Wooden Chestplate', N'Shoddy chestplate made out of wood', 300, NULL, NULL, NULL, 23, 3)
INSERT [dbo].[Item] ([Id], [Type], [Name], [Description], [GoldValue], [AttackSpeed], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (4, 1, N'Broken Sword', N'A broken sword which can barely hold itself togeth', 150, 0.5, 5, 0, NULL, NULL)
INSERT [dbo].[Item] ([Id], [Type], [Name], [Description], [GoldValue], [AttackSpeed], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (5, 1, N'Heavy Sword', N'A hevay sword which is quite hard to lift', 150, 0.45, 20, 0, NULL, NULL)
INSERT [dbo].[Item] ([Id], [Type], [Name], [Description], [GoldValue], [AttackSpeed], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (6, 1, N'Swift Sword', N'A light sword which is very swift.', 150, 2, 0, 5, NULL, NULL)
INSERT [dbo].[Item] ([Id], [Type], [Name], [Description], [GoldValue], [AttackSpeed], [PhysDamage], [ElemDamage], [PhysReduction], [ElemReduction]) VALUES (7, 1, N'Schep', N'A spade which is trying to replace Reddit and Face', 50000, 1.5, 15, 20, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[Player] ON 

INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (1, N'Sharon', N'Female', N'Cat', 4005, 32, 18)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (2, N'Terry', N'Male', N'Fish', 3331, 99, 13)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (3, N'Dennis', N'Male', N'Dog', 6828, 16, 2)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (4, N'Frank', N'Male', N'Dog', 28, 99, 5)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (5, N'Betty', N'Female', N'Dog', 5785, 10, 23)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (6, N'Catherine', N'Female', N'Fish', 1252, 82, 6)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (7, N'Raymond', N'Male', N'Cat', 8046, 86, 5)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (8, N'Sean', N'Male', N'Dog', 9472, 52, 19)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (9, N'Henry', N'Male', N'Cat', 5684, 92, 16)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (10, N'Michael', N'Male', N'Dog', 2873, 67, 3)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (11, N'Carlos', N'Male', N'Fish', 3062, 89, 18)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (12, N'Stephanie', N'Female', N'Fish', 5945, 3, 6)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (13, N'Bonnie', N'Female', N'Pidgeon', 8868, 8, 2)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (14, N'Kathy', N'Female', N'Pidgeon', 2773, 56, 4)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (15, N'Debra', N'Female', N'Cat', 6800, 87, 17)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (16, N'Judy', N'Female', N'Pidgeon', 3589, 60, 22)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (17, N'Robin', N'Female', N'Pidgeon', 9613, 47, 19)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (18, N'Jean', N'Female', N'Cat', 1897, 57, 25)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (19, N'Philip', N'Male', N'Cat', 3387, 27, 15)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (20, N'Henry', N'Male', N'Fish', 8914, 92, 24)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (21, N'Kathryn', N'Female', N'Dog', 1886, 5, 16)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (22, N'Adam', N'Male', N'Dog', 718, 22, 17)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (23, N'Ryan', N'Male', N'Pidgeon', 1368, 34, 23)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (24, N'Jesse', N'Male', N'Cat', 7423, 77, 10)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (25, N'Wanda', N'Female', N'Fish', 2324, 20, 24)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (26, N'Roger', N'Male', N'Dog', 3685, 39, 20)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (27, N'Clarence', N'Male', N'Pidgeon', 4496, 53, 24)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (28, N'Jose', N'Male', N'Dog', 2673, 51, 20)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (29, N'Donald', N'Male', N'Cat', 2234, 37, 22)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (30, N'Pamela', N'Female', N'Pidgeon', 2601, 53, 14)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (31, N'Jack', N'Male', N'Pidgeon', 8774, 75, 17)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (32, N'Willie', N'Male', N'Dog', 3559, 25, 22)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (33, N'Sara', N'Female', N'Cat', 9068, 92, 7)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (34, N'Jesse', N'Male', N'Cat', 1998, 98, 16)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (35, N'James', N'Male', N'Pidgeon', 1050, 45, 15)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (36, N'Brandon', N'Male', N'Cat', 8718, 78, 22)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (37, N'Adam', N'Male', N'Pidgeon', 9717, 42, 0)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (38, N'Mildred', N'Female', N'Cat', 9924, 38, 12)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (39, N'Nicholas', N'Male', N'Fish', 280, 92, 2)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (40, N'Larry', N'Male', N'Fish', 9804, 20, 0)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (41, N'Billy', N'Male', N'Dog', 6689, 25, 9)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (42, N'Daniel', N'Male', N'Fish', 6606, 31, 3)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (43, N'Eugene', N'Male', N'Dog', 7929, 14, 13)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (44, N'Donna', N'Female', N'Pidgeon', 1873, 18, 20)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (45, N'Brandon', N'Male', N'Pidgeon', 3718, 46, 12)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (46, N'Jesse', N'Male', N'Fish', 5503, 81, 10)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (47, N'Kelly', N'Female', N'Cat', 1896, 44, 13)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (48, N'Samuel', N'Male', N'Dog', 9958, 77, 14)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (49, N'Phyllis', N'Female', N'Cat', 141, 7, 1)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (50, N'Jimmy', N'Male', N'Pidgeon', 9437, 94, 5)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (61, N'Fernandez', N'Male', N'Cat', 0, 0, 0)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (62, N'Fernandez', N'Male', N'Cat', 0, 0, 0)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (63, N'PietHenk', N'Male', N'Cat', 50, 0, 0)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (64, N'HenkGert', N'Male', N'Cat', 50, 0, 0)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (65, N'NieuweNaam', N'Male', N'Cat', 50, 0, 0)
INSERT [dbo].[Player] ([Id], [Name], [Gender], [Race], [Gold], [Deaths], [HighestWave]) VALUES (66, N'Pauper', N'Male', N'Cat', 50, 0, 0)
SET IDENTITY_INSERT [dbo].[Player] OFF
SET IDENTITY_INSERT [dbo].[PlayerStats] ON 

INSERT [dbo].[PlayerStats] ([Id], [PlayerId], [StatsId]) VALUES (1, 1, 3)
INSERT [dbo].[PlayerStats] ([Id], [PlayerId], [StatsId]) VALUES (4, 2, 4)
INSERT [dbo].[PlayerStats] ([Id], [PlayerId], [StatsId]) VALUES (9, 62, 23)
INSERT [dbo].[PlayerStats] ([Id], [PlayerId], [StatsId]) VALUES (10, 63, 24)
INSERT [dbo].[PlayerStats] ([Id], [PlayerId], [StatsId]) VALUES (11, 64, 25)
INSERT [dbo].[PlayerStats] ([Id], [PlayerId], [StatsId]) VALUES (12, 65, 27)
INSERT [dbo].[PlayerStats] ([Id], [PlayerId], [StatsId]) VALUES (13, 66, 28)
SET IDENTITY_INSERT [dbo].[PlayerStats] OFF
SET IDENTITY_INSERT [dbo].[PotionStats] ON 

INSERT [dbo].[PotionStats] ([Id], [PotionId], [StatsId]) VALUES (1, 1, 1)
INSERT [dbo].[PotionStats] ([Id], [PotionId], [StatsId]) VALUES (2, 2, 2)
SET IDENTITY_INSERT [dbo].[PotionStats] OFF
SET IDENTITY_INSERT [dbo].[PowerUpBoost] ON 

INSERT [dbo].[PowerUpBoost] ([Id], [PowerUpId], [StatsId]) VALUES (1, 1, 15)
INSERT [dbo].[PowerUpBoost] ([Id], [PowerUpId], [StatsId]) VALUES (2, 5, 16)
INSERT [dbo].[PowerUpBoost] ([Id], [PowerUpId], [StatsId]) VALUES (3, 6, 17)
INSERT [dbo].[PowerUpBoost] ([Id], [PowerUpId], [StatsId]) VALUES (4, 7, 18)
INSERT [dbo].[PowerUpBoost] ([Id], [PowerUpId], [StatsId]) VALUES (5, 8, 19)
SET IDENTITY_INSERT [dbo].[PowerUpBoost] OFF
SET IDENTITY_INSERT [dbo].[PowerUps] ON 

INSERT [dbo].[PowerUps] ([Id], [Name], [Description], [Duration]) VALUES (1, N'Super Strength', N'Gives the receiver super human strength', 150)
INSERT [dbo].[PowerUps] ([Id], [Name], [Description], [Duration]) VALUES (5, N'Regeneration', N'Gives the receiver insane health regeneration', 100)
INSERT [dbo].[PowerUps] ([Id], [Name], [Description], [Duration]) VALUES (6, N'Unlimited Power', N'Gives the receiver unlimited spirit regen', 150)
INSERT [dbo].[PowerUps] ([Id], [Name], [Description], [Duration]) VALUES (7, N'Healthy', N'Gives the receiver a big chunk of health', 300)
INSERT [dbo].[PowerUps] ([Id], [Name], [Description], [Duration]) VALUES (8, N'One with the Spirits', N'Gives the receiver a big chuck of spirit', 300)
SET IDENTITY_INSERT [dbo].[PowerUps] OFF
SET IDENTITY_INSERT [dbo].[Stats] ON 

INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (1, 1, 0, 25, 60, 0, 0, 0, 0, 0)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (2, 1, 0, 0, 25, 0, 0, 0, 0, 0)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (3, 1, 0, 100, 50, 0.5, 0.5, 15, 5, 10)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (4, 1, 0, 150, 30, 2.5, 1, 20, 9, 2)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (5, 5, 519, 510, 150, 9.5, 0, 35, 5, 0)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (6, 2, 218, 20, 90, 0, 5, 3, 0, 15)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (7, 20, 20, 20, 90, 0, 0, 5, 0, 5)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (8, 1, 20, 20, 5, 0, 0, 5, 0, 5)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (9, 1, 25, 30, 15, 0.5, 0.5, 10, 5, 5)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (10, 2, 225, 130, 15, 1.5, 1.5, 20, 0, 0)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (11, 1, 125, 40, 5, 1.5, 0, 20, 0, 0)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (12, 1, 125, 80, 50, 1.5, 0, 10, 5, 0)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (13, 1, 125, 50, 30, 1.5, 0, 5, 15, 2)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (14, 1, 125, 50, 30, 1.5, 0, 5, 15, 2)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (15, 1, 0, 0, 0, 0, 0, 100, 0, 0)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (16, 1, 0, 0, 0, 50, 0, 0, 0, 0)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (17, 1, 0, 0, 0, 0, 200, 0, 0, 0)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (18, 1, 0, 150, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (19, 1, 0, 0, 150, 0, 0, 0, 0, 0)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (21, 1, 0, 100, 20, 0.5, 0.5, 10, 6, 5)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (23, 1, 0, 100, 20, 0.5, 0.5, 10, 6, 5)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (24, 1, 0, 100, 20, 0.5, 0.5, 10, 6, 5)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (25, 1, 0, 100, 20, 0.5, 0.5, 8, 8, 5)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (27, 1, 0, 100, 20, 0.5, 0.5, 4, 7, 10)
INSERT [dbo].[Stats] ([Id], [Level], [Experience], [Health], [Spirit], [HealthRegen], [SpiritRegen], [Strength], [Dexterity], [Intelligence]) VALUES (28, 1, 0, 100, 20, 0.5, 0.5, 4, 7, 10)
SET IDENTITY_INSERT [dbo].[Stats] OFF
SET IDENTITY_INSERT [dbo].[TeamUpWith] ON 

INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (1, 1, 2)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (2, 2, 1)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (3, 3, NULL)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (4, 4, NULL)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (5, 5, NULL)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (6, 6, NULL)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (7, 7, 5)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (8, 8, 26)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (9, 9, NULL)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (10, 10, 19)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (11, 11, 50)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (12, 12, NULL)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (13, 13, 5)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (14, 14, NULL)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (15, 15, NULL)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (16, 16, 21)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (17, 17, 1)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (18, 18, NULL)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (19, 19, NULL)
INSERT [dbo].[TeamUpWith] ([SessionId], [PlayerHost], [PlayerJoin]) VALUES (20, 20, NULL)
SET IDENTITY_INSERT [dbo].[TeamUpWith] OFF
SET IDENTITY_INSERT [dbo].[Wave] ON 

INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (1, 1, 5)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (2, 1, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (3, 1, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (4, 1, 30)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (5, 1.2, 5)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (6, 1, 40)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (7, 1, 50)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (8, 1, 60)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (9, 1, 70)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (11, 1.2, 5)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (12, 1.2, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (13, 1.2, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (14, 1.2, 30)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (15, 1.2, 40)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (16, 1.5, 5)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (17, 1.5, 50)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (18, 1.5, 60)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (19, 1.5, 70)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (20, 1.7, 5)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (21, 1.7, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (24, 1.7, 15)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (25, 1.7, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (26, 2, 5)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (27, 1.7, 25)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (28, 1.7, 30)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (29, 1.7, 35)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (30, 1.7, 40)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (31, 4, 5)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (32, 2, 15)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (33, 2, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (34, 2, 25)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (35, 2, 30)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (36, 2.2, 5)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (37, 2.2, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (38, 2.2, 15)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (39, 2.2, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (40, 2.2, 25)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (41, 2.2, 30)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (42, 2.5, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (43, 2.5, 15)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (44, 2.5, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (45, 2.7, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (46, 3, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (47, 3.2, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (48, 3.3, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (49, 3.3, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (50, 3.5, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (51, 3.5, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (52, 3.7, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (53, 4, 15)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (54, 4.2, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (55, 4.5, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (56, 4.7, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (57, 5, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (58, 5.1, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (59, 5.2, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (60, 5.3, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (61, 5.4, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (62, 5.5, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (63, 5.6, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (64, 5.7, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (65, 5.8, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (66, 5.9, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (67, 6, 10)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (68, 6, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (69, 6, 30)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (70, 6, 40)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (71, 6, 50)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (72, 6.5, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (73, 6.5, 25)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (74, 6.7, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (75, 7, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (78, 7.15, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (79, 7.3, 20)
INSERT [dbo].[Wave] ([Id], [StatMultiplier], [MaxMonsters]) VALUES (80, 7.5, 50)
SET IDENTITY_INSERT [dbo].[Wave] OFF
SET IDENTITY_INSERT [dbo].[WaveEnemies] ON 

INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (1, 1, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (2, 1, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (3, 1, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (4, 1, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (5, 1, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (6, 2, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (7, 2, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (8, 2, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (9, 2, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (10, 2, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (11, 2, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (12, 2, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (13, 2, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (14, 2, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (15, 2, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (16, 3, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (17, 3, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (18, 3, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (19, 3, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (20, 3, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (21, 3, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (22, 3, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (23, 3, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (24, 3, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (25, 3, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (26, 3, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (27, 3, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (28, 3, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (29, 3, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (30, 3, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (31, 3, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (32, 3, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (33, 3, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (34, 3, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (35, 3, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (36, 4, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (37, 4, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (38, 4, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (39, 4, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (40, 4, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (41, 4, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (42, 4, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (43, 4, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (44, 4, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (45, 4, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (46, 4, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (47, 4, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (48, 4, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (49, 4, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (50, 4, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (51, 4, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (52, 4, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (53, 4, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (54, 4, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (55, 4, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (56, 4, 3)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (57, 4, 21)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (58, 4, 47)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (59, 4, 41)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (60, 4, 35)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (61, 4, 26)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (62, 4, 14)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (63, 4, 15)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (64, 4, 9)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (65, 4, 49)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (66, 5, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (67, 5, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (68, 5, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (69, 5, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (70, 5, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (71, 6, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (72, 6, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (73, 6, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (74, 6, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (75, 6, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (76, 6, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (77, 6, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (78, 6, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (79, 6, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (80, 6, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (81, 6, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (82, 6, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (83, 6, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (84, 6, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (85, 6, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (86, 6, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (87, 6, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (88, 6, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (89, 6, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (90, 6, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (91, 6, 3)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (92, 6, 21)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (93, 6, 47)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (94, 6, 41)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (95, 6, 35)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (96, 6, 26)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (97, 6, 14)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (98, 6, 15)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (99, 6, 9)
GO
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (100, 6, 49)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (101, 6, 27)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (102, 6, 5)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (103, 6, 36)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (104, 6, 20)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (105, 6, 48)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (106, 6, 24)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (107, 6, 37)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (108, 6, 44)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (109, 6, 40)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (110, 6, 13)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (111, 7, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (112, 7, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (113, 7, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (114, 7, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (115, 7, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (116, 7, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (117, 7, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (118, 7, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (119, 7, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (120, 7, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (121, 7, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (122, 7, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (123, 7, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (124, 7, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (125, 7, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (126, 7, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (127, 7, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (128, 7, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (129, 7, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (130, 7, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (131, 7, 3)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (132, 7, 21)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (133, 7, 47)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (134, 7, 41)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (135, 7, 35)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (136, 7, 26)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (137, 7, 14)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (138, 7, 15)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (139, 7, 9)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (140, 7, 49)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (141, 7, 27)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (142, 7, 5)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (143, 7, 36)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (144, 7, 20)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (145, 7, 48)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (146, 7, 24)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (147, 7, 37)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (148, 7, 44)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (149, 7, 40)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (150, 7, 13)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (151, 7, 33)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (152, 7, 11)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (153, 7, 1)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (154, 7, 29)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (155, 7, 23)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (156, 7, 39)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (157, 7, 45)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (158, 7, 2)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (159, 7, 32)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (160, 7, 46)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (161, 8, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (162, 8, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (163, 8, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (164, 8, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (165, 8, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (166, 8, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (167, 8, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (168, 8, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (169, 8, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (170, 8, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (171, 8, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (172, 8, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (173, 8, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (174, 8, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (175, 8, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (176, 8, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (177, 8, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (178, 8, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (179, 8, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (180, 8, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (181, 8, 3)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (182, 8, 21)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (183, 8, 47)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (184, 8, 41)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (185, 8, 35)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (186, 8, 26)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (187, 8, 14)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (188, 8, 15)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (189, 8, 9)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (190, 8, 49)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (191, 8, 27)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (192, 8, 5)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (193, 8, 36)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (194, 8, 20)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (195, 8, 48)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (196, 8, 24)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (197, 8, 37)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (198, 8, 44)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (199, 8, 40)
GO
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (200, 8, 13)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (201, 8, 33)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (202, 8, 11)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (203, 8, 1)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (204, 8, 29)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (205, 8, 23)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (206, 8, 39)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (207, 8, 45)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (208, 8, 2)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (209, 8, 32)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (210, 8, 46)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (211, 8, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (212, 8, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (213, 8, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (214, 8, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (215, 8, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (216, 8, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (217, 8, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (218, 8, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (219, 8, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (220, 8, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (221, 9, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (222, 9, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (223, 9, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (224, 9, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (225, 9, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (226, 9, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (227, 9, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (228, 9, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (229, 9, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (230, 9, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (231, 9, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (232, 9, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (233, 9, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (234, 9, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (235, 9, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (236, 9, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (237, 9, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (238, 9, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (239, 9, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (240, 9, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (241, 9, 3)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (242, 9, 21)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (243, 9, 47)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (244, 9, 41)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (245, 9, 35)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (246, 9, 26)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (247, 9, 14)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (248, 9, 15)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (249, 9, 9)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (250, 9, 49)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (251, 9, 27)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (252, 9, 5)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (253, 9, 36)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (254, 9, 20)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (255, 9, 48)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (256, 9, 24)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (257, 9, 37)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (258, 9, 44)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (259, 9, 40)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (260, 9, 13)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (261, 9, 33)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (262, 9, 11)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (263, 9, 1)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (264, 9, 29)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (265, 9, 23)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (266, 9, 39)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (267, 9, 45)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (268, 9, 2)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (269, 9, 32)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (270, 9, 46)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (271, 9, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (272, 9, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (273, 9, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (274, 9, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (275, 9, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (276, 9, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (277, 9, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (278, 9, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (279, 9, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (280, 9, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (281, 9, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (282, 9, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (283, 9, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (284, 9, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (285, 9, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (286, 9, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (287, 9, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (288, 9, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (289, 9, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (290, 9, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (291, 11, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (292, 11, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (293, 11, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (294, 11, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (295, 11, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (296, 12, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (297, 12, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (298, 12, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (299, 12, 8)
GO
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (300, 12, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (301, 12, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (302, 12, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (303, 12, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (304, 12, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (305, 12, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (306, 13, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (307, 13, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (308, 13, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (309, 13, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (310, 13, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (311, 13, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (312, 13, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (313, 13, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (314, 13, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (315, 13, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (316, 13, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (317, 13, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (318, 13, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (319, 13, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (320, 13, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (321, 13, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (322, 13, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (323, 13, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (324, 13, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (325, 13, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (326, 14, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (327, 14, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (328, 14, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (329, 14, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (330, 14, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (331, 14, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (332, 14, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (333, 14, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (334, 14, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (335, 14, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (336, 14, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (337, 14, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (338, 14, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (339, 14, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (340, 14, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (341, 14, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (342, 14, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (343, 14, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (344, 14, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (345, 14, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (346, 14, 3)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (347, 14, 21)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (348, 14, 47)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (349, 14, 41)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (350, 14, 35)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (351, 14, 26)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (352, 14, 14)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (353, 14, 15)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (354, 14, 9)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (355, 14, 49)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (356, 15, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (357, 15, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (358, 15, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (359, 15, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (360, 15, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (361, 16, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (362, 16, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (363, 16, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (364, 16, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (365, 16, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (366, 16, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (367, 16, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (368, 16, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (369, 16, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (370, 16, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (371, 16, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (372, 16, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (373, 16, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (374, 16, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (375, 16, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (376, 16, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (377, 16, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (378, 16, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (379, 16, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (380, 16, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (381, 16, 3)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (382, 16, 21)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (383, 16, 47)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (384, 16, 41)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (385, 16, 35)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (386, 16, 26)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (387, 16, 14)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (388, 16, 15)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (389, 16, 9)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (390, 16, 49)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (391, 16, 27)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (392, 16, 5)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (393, 16, 36)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (394, 16, 20)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (395, 16, 48)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (396, 16, 24)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (397, 16, 37)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (398, 16, 44)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (399, 16, 40)
GO
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (400, 16, 13)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (401, 17, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (402, 17, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (403, 17, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (404, 17, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (405, 17, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (406, 17, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (407, 17, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (408, 17, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (409, 17, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (410, 17, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (411, 17, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (412, 17, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (413, 17, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (414, 17, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (415, 17, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (416, 17, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (417, 17, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (418, 17, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (419, 17, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (420, 17, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (421, 17, 3)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (422, 17, 21)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (423, 17, 47)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (424, 17, 41)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (425, 17, 35)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (426, 17, 26)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (427, 17, 14)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (428, 17, 15)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (429, 17, 9)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (430, 17, 49)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (431, 17, 27)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (432, 17, 5)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (433, 17, 36)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (434, 17, 20)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (435, 17, 48)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (436, 17, 24)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (437, 17, 37)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (438, 17, 44)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (439, 17, 40)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (440, 17, 13)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (441, 17, 33)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (442, 17, 11)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (443, 17, 1)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (444, 17, 29)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (445, 17, 23)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (446, 17, 39)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (447, 17, 45)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (448, 17, 2)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (449, 17, 32)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (450, 17, 46)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (451, 18, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (452, 18, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (453, 18, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (454, 18, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (455, 18, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (456, 18, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (457, 18, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (458, 18, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (459, 18, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (460, 18, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (461, 18, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (462, 18, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (463, 18, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (464, 18, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (465, 18, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (466, 18, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (467, 18, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (468, 18, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (469, 18, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (470, 18, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (471, 18, 3)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (472, 18, 21)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (473, 18, 47)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (474, 18, 41)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (475, 18, 35)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (476, 18, 26)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (477, 18, 14)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (478, 18, 15)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (479, 18, 9)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (480, 18, 49)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (481, 18, 27)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (482, 18, 5)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (483, 18, 36)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (484, 18, 20)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (485, 18, 48)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (486, 18, 24)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (487, 18, 37)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (488, 18, 44)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (489, 18, 40)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (490, 18, 13)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (491, 18, 33)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (492, 18, 11)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (493, 18, 1)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (494, 18, 29)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (495, 18, 23)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (496, 18, 39)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (497, 18, 45)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (498, 18, 2)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (499, 18, 32)
GO
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (500, 18, 46)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (501, 18, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (502, 18, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (503, 18, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (504, 18, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (505, 18, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (506, 18, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (507, 18, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (508, 18, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (509, 18, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (510, 18, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (511, 19, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (512, 19, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (513, 19, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (514, 19, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (515, 19, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (516, 19, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (517, 19, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (518, 19, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (519, 19, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (520, 19, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (521, 19, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (522, 19, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (523, 19, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (524, 19, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (525, 19, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (526, 19, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (527, 19, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (528, 19, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (529, 19, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (530, 19, 17)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (531, 19, 3)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (532, 19, 21)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (533, 19, 47)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (534, 19, 41)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (535, 19, 35)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (536, 19, 26)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (537, 19, 14)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (538, 19, 15)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (539, 19, 9)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (540, 19, 49)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (541, 19, 27)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (542, 19, 5)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (543, 19, 36)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (544, 19, 20)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (545, 19, 48)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (546, 19, 24)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (547, 19, 37)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (548, 19, 44)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (549, 19, 40)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (550, 19, 13)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (551, 19, 33)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (552, 19, 11)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (553, 19, 1)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (554, 19, 29)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (555, 19, 23)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (556, 19, 39)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (557, 19, 45)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (558, 19, 2)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (559, 19, 32)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (560, 19, 46)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (561, 19, 42)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (562, 19, 12)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (563, 19, 10)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (564, 19, 8)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (565, 19, 28)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (566, 19, 38)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (567, 19, 34)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (568, 19, 6)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (569, 19, 18)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (570, 19, 30)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (571, 19, 25)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (572, 19, 4)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (573, 19, 7)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (574, 19, 22)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (575, 19, 43)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (576, 19, 50)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (577, 19, 19)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (578, 19, 31)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (579, 19, 16)
INSERT [dbo].[WaveEnemies] ([Id], [WaveId], [EnemyId]) VALUES (580, 19, 17)
SET IDENTITY_INSERT [dbo].[WaveEnemies] OFF
SET IDENTITY_INSERT [dbo].[WavePowerUps] ON 

INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (1, 1, 1)
INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (2, 2, 5)
INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (3, 2, 6)
INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (4, 3, 7)
INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (5, 3, 8)
INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (6, 4, 5)
INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (7, 4, 6)
INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (8, 4, 7)
INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (9, 4, 8)
INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (10, 5, 1)
INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (11, 5, 5)
INSERT [dbo].[WavePowerUps] ([Id], [WaveId], [PowerUpId]) VALUES (12, 5, 6)
SET IDENTITY_INSERT [dbo].[WavePowerUps] OFF
/****** Object:  Index [IX_Inventory_NoDuplicates]    Script Date: 9-6-2017 10:12:27 ******/
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [IX_Inventory_NoDuplicates] UNIQUE NONCLUSTERED 
(
	[ItemId] ASC,
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeamUpWith]    Script Date: 9-6-2017 10:12:27 ******/
ALTER TABLE [dbo].[TeamUpWith] ADD  CONSTRAINT [IX_TeamUpWith] UNIQUE NONCLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Enemy] ADD  CONSTRAINT [DF_Enemy_Name]  DEFAULT ('James') FOR [Name]
GO
ALTER TABLE [dbo].[Enemy] ADD  CONSTRAINT [DF_Enemy_Gender]  DEFAULT ('Male') FOR [Gender]
GO
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [DF_Player_Name]  DEFAULT ('Jens') FOR [Name]
GO
ALTER TABLE [dbo].[Stats] ADD  DEFAULT ((1)) FOR [Level]
GO
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF__Stats__Experienc__300424B4]  DEFAULT ((0)) FOR [Experience]
GO
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_Health]  DEFAULT ((0)) FOR [Health]
GO
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_Spirit]  DEFAULT ((0)) FOR [Spirit]
GO
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_HealthRegen]  DEFAULT ((0)) FOR [HealthRegen]
GO
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_SpiritRegen]  DEFAULT ((0)) FOR [SpiritRegen]
GO
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_Strength]  DEFAULT ((0)) FOR [Strength]
GO
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_Dexterity]  DEFAULT ((0)) FOR [Dexterity]
GO
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF_Stats_Intelligence]  DEFAULT ((0)) FOR [Intelligence]
GO
ALTER TABLE [dbo].[WaveEnemies] ADD  DEFAULT ((1)) FOR [WaveId]
GO
ALTER TABLE [dbo].[WaveEnemies] ADD  DEFAULT ((1)) FOR [EnemyId]
GO
ALTER TABLE [dbo].[EnemyStats]  WITH CHECK ADD  CONSTRAINT [FK_EnemyStats_Enemy] FOREIGN KEY([EnemyId])
REFERENCES [dbo].[Enemy] ([Id])
GO
ALTER TABLE [dbo].[EnemyStats] CHECK CONSTRAINT [FK_EnemyStats_Enemy]
GO
ALTER TABLE [dbo].[EnemyStats]  WITH CHECK ADD  CONSTRAINT [FK_EnemyStats_Stats] FOREIGN KEY([StatsId])
REFERENCES [dbo].[Stats] ([Id])
GO
ALTER TABLE [dbo].[EnemyStats] CHECK CONSTRAINT [FK_EnemyStats_Stats]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Item]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Player] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Player]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_TeamsUpWith] FOREIGN KEY([Id])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_TeamsUpWith]
GO
ALTER TABLE [dbo].[PlayerStats]  WITH CHECK ADD  CONSTRAINT [FK_PlayerStats_Player] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[PlayerStats] CHECK CONSTRAINT [FK_PlayerStats_Player]
GO
ALTER TABLE [dbo].[PlayerStats]  WITH CHECK ADD  CONSTRAINT [FK_PlayerStats_Stats] FOREIGN KEY([StatsId])
REFERENCES [dbo].[Stats] ([Id])
GO
ALTER TABLE [dbo].[PlayerStats] CHECK CONSTRAINT [FK_PlayerStats_Stats]
GO
ALTER TABLE [dbo].[PotionStats]  WITH CHECK ADD  CONSTRAINT [FK_PotionStats_Stats] FOREIGN KEY([StatsId])
REFERENCES [dbo].[Stats] ([Id])
GO
ALTER TABLE [dbo].[PotionStats] CHECK CONSTRAINT [FK_PotionStats_Stats]
GO
ALTER TABLE [dbo].[PowerUpBoost]  WITH CHECK ADD  CONSTRAINT [FK_PowerUpBoost_PowerUps] FOREIGN KEY([PowerUpId])
REFERENCES [dbo].[PowerUps] ([Id])
GO
ALTER TABLE [dbo].[PowerUpBoost] CHECK CONSTRAINT [FK_PowerUpBoost_PowerUps]
GO
ALTER TABLE [dbo].[PowerUpBoost]  WITH CHECK ADD  CONSTRAINT [FK_PowerUpBoost_Stats] FOREIGN KEY([StatsId])
REFERENCES [dbo].[Stats] ([Id])
GO
ALTER TABLE [dbo].[PowerUpBoost] CHECK CONSTRAINT [FK_PowerUpBoost_Stats]
GO
ALTER TABLE [dbo].[TeamUpWith]  WITH CHECK ADD  CONSTRAINT [FK_TeamUpWith_Client] FOREIGN KEY([PlayerJoin])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[TeamUpWith] CHECK CONSTRAINT [FK_TeamUpWith_Client]
GO
ALTER TABLE [dbo].[TeamUpWith]  WITH CHECK ADD  CONSTRAINT [FK_TeamUpWith_Host] FOREIGN KEY([PlayerHost])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[TeamUpWith] CHECK CONSTRAINT [FK_TeamUpWith_Host]
GO
ALTER TABLE [dbo].[WaveEnemies]  WITH CHECK ADD  CONSTRAINT [FK_WaveEnemies_Enemy] FOREIGN KEY([EnemyId])
REFERENCES [dbo].[Enemy] ([Id])
GO
ALTER TABLE [dbo].[WaveEnemies] CHECK CONSTRAINT [FK_WaveEnemies_Enemy]
GO
ALTER TABLE [dbo].[WaveEnemies]  WITH CHECK ADD  CONSTRAINT [FK_WaveEnemies_Wave] FOREIGN KEY([WaveId])
REFERENCES [dbo].[Wave] ([Id])
GO
ALTER TABLE [dbo].[WaveEnemies] CHECK CONSTRAINT [FK_WaveEnemies_Wave]
GO
ALTER TABLE [dbo].[WavePowerUps]  WITH CHECK ADD  CONSTRAINT [FK_WavePowerUps_PowerUps] FOREIGN KEY([PowerUpId])
REFERENCES [dbo].[PowerUps] ([Id])
GO
ALTER TABLE [dbo].[WavePowerUps] CHECK CONSTRAINT [FK_WavePowerUps_PowerUps]
GO
ALTER TABLE [dbo].[WavePowerUps]  WITH CHECK ADD  CONSTRAINT [FK_WavePowerUps_Wave] FOREIGN KEY([WaveId])
REFERENCES [dbo].[Wave] ([Id])
GO
ALTER TABLE [dbo].[WavePowerUps] CHECK CONSTRAINT [FK_WavePowerUps_Wave]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [CK_Elementalist] CHECK  ((NOT [Name]='Elementalist' OR NOT ([ElemDamage]+[ElemReduction])=(1)))
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [CK_Elementalist]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [CK_Warrior] CHECK  ((NOT [Name]='Warrior' OR NOT ([PhysDamage]+[PhysReduction])=(1)))
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [CK_Warrior]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [CK_Armour] CHECK  (([Type]<>(2) OR NOT ([PhysReduction]+[ElemReduction])<(1)))
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [CK_Armour]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [CK_Potion] CHECK  (([Type]<>(3) OR NOT ([PhysDamage]+[ElemDamage])=(0) AND [AttackSpeed]=(0) AND ([PhysReduction]+[ElemReduction])=(0)))
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [CK_Potion]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [CK_Weapon] CHECK  (([Type]<>(1) OR NOT ([PhysDamage]+[ElemDamage])<(1) AND [AttackSpeed]>(0.4)))
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [CK_Weapon]
GO
USE [master]
GO
ALTER DATABASE [Mamalian] SET  READ_WRITE 
GO
