﻿USE [Hellraid_Saf]
GO
/****** Object:  UserDefinedFunction [dbo].[GCD]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GCD] (@a INT, @b INT)  
RETURNS INT  
AS  
BEGIN  
    RETURN  
        CASE   
            WHEN @b = 0 THEN @a  
            ELSE dbo.GCD(@b, @a % @b)  
        END  
END; 
GO
/****** Object:  UserDefinedFunction [dbo].[Hanuwu_MHe_CTpaHy]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Hanuwu_MHe_CTpaHy] (@capital nvarchar(max))
RETURNS nvarchar(max) AS
BEGIN
	DECLARE @name nvarchar(max)	
	SELECT @name = Name FROM Countries
	where Capital = @capital
	RETURN @name
END
GO
/****** Object:  UserDefinedFunction [dbo].[Haudu_CTPAHY]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Haudu_CTPAHY] ()
RETURNS nvarchar(max) AS
BEGIN
	DECLARE @p nvarchar(max), @m1 float, @m2 float, @m3 float

	SELECT @m1 = MAX(Population)  FROM Countries
	SELECT @m2 = MAX(Population)  FROM Countries
	where Population < @m1	
	SELECT @m3 = MAX(Population)  FROM Countries
	where Population < @m2

	SELECT @P = Name FROM Countries
	where Population = @m3

	RETURN @P
END
GO
/****** Object:  UserDefinedFunction [dbo].[Haudu_MAKC_HACEJlEHUE]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Haudu_MAKC_HACEJlEHUE] (@continent nvarchar(max))
RETURNS nvarchar(max) AS
BEGIN
	DECLARE @country nvarchar(max), @maxpop float

	IF @continent IS NULL
		SET @continent = 'Азия'

	SELECT @maxpop = MAX(Population) FROM Countries c
	WHERE  c.Сontinent = @continent 
	
	SELECT @country = Name FROM Countries
	WHERE Population = @maxpop

	RETURN @country
END
GO
/****** Object:  UserDefinedFunction [dbo].[Haudu_nJlOTHOCTb]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Haudu_nJlOTHOCTb] (@continent nvarchar(max))
RETURNS float AS
BEGIN
	DECLARE @Plotnost float

	SELECT @Plotnost = ROUND(cast(Population as float)/Area, 3) FROM Countries c
	where Сontinent = @continent
	
	RETURN @Plotnost
END
GO
/****** Object:  UserDefinedFunction [dbo].[IsPalindrom]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IsPalindrom](@FIRST INT)
RETURNS INT AS
BEGIN
    DECLARE @ReversedStr NVARCHAR(100) , @SECOND int, @otvet int
	SET @SECOND = @FIRST
    SET @ReversedStr = REVERSE(CAST(@FIRST AS NVARCHAR(100)));

    IF @ReversedStr = CAST(@SECOND AS NVARCHAR(100))
        SET @otvet = 1
    ELSE
        SET @otvet = 0
	RETURN @otvet
END
GO
/****** Object:  UserDefinedFunction [dbo].[IsPrime]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IsPrime](@N INT)
RETURNS INT AS
BEGIN
    DECLARE @IsPrime INT = 1

    IF @N <= 1
        SET @IsPrime = 0
    ELSE
		BEGIN
		    DECLARE @i INT = 2;

		    WHILE @i * @i <= @N
				BEGIN
				    IF @N % @i = 0
						BEGIN
						    SET @IsPrime = 0
						    BREAK;
						END
				    SET @i = @i + 1
				END
		END

    RETURN @IsPrime
END
GO
/****** Object:  UserDefinedFunction [dbo].[KOJlBO_CTPAH]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[KOJlBO_CTPAH] (@t char(1))
RETURNS INT AS
BEGIN
	DECLARE @K int

	SELECT @K = COUNT(*) FROM Countries
	WHERE CHARINDEX(@t, Name) = 0

	RETURN @K
END
GO
/****** Object:  UserDefinedFunction [dbo].[MyQuarter]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MyQuarter](@x FLOAT, @y FLOAT)
RETURNS INT AS
BEGIN
    DECLARE @Quadrant INT;

    IF @x > 0 AND @y > 0
        SET @Quadrant = 1
    ELSE IF @x < 0 AND @y > 0
        SET @Quadrant = 2
    ELSE IF @x < 0 AND @y < 0
        SET @Quadrant = 3
    ELSE IF @x > 0 AND @y < 0
        SET @Quadrant = 4
    ELSE
        SET @Quadrant = 0

    RETURN @Quadrant
END
GO
/****** Object:  UserDefinedFunction [dbo].[nepeBedu_MHe_B_MuJlJluoHbl]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[nepeBedu_MHe_B_MuJlJluoHbl] (@population float)
RETURNS nvarchar(max) AS
BEGIN
	DECLARE @p float	
	set @p = (@population / 1000000)
	RETURN CAST(@p as nvarchar(max)) + ' млн.'
END
GO
/****** Object:  UserDefinedFunction [dbo].[Zamena]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Zamena] (@text nvarchar(max))
RETURNS nvarchar(max) AS
BEGIN
	RETURN LEFT(@text, 2) + REPLICATE('тест',LEN(@text) - 2) + RIGHT(@text, 1)
END
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Capital] [nvarchar](150) NULL,
	[Area] [int] NULL,
	[Population] [int] NULL,
	[Сontinent] [nvarchar](150) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[nJlowadb_CTRAHbl]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[nJlowadb_CTRAHbl] (@n int)
RETURNS TABLE AS RETURN
(
	SELECT * FROM dbo.Countries c
	WHERE Area < @n
)
GO
/****** Object:  UserDefinedFunction [dbo].[HACJleHUE_CTRAHbl]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[HACJleHUE_CTRAHbl] (@n1 int, @n2 int)
RETURNS TABLE AS RETURN
(
	SELECT * FROM dbo.Countries c
	WHERE Population >= @n1 and Population <= @n2
)
GO
/****** Object:  UserDefinedFunction [dbo].[HACJleHUE_KOHTUHEHTA]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[HACJleHUE_KOHTUHEHTA] ()
RETURNS TABLE AS RETURN
(
	SELECT c.Сontinent, SUM(Population) Pop FROM dbo.Countries c
	GROUP BY c.Сontinent
)
GO
/****** Object:  Table [dbo].[Academics]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Academics](
	[ID] [int] NOT NULL,
	[Second_name] [nvarchar](100) NULL,
	[First_name] [nvarchar](100) NULL,
	[Patronymic] [nvarchar](100) NULL,
	[Birthday_date] [date] NULL,
	[ID_specialization] [int] NULL,
	[Year_of_title] [int] NULL,
 CONSTRAINT [PK_Academics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deparment_alfa]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deparment_alfa](
	[ID] [int] NOT NULL,
	[Years_on_work] [int] NULL,
 CONSTRAINT [PK_Deparment_alfa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] NOT NULL,
	[Abbreviation] [nvarchar](10) NULL,
	[Dep_Name] [nvarchar](100) NULL,
	[ID_fac] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[ID] [int] NOT NULL,
	[Volume] [int] NULL,
	[ID_dep] [int] NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employe]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employe](
	[ID] [int] NOT NULL,
	[ID_dep] [int] NULL,
	[FIO] [nvarchar](100) NULL,
	[Job_title] [nvarchar](100) NULL,
	[Salary] [int] NULL,
	[Chef] [int] NULL,
 CONSTRAINT [PK_Employe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engineer]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engineer](
	[ID] [int] NOT NULL,
	[Name_title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Engineer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exasm]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exasm](
	[ID] [int] NOT NULL,
	[Date_ex] [date] NULL,
	[ID_dis] [int] NULL,
	[ID_stud] [int] NULL,
	[ID_empl] [int] NULL,
	[Audit] [nvarchar](100) NULL,
	[Mark] [int] NULL,
 CONSTRAINT [PK_Exasm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[ID] [int] NOT NULL,
	[Abbreviation] [nvarchar](50) NULL,
	[Name_Fac] [nvarchar](100) NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gimnazist]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gimnazist](
	[ID_student] [int] IDENTITY(1,1) NOT NULL,
	[Second_name] [varchar](50) NOT NULL,
	[Stud_Subject] [varchar](50) NOT NULL,
	[School] [varchar](50) NOT NULL,
	[Mark] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LR5_Students]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LR5_Students](
	[ID_student] [int] IDENTITY(1,1) NOT NULL,
	[Second_name] [varchar](50) NOT NULL,
	[Stud_Subject] [varchar](50) NOT NULL,
	[School] [varchar](50) NOT NULL,
	[Mark] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pupils]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pupils](
	[Id] [int] NOT NULL,
	[Surname] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Education] [nvarchar](max) NULL,
	[Pts] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[ID] [int] NOT NULL,
	[ID_dis] [int] NULL,
	[ID_spec] [int] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[ID] [int] NOT NULL,
	[Name_spec] [nvarchar](200) NULL,
	[ID_dep] [int] NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[ID] [int] NOT NULL,
	[Name_specialization] [nvarchar](100) NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] NOT NULL,
	[ID_spec] [int] NULL,
	[FIO] [nvarchar](100) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 13.11.2023 10:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[ID] [int] NOT NULL,
	[teach_Title] [nvarchar](100) NULL,
	[Rank] [nvarchar](50) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (1, N'Аничков', N'Николай', N'Николаевич', CAST(N'1885-11-03' AS Date), 1, 1939)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (2, N'Бартольд', N'Василий', N'Владимирович', CAST(N'1869-11-15' AS Date), 2, 1913)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (3, N'Белопольский', N'Аристарх', N'Аполлонович', CAST(N'1854-07-13' AS Date), 3, 1903)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (4, N'Бородин', N'Иван', N'Парфеньевич', CAST(N'1847-01-30' AS Date), 4, 1902)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (5, N'Вальден', N'Павел', N'Иванович', CAST(N'1863-07-26' AS Date), 5, 1910)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (6, N'Вернадский', N'Владимир', N'Иванович', CAST(N'1863-03-12' AS Date), 6, 1908)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (7, N'Виноградов', N'Павел', N'Гаврилович', CAST(N'1854-11-30' AS Date), 2, 1914)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (8, N'Ипатьев', N'Владимир', N'Николаевич', CAST(N'1867-11-21' AS Date), 7, 1916)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (9, N'Истрин', N'Василий', N'Михайлович', CAST(N'1865-02-22' AS Date), 12, 1907)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (10, N'Карпинский', N'Александр', N'Петрович', CAST(N'1847-01-07' AS Date), 9, 1889)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (11, N'Коковцов', N'Павел', N'Константинович', CAST(N'1861-07-01' AS Date), 2, 1906)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (12, N'Курнаков', N'Николай', N'Семёнович', CAST(N'1860-12-06' AS Date), 7, 1913)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (13, N'Марр', N'Николай', N'Яковлевич', CAST(N'1865-01-06' AS Date), 10, 1912)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (14, N'Насонов', N'Николай', N'Викторович', CAST(N'1855-02-26' AS Date), 11, 1906)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (15, N'Ольденбург', N'Сергей', N'Фёдорович', CAST(N'1863-09-26' AS Date), 2, 1903)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (16, N'Павлов', N'Иван', N'Петрович', CAST(N'1849-09-26' AS Date), 12, 1907)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (17, N'Перетц', N'Владимир', N'Николаевич', CAST(N'1870-01-31' AS Date), 12, 1914)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (18, N'Соболевский', N'Алексей', N'Иванович', CAST(N'1857-01-07' AS Date), 10, 1900)
INSERT [dbo].[Academics] ([ID], [Second_name], [First_name], [Patronymic], [Birthday_date], [ID_specialization], [Year_of_title]) VALUES (19, N'Стеклов', N'Владимир', N'Андреевич', CAST(N'1864-01-09' AS Date), 1, 1912)
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (1, N'Австрия', N'Вена', 83858, 8741753, N'Европа')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (2, N'Азербайджан', N'Баку', 86600, 9705600, N'Азия')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (3, N'Албания', N'Тирана', 28748, 2866026, N'Европа')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (4, N'Алжир', N'Алжир', 2381740, 39813722, N'Африка')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (5, N'Ангола', N'Луанда', 1246700, 25831000, N'Африка')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (6, N'Аргентина', N'Буэнос-Айрес', 2766890, 43847000, N'Южная Америка')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (7, N'Афганистан', N'Кабул', 647500, 29822848, N'Азия')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (8, N'Бангладеш', N'Дакка', 144000, 160221000, N'Азия')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (9, N'Бахрейн', N'Манама', 701, 1397000, N'Азия')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (10, N'Белиз', N'Бельмопан', 22966, 377968, N'Северная Америка')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (11, N'Белоруссия', N'Минск', 207595, 9498400, N'Европа')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (12, N'Бельгия', N'Брюссель', 30528, 11250585, N'Европа')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (13, N'Бенин', N'Порто-Ново', 112620, 11167000, N'Африка')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (14, N'Болгария', N'София', 110910, 7153784, N'Европа')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (15, N'Боливия', N'Сукре', 1098580, 10985059, N'Южная Америка')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (16, N'Ботсвана', N'Габороне', 600370, 2209208, N'Африка')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (17, N'Бразилия', N'Бразилиа', 8511965, 206081432, N'Южная Америка')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (18, N'Буркина-Фасо', N'Уагадугу', 274200, 19034397, N'Африка')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (19, N'Бутан', N'Тхимпху', 47000, 784000, N'Азия')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (20, N'Великобритания', N'Лондон', 244820, 65341183, N'Европа')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (21, N'Венгрия', N'Будапешт', 93030, 9830485, N'Европа')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (22, N'Венесуэла', N'Каракас', 912050, 31028637, N'Южная Америка')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (23, N'Восточный Тимор', N'Дили', 14874, 1167242, N'Азия')
INSERT [dbo].[Countries] ([Id], [Name], [Capital], [Area], [Population], [Сontinent]) VALUES (24, N'Вьетнам', N'Ханой', 329560, 91713300, N'Азия')
INSERT [dbo].[Deparment_alfa] ([ID], [Years_on_work]) VALUES (101, 15)
INSERT [dbo].[Deparment_alfa] ([ID], [Years_on_work]) VALUES (201, 18)
INSERT [dbo].[Deparment_alfa] ([ID], [Years_on_work]) VALUES (301, 20)
INSERT [dbo].[Deparment_alfa] ([ID], [Years_on_work]) VALUES (401, 10)
INSERT [dbo].[Deparment_alfa] ([ID], [Years_on_work]) VALUES (501, 18)
INSERT [dbo].[Deparment_alfa] ([ID], [Years_on_work]) VALUES (601, 8)
INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (10, N'вм', N'Высшая математика', 1)
INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (20, N'ис', N'Информационные системы', 3)
INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (30, N'мм', N'Математическое моделирование', 4)
INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (40, N'оф', N'Общая физика', 1)
INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (50, N'пи', N'Прикладная информатика', 3)
INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (60, N'эф', N'Экспериментальная физика', 4)
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep]) VALUES (101, 320, 10)
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep]) VALUES (102, 160, 50)
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep]) VALUES (103, 160, 40)
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep]) VALUES (202, 120, 20)
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep]) VALUES (204, 160, 60)
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep]) VALUES (205, 80, 50)
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep]) VALUES (209, 80, 30)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (101, 50, N'Прохоров П.П.', N'зав. кафедрой', 35000, 101)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (102, 50, N'Семенов С.С.', N'преподаватель', 25000, 101)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (105, 50, N'Петров П.П.', N'преподаватель', 25000, 101)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (153, 50, N'Сидорова С.С.', N'инженер', 15000, 102)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (201, 20, N'Андреев А.А.', N'зав. кафедрой', 35000, 201)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (202, 20, N'Борисов Б.Б.', N'преподаватель', 25000, 201)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (241, 20, N'Глухов Г.Г.', N'инженер', 20000, 201)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (242, 20, N'Чернов Ч.Ч.', N'инженер', 15000, 202)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (301, 30, N'Басов Б.Б.', N'зав. кафедрой', 35000, 301)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (302, 30, N'Сергеева С.С.', N'преподаватель', 25000, 301)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (401, 40, N'Волков В.В.', N'зав. кафедрой', 35000, 401)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (402, 40, N'Зайцев З.З.', N'преподаватель', 25000, 401)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (403, 40, N'Смирнов С.С.', N'преподаватель', 15000, 401)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (435, 40, N'Лисин Л.Л.', N'инженер', 20000, 402)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (501, 10, N'Кузнецов К.К.', N'зав. кафедрой', 35000, 501)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (502, 10, N'Романцев Р.Р.', N'преподаватель', 25000, 501)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (503, 10, N'Соловьев С.С.', N'преподаватель', 25000, 501)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (601, 60, N'Зверев З.З.', N'зав. кафедрой', 35000, 601)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (602, 60, N'Сорокина С.С.', N'преподаватель', 25000, 601)
INSERT [dbo].[Employe] ([ID], [ID_dep], [FIO], [Job_title], [Salary], [Chef]) VALUES (614, 60, N'Григорьев Г.Г.', N'инженер', 20000, 602)
INSERT [dbo].[Engineer] ([ID], [Name_title]) VALUES (153, N'электроник')
INSERT [dbo].[Engineer] ([ID], [Name_title]) VALUES (241, N'электроник')
INSERT [dbo].[Engineer] ([ID], [Name_title]) VALUES (242, N'программист')
INSERT [dbo].[Engineer] ([ID], [Name_title]) VALUES (435, N'электроник')
INSERT [dbo].[Engineer] ([ID], [Name_title]) VALUES (614, N'программист')
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (701, CAST(N'2015-06-05' AS Date), 102, 10101, 102, N'т505', 4)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (702, CAST(N'2015-06-05' AS Date), 102, 10102, 102, N'т505', 4)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (703, CAST(N'2015-06-05' AS Date), 202, 20101, 202, N'т506', 4)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (704, CAST(N'2015-06-05' AS Date), 202, 20102, 202, N'т506', 3)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (705, CAST(N'2015-06-07' AS Date), 102, 30101, 105, N'ф419', 3)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (706, CAST(N'2015-06-07' AS Date), 102, 30102, 101, N'т506', 4)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (707, CAST(N'2015-06-07' AS Date), 102, 80101, 102, N'м425', 5)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (708, CAST(N'2015-06-09' AS Date), 205, 80102, 402, N'м424', 4)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (709, CAST(N'2015-06-09' AS Date), 209, 20101, 302, N'ф333', 3)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (710, CAST(N'2015-06-10' AS Date), 101, 10101, 501, N'т506', 4)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (711, CAST(N'2015-06-10' AS Date), 101, 10102, 501, N'т506', 4)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (712, CAST(N'2015-06-10' AS Date), 204, 30102, 601, N'ф349', 5)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (713, CAST(N'2015-06-10' AS Date), 209, 80101, 301, N'э105', 5)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (714, CAST(N'2015-06-10' AS Date), 209, 80102, 301, N'э105', 4)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (715, CAST(N'2015-06-12' AS Date), 101, 80101, 502, N'с324', 4)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (716, CAST(N'2015-06-15' AS Date), 101, 30101, 503, N'ф417', 4)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (717, CAST(N'2015-06-15' AS Date), 101, 50101, 501, N'ф201', 5)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (718, CAST(N'2015-06-15' AS Date), 101, 50102, 501, N'ф201', 3)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (719, CAST(N'2015-06-15' AS Date), 103, 10101, 403, N'ф414', 4)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [Audit], [Mark]) VALUES (720, CAST(N'2015-06-17' AS Date), 102, 10101, 102, N'т505', 5)
INSERT [dbo].[Faculty] ([ID], [Abbreviation], [Name_Fac]) VALUES (1, N'Ен', N'Естественные науки')
INSERT [dbo].[Faculty] ([ID], [Abbreviation], [Name_Fac]) VALUES (2, N'Гн', N'Гуманитарные науки')
INSERT [dbo].[Faculty] ([ID], [Abbreviation], [Name_Fac]) VALUES (3, N'Ит', N'Информационные технологии')
INSERT [dbo].[Faculty] ([ID], [Abbreviation], [Name_Fac]) VALUES (4, N'Фм', N'Физико-математический')
SET IDENTITY_INSERT [dbo].[Gimnazist] ON 

INSERT [dbo].[Gimnazist] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (5, N'Халоконтов', N'Математический анализ', N'Школа №181', 99)
SET IDENTITY_INSERT [dbo].[Gimnazist] OFF
SET IDENTITY_INSERT [dbo].[LR5_Students] ON 

INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (1, N'Трошкова', N'Математика', N'Школа №21', 56)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (2, N'Трошкова', N'Математика', N'Школа №21', 56)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (3, N'Анонимусов', N'Химия', N'Школа №18', NULL)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (4, N'Симгмачев', N'Физ-ра', N'Школа №118', 40)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (5, N'Халоконтов', N'Математический анализ', N'Школа №181', 99)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (6, N'Иванова', N'Математика', N'Лицей', 98.5)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (8, N'Петров', N'Физика', N'Лицей', 99)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (10, N'Сидоров', N'Математика', N'Лицей', 88)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (12, N'Полухина', N'Физика', N'Гимназия', 78)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (14, N'Матвеева', N'Химия', N'Лицей', 92)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (16, N'Касимов', N'Химия', N'Гимназия', 68)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (18, N'Нурулин', N'Математика', N'Гимназия', 81)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (20, N'Авдеев', N'Физика', N'Лицей', 87)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (22, N'Никитина', N'Химия', N'Лицей', 94)
INSERT [dbo].[LR5_Students] ([ID_student], [Second_name], [Stud_Subject], [School], [Mark]) VALUES (24, N'Барышева', N'Химия', N'Лицей', 8)
SET IDENTITY_INSERT [dbo].[LR5_Students] OFF
INSERT [dbo].[Pupils] ([Id], [Surname], [Subject], [Education], [Pts]) VALUES (1, N'Иванова', N'Математика', N'Лицей', 98.5)
INSERT [dbo].[Pupils] ([Id], [Surname], [Subject], [Education], [Pts]) VALUES (2, N'Петров', N'Физика', N'Лицей', 99)
INSERT [dbo].[Pupils] ([Id], [Surname], [Subject], [Education], [Pts]) VALUES (3, N'Сидоров', N'Математика', N'Лицей', 88)
INSERT [dbo].[Pupils] ([Id], [Surname], [Subject], [Education], [Pts]) VALUES (4, N'Полухина', N'Физика', N'Гимназия', 78)
INSERT [dbo].[Pupils] ([Id], [Surname], [Subject], [Education], [Pts]) VALUES (5, N'Матвеева', N'Химия', N'Лицей', 92)
INSERT [dbo].[Pupils] ([Id], [Surname], [Subject], [Education], [Pts]) VALUES (6, N'Касимов', N'Химия', N'Гимназия', 68)
INSERT [dbo].[Pupils] ([Id], [Surname], [Subject], [Education], [Pts]) VALUES (7, N'Нурулин', N'Математика', N'Гимназия', 81)
INSERT [dbo].[Pupils] ([Id], [Surname], [Subject], [Education], [Pts]) VALUES (8, N'Авдеев', N'Физика', N'Лицей', 87)
INSERT [dbo].[Pupils] ([Id], [Surname], [Subject], [Education], [Pts]) VALUES (9, N'Никитина', N'Химия', N'Лицей', 94)
INSERT [dbo].[Pupils] ([Id], [Surname], [Subject], [Education], [Pts]) VALUES (10, N'Барышева', N'Химия', N'Лицей', 88)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (901, 101, 101)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (902, 205, 101)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (903, 209, 101)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (904, 101, 102)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (905, 102, 102)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (906, 103, 102)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (907, 202, 102)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (908, 205, 102)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (909, 209, 102)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (910, 101, 103)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (911, 102, 103)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (912, 103, 103)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (913, 202, 103)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (914, 205, 103)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (915, 101, 104)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (916, 102, 104)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (917, 103, 104)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (918, 204, 104)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (919, 101, 105)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (920, 103, 105)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (921, 202, 105)
INSERT [dbo].[Request] ([ID], [ID_dis], [ID_spec]) VALUES (922, 209, 105)
INSERT [dbo].[Speciality] ([ID], [Name_spec], [ID_dep]) VALUES (101, N'Прикладная математика', 30)
INSERT [dbo].[Speciality] ([ID], [Name_spec], [ID_dep]) VALUES (102, N'Информационные системы и технологии', 20)
INSERT [dbo].[Speciality] ([ID], [Name_spec], [ID_dep]) VALUES (103, N'Прикладная информатика', 50)
INSERT [dbo].[Speciality] ([ID], [Name_spec], [ID_dep]) VALUES (104, N'Ядерные физика и технологии', 60)
INSERT [dbo].[Speciality] ([ID], [Name_spec], [ID_dep]) VALUES (105, N'Бизнес-информатика', 20)
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (1, N'медицина')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (2, N'историк')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (3, N'астрофизик')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (4, N'ботаник')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (5, N'химик-технолог')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (6, N'геохимик')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (7, N'химик')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (8, N'филолог')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (9, N'геолог')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (10, N'лингвист')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (11, N'зоолог')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (12, N'физиолог')
INSERT [dbo].[Specialization] ([ID], [Name_specialization]) VALUES (13, N'математик')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (10101, 103, N'Николаева Н. Н.')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (10102, 103, N'Иванов И. И.')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (10103, 103, N'Крюков К. К.')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (20101, 102, N'Андреев А. А.')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (20102, 102, N'Федоров Ф. Ф.')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (30101, 104, N'Бондаренко Б. Б.')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (30102, 104, N'Цветков К. К.')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (30103, 104, N'Петров П. П.')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (50101, 101, N'Сергеев С. С.')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (50102, 101, N'Кудрявцев К. К.')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (80101, 105, N'Макаров М. М.')
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO]) VALUES (80102, 105, N'Яковлев Я. Я.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (101, N'профессор', N'д. т.н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (102, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (105, N'доцент', N'к. т.н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (201, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (202, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (301, N'профессор', N'д. т.н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (302, N'доцент', N'к. т.н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (401, N'профессор', N'д. т.н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (402, N'доцент', N'к. т.н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (403, N'ассистент', NULL)
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (501, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (502, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (503, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Teacher] ([ID], [teach_Title], [Rank]) VALUES (601, N'профессор', N'д. ф.-м. н.')
ALTER TABLE [dbo].[Academics]  WITH CHECK ADD  CONSTRAINT [FK_Academics_Specialization] FOREIGN KEY([ID_specialization])
REFERENCES [dbo].[Specialization] ([ID])
GO
ALTER TABLE [dbo].[Academics] CHECK CONSTRAINT [FK_Academics_Specialization]
GO
ALTER TABLE [dbo].[Deparment_alfa]  WITH CHECK ADD  CONSTRAINT [FK_Deparment_alfa_Employe] FOREIGN KEY([ID])
REFERENCES [dbo].[Employe] ([ID])
GO
ALTER TABLE [dbo].[Deparment_alfa] CHECK CONSTRAINT [FK_Deparment_alfa_Employe]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Faculty] FOREIGN KEY([ID_fac])
REFERENCES [dbo].[Faculty] ([ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Faculty]
GO
ALTER TABLE [dbo].[Discipline]  WITH CHECK ADD  CONSTRAINT [FK_Discipline_Department] FOREIGN KEY([ID_dep])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Discipline] CHECK CONSTRAINT [FK_Discipline_Department]
GO
ALTER TABLE [dbo].[Employe]  WITH CHECK ADD  CONSTRAINT [FK_Employe_Department] FOREIGN KEY([ID_dep])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Employe] CHECK CONSTRAINT [FK_Employe_Department]
GO
ALTER TABLE [dbo].[Engineer]  WITH CHECK ADD  CONSTRAINT [FK_Engineer_Employe] FOREIGN KEY([ID])
REFERENCES [dbo].[Employe] ([ID])
GO
ALTER TABLE [dbo].[Engineer] CHECK CONSTRAINT [FK_Engineer_Employe]
GO
ALTER TABLE [dbo].[Exasm]  WITH CHECK ADD  CONSTRAINT [FK_Exasm_Discipline] FOREIGN KEY([ID_dis])
REFERENCES [dbo].[Discipline] ([ID])
GO
ALTER TABLE [dbo].[Exasm] CHECK CONSTRAINT [FK_Exasm_Discipline]
GO
ALTER TABLE [dbo].[Exasm]  WITH CHECK ADD  CONSTRAINT [FK_Exasm_Employe] FOREIGN KEY([ID_empl])
REFERENCES [dbo].[Employe] ([ID])
GO
ALTER TABLE [dbo].[Exasm] CHECK CONSTRAINT [FK_Exasm_Employe]
GO
ALTER TABLE [dbo].[Exasm]  WITH CHECK ADD  CONSTRAINT [FK_Exasm_Student] FOREIGN KEY([ID_stud])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Exasm] CHECK CONSTRAINT [FK_Exasm_Student]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Discipline] FOREIGN KEY([ID_dis])
REFERENCES [dbo].[Discipline] ([ID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Discipline]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Speciality] FOREIGN KEY([ID_spec])
REFERENCES [dbo].[Speciality] ([ID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Speciality]
GO
ALTER TABLE [dbo].[Speciality]  WITH CHECK ADD  CONSTRAINT [FK_Speciality_Department] FOREIGN KEY([ID_dep])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Speciality] CHECK CONSTRAINT [FK_Speciality_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Speciality] FOREIGN KEY([ID_spec])
REFERENCES [dbo].[Speciality] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Speciality]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Employe] FOREIGN KEY([ID])
REFERENCES [dbo].[Employe] ([ID])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Employe]
GO
ALTER TABLE [dbo].[LR5_Students]  WITH CHECK ADD CHECK  (([Mark]>=(0) AND [Mark]<=(100)))
GO
/****** Object:  StoredProcedure [dbo].[SelectColumnsFromTable]    Script Date: 13.11.2023 10:57:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectColumnsFromTable]
    @columnList NVARCHAR(MAX),
    @tableName NVARCHAR(128)    
AS
BEGIN
    DECLARE @sql3 NVARCHAR(MAX);
    SET @sql3 = 'SELECT ' + @columnList + ' FROM ' + @tableName;

    EXEC(@sql3);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectColumnsFromTable2]    Script Date: 13.11.2023 10:57:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectColumnsFromTable2]
    @columnList NVARCHAR(MAX),
    @tableName NVARCHAR(MAX),
	@columnName NVARCHAR(MAX),
	@compareSign NVARCHAR(2),
	@compareValue NVARCHAR(MAX)
AS
BEGIN
    DECLARE @sql4 NVARCHAR(MAX);
    SET @sql4 = 'SELECT ' + @columnList + ' FROM ' + @tableName +
                    ' WHERE ' + @columnName + ' ' + @compareSign + ' ''' + @compareValue + '''';


    EXEC(@sql4);
END
GO