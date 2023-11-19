USE [SpecialForWPFSaf]
GO
/****** Object:  Table [dbo].[AboutStudent]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutStudent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_school] [int] NULL,
	[Average_Mark] [float] NULL,
 CONSTRAINT [PK_AboutStudent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditorium]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditorium](
	[ID] [int] NOT NULL,
	[Audit_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Auditorium] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [nvarchar](10) NULL,
	[Dep_Name] [nvarchar](100) NULL,
	[ID_fac] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Volume] [int] NULL,
	[ID_dep] [int] NULL,
	[DiscEnable] [bit] NULL,
	[DiscName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_dep] [int] NULL,
	[SFP] [nvarchar](100) NULL,
	[ID_jt] [int] NULL,
	[Salary] [int] NULL,
	[Chef] [int] NULL,
	[Experience] [int] NULL,
	[ID_rank] [int] NULL,
	[ID_extent] [int] NULL,
	[EmplEnable] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exasm]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exasm](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date_ex] [date] NULL,
	[ID_dis] [int] NULL,
	[ID_stud] [int] NULL,
	[ID_empl] [int] NULL,
	[ID_audit] [int] NULL,
	[Mark] [int] NULL,
	[ExamEnable] [bit] NULL,
 CONSTRAINT [PK_Exasm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Extent]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Extent](
	[ID] [int] NOT NULL,
	[Extent_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Extent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [nvarchar](50) NULL,
	[Name_Fac] [nvarchar](100) NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job_title]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_title](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name_jod_title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Job_title] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rank]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rank](
	[ID] [int] NOT NULL,
	[Rank_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rank] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_dis] [int] NULL,
	[ID_spec] [int] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolNumber] [int] NULL,
	[ID_scholl_title] [int] NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolTitle]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolTitle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_SchoolTitle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name_spec] [nvarchar](200) NULL,
	[ID_dep] [int] NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 19.11.2023 21:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_spec] [int] NULL,
	[FIO] [nvarchar](100) NULL,
	[StudEnable] [bit] NULL,
	[ID_info] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AboutStudent] ON 

INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (10101, 661, 3.5)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (10102, 662, 4.1)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (10103, 663, 5)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (20101, 664, 4.95)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (20102, 665, 3.3)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (30101, 661, 4.4)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (30102, 662, 5)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (30103, 663, 4.78)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (50101, 664, 3.9)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (50102, 665, 4)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (80101, 661, 5)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (80102, 662, 4.6)
INSERT [dbo].[AboutStudent] ([ID], [ID_school], [Average_Mark]) VALUES (80119, 665, 3)
SET IDENTITY_INSERT [dbo].[AboutStudent] OFF
GO
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (1, N'т505')
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (2, N'т506')
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (3, N'ф419')
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (4, N'м425 ')
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (5, N'м424 ')
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (6, N'ф333 ')
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (7, N'ф349 ')
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (8, N'э105 ')
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (9, N'с324 ')
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (10, N'ф417 ')
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (11, N'ф201 ')
INSERT [dbo].[Auditorium] ([ID], [Audit_name]) VALUES (12, N'ф414')
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (10, N'вм', N'Высшая математика', 1)
INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (20, N'ис', N'Информационные системы', 3)
INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (30, N'мм', N'Математическое моделирование', 4)
INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (40, N'оф', N'Общая физика', 1)
INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (50, N'пи', N'Прикладная информатика', 3)
INSERT [dbo].[Department] ([ID], [Abbreviation], [Dep_Name], [ID_fac]) VALUES (60, N'эф', N'Экспериментальная физика', 4)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Discipline] ON 

INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep], [DiscEnable], [DiscName]) VALUES (101, 320, 10, 1, N'Математика')
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep], [DiscEnable], [DiscName]) VALUES (102, 160, 50, 1, N'Информатика')
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep], [DiscEnable], [DiscName]) VALUES (103, 160, 40, 1, N'Физика')
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep], [DiscEnable], [DiscName]) VALUES (202, 120, 20, 1, N'Базы данных')
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep], [DiscEnable], [DiscName]) VALUES (204, 160, 60, 1, N'Электроника')
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep], [DiscEnable], [DiscName]) VALUES (205, 80, 50, 1, N'Программирование')
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep], [DiscEnable], [DiscName]) VALUES (209, 80, 30, 1, N'Моделирование')
INSERT [dbo].[Discipline] ([ID], [Volume], [ID_dep], [DiscEnable], [DiscName]) VALUES (210, 50, 60, 0, N'Политология')
SET IDENTITY_INSERT [dbo].[Discipline] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (101, 50, N'Прохоров П.П.', 1101, 35000, NULL, 15, 991, 654, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (102, 50, N'Семенов С.С.', 1102, 25000, 101, NULL, 992, 652, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (105, 50, N'Петров П.П.', 1102, 25000, 101, NULL, 992, 653, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (153, 50, N'Сидорова С.С.', 1103, 15000, 102, NULL, 993, 654, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (201, 20, N'Андреев А.А.', 1101, 35000, NULL, 18, 991, 655, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (202, 20, N'Борисов Б.Б.', 1102, 25000, 201, NULL, 992, 652, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (241, 20, N'Глухов Г.Г.', 1103, 20000, 201, NULL, 993, 654, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (242, 20, N'Чернов Ч.Ч.', 1103, 15000, 202, NULL, 993, 654, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (301, 30, N'Басов Б.Б.', 1101, 35000, NULL, 20, 991, 654, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (302, 30, N'Сергеева С.С.', 1102, 25000, 301, NULL, 992, 653, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (401, 40, N'Волков В.В.', 1101, 35000, NULL, 10, 991, 654, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (402, 40, N'Зайцев З.З.', 1102, 25000, 401, NULL, 992, 653, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (403, 40, N'Смирнов С.С.', 1102, 15000, 401, NULL, 994, 654, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (435, 40, N'Лисин Л.Л.', 1103, 40000, 402, NULL, 993, 654, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (501, 10, N'Кузнецов К.К.', 1101, 35000, NULL, 18, 991, 655, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (502, 10, N'Романцев Р.Р.', 1102, 25000, 501, NULL, 991, 655, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (503, 10, N'Соловьев С.С.', 1102, 25000, 501, NULL, 992, 652, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (601, 60, N'Зверев З.З.', 1101, 35000, NULL, 8, 991, 655, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (602, 60, N'Сорокина С.С.', 1102, 25000, 601, NULL, 993, 654, 1)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (614, 60, N'Григорьев Г.Г.', 1103, 20000, 602, NULL, 993, 654, 0)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (615, NULL, N'Бзык А.Р', 1102, 50009, NULL, 12, 994, 653, 0)
INSERT [dbo].[Employee] ([ID], [ID_dep], [SFP], [ID_jt], [Salary], [Chef], [Experience], [ID_rank], [ID_extent], [EmplEnable]) VALUES (616, 20, N'Элдей ', 1102, 123458, NULL, 6, 993, 653, 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Exasm] ON 

INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (725, CAST(N'2015-06-05' AS Date), 102, 10101, 102, NULL, 4, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (726, CAST(N'2015-06-05' AS Date), 102, 10102, 102, NULL, 4, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (727, CAST(N'2015-06-05' AS Date), 202, 20101, 202, NULL, 4, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (728, CAST(N'2015-06-05' AS Date), 202, 20102, 202, NULL, 3, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (729, CAST(N'2015-06-07' AS Date), 102, 30101, 105, NULL, 3, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (730, CAST(N'2015-06-07' AS Date), 102, 30102, 101, NULL, 4, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (731, CAST(N'2015-06-07' AS Date), 102, 80101, 102, NULL, 5, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (732, CAST(N'2015-06-09' AS Date), 205, 80102, 402, NULL, 4, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (733, CAST(N'2015-06-09' AS Date), 209, 20101, 302, NULL, 3, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (734, CAST(N'2015-06-10' AS Date), 101, 10101, 501, NULL, 4, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (735, CAST(N'2015-06-10' AS Date), 101, 10102, 501, NULL, 4, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (736, CAST(N'2015-06-10' AS Date), 204, 30102, 601, NULL, 5, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (737, CAST(N'2015-06-10' AS Date), 209, 80101, 301, NULL, 5, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (738, CAST(N'2015-06-10' AS Date), 209, 80102, 301, NULL, 4, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (739, CAST(N'2015-06-12' AS Date), 101, 80101, 502, NULL, 4, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (740, CAST(N'2015-06-15' AS Date), 101, 30101, 503, NULL, 4, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (741, CAST(N'2015-06-15' AS Date), 101, 50101, 501, NULL, 5, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (742, CAST(N'2015-06-15' AS Date), 101, 50102, 501, NULL, 3, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (743, CAST(N'2015-06-15' AS Date), 103, 10101, 403, NULL, 4, 1)
INSERT [dbo].[Exasm] ([ID], [Date_ex], [ID_dis], [ID_stud], [ID_empl], [ID_audit], [Mark], [ExamEnable]) VALUES (744, CAST(N'2015-06-17' AS Date), 102, 10101, 102, NULL, 5, 1)
SET IDENTITY_INSERT [dbo].[Exasm] OFF
GO
INSERT [dbo].[Extent] ([ID], [Extent_name]) VALUES (651, N'д. т.н.')
INSERT [dbo].[Extent] ([ID], [Extent_name]) VALUES (652, N'к. ф.-м. н.')
INSERT [dbo].[Extent] ([ID], [Extent_name]) VALUES (653, N'к. т.н.')
INSERT [dbo].[Extent] ([ID], [Extent_name]) VALUES (654, N'Нет степени')
INSERT [dbo].[Extent] ([ID], [Extent_name]) VALUES (655, N'д. ф.-м. н.')
GO
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([ID], [Abbreviation], [Name_Fac]) VALUES (1, N'Ен', N'Естественные науки')
INSERT [dbo].[Faculty] ([ID], [Abbreviation], [Name_Fac]) VALUES (2, N'Гн', N'Гуманитарные науки')
INSERT [dbo].[Faculty] ([ID], [Abbreviation], [Name_Fac]) VALUES (3, N'Ит', N'Информационные технологии')
INSERT [dbo].[Faculty] ([ID], [Abbreviation], [Name_Fac]) VALUES (4, N'Фм', N'Физико-математический')
SET IDENTITY_INSERT [dbo].[Faculty] OFF
GO
SET IDENTITY_INSERT [dbo].[Job_title] ON 

INSERT [dbo].[Job_title] ([ID], [Name_jod_title]) VALUES (1101, N'зав. кафедрой')
INSERT [dbo].[Job_title] ([ID], [Name_jod_title]) VALUES (1102, N'преподаватель')
INSERT [dbo].[Job_title] ([ID], [Name_jod_title]) VALUES (1103, N'инженер')
SET IDENTITY_INSERT [dbo].[Job_title] OFF
GO
INSERT [dbo].[Rank] ([ID], [Rank_name]) VALUES (991, N'профессор')
INSERT [dbo].[Rank] ([ID], [Rank_name]) VALUES (992, N'доцент')
INSERT [dbo].[Rank] ([ID], [Rank_name]) VALUES (993, N'Нет звания')
INSERT [dbo].[Rank] ([ID], [Rank_name]) VALUES (994, N'ассистент')
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

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
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[School] ON 

INSERT [dbo].[School] ([ID], [SchoolNumber], [ID_scholl_title]) VALUES (661, 52, 553)
INSERT [dbo].[School] ([ID], [SchoolNumber], [ID_scholl_title]) VALUES (662, 18, 552)
INSERT [dbo].[School] ([ID], [SchoolNumber], [ID_scholl_title]) VALUES (663, 10, 551)
INSERT [dbo].[School] ([ID], [SchoolNumber], [ID_scholl_title]) VALUES (664, 89, 551)
INSERT [dbo].[School] ([ID], [SchoolNumber], [ID_scholl_title]) VALUES (665, 78, 552)
INSERT [dbo].[School] ([ID], [SchoolNumber], [ID_scholl_title]) VALUES (684, 123, 553)
SET IDENTITY_INSERT [dbo].[School] OFF
GO
SET IDENTITY_INSERT [dbo].[SchoolTitle] ON 

INSERT [dbo].[SchoolTitle] ([ID], [Title_name]) VALUES (551, N'школа')
INSERT [dbo].[SchoolTitle] ([ID], [Title_name]) VALUES (552, N'лицей')
INSERT [dbo].[SchoolTitle] ([ID], [Title_name]) VALUES (553, N'гимнация')
SET IDENTITY_INSERT [dbo].[SchoolTitle] OFF
GO
SET IDENTITY_INSERT [dbo].[Speciality] ON 

INSERT [dbo].[Speciality] ([ID], [Name_spec], [ID_dep]) VALUES (101, N'Прикладная математика', 30)
INSERT [dbo].[Speciality] ([ID], [Name_spec], [ID_dep]) VALUES (102, N'Информационные системы и технологии', 20)
INSERT [dbo].[Speciality] ([ID], [Name_spec], [ID_dep]) VALUES (103, N'Прикладная информатика', 50)
INSERT [dbo].[Speciality] ([ID], [Name_spec], [ID_dep]) VALUES (104, N'Ядерные физика и технологии', 60)
INSERT [dbo].[Speciality] ([ID], [Name_spec], [ID_dep]) VALUES (105, N'Бизнес-информатика', 20)
SET IDENTITY_INSERT [dbo].[Speciality] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (10101, 103, N'Николаева Н. Н.', 1, 10101)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (10102, 103, N'Яковлев Я. Я.', 0, 10102)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (10103, 103, N'Крюков К. К.', 1, 10103)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (20101, 102, N'Андреев А. А.', 0, 20101)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (20102, 102, N'Федоров Ф. Ф.', 0, 20102)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (30101, 104, N'Бондаренко Б. Б.', 1, 30101)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (30102, 104, N'Цветков К. К.', 1, 30102)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (30103, 104, N'Петров П. П.', 1, 30103)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (50101, 101, N'Сергеев С. С.', 1, 50101)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (50102, 101, N'Кудрявцев К. К.', 1, 50102)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (80101, 105, N'Макаров М. М.', 1, 80101)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (80102, 105, N'Яковлев Я. Я.', 1, 80102)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (80127, 103, N'fdg', 0, 80102)
INSERT [dbo].[Student] ([ID], [ID_spec], [FIO], [StudEnable], [ID_info]) VALUES (80128, 102, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
ALTER TABLE [dbo].[Discipline] ADD  CONSTRAINT [DF_Discipline_DiscEnable]  DEFAULT ((1)) FOR [DiscEnable]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_EmplEnable]  DEFAULT ((1)) FOR [EmplEnable]
GO
ALTER TABLE [dbo].[Exasm] ADD  CONSTRAINT [DF_Exasm_ExamEnable]  DEFAULT ((1)) FOR [ExamEnable]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_StudEnable]  DEFAULT ((1)) FOR [StudEnable]
GO
ALTER TABLE [dbo].[AboutStudent]  WITH CHECK ADD  CONSTRAINT [FK_AboutStudent_School] FOREIGN KEY([ID_school])
REFERENCES [dbo].[School] ([ID])
GO
ALTER TABLE [dbo].[AboutStudent] CHECK CONSTRAINT [FK_AboutStudent_School]
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
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([ID_dep])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Extent] FOREIGN KEY([ID_extent])
REFERENCES [dbo].[Extent] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Extent]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Job_title] FOREIGN KEY([ID_jt])
REFERENCES [dbo].[Job_title] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Job_title]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Rank] FOREIGN KEY([ID_rank])
REFERENCES [dbo].[Rank] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Rank]
GO
ALTER TABLE [dbo].[Exasm]  WITH CHECK ADD  CONSTRAINT [FK_Exasm_Auditorium] FOREIGN KEY([ID_audit])
REFERENCES [dbo].[Auditorium] ([ID])
GO
ALTER TABLE [dbo].[Exasm] CHECK CONSTRAINT [FK_Exasm_Auditorium]
GO
ALTER TABLE [dbo].[Exasm]  WITH CHECK ADD  CONSTRAINT [FK_Exasm_Discipline] FOREIGN KEY([ID_dis])
REFERENCES [dbo].[Discipline] ([ID])
GO
ALTER TABLE [dbo].[Exasm] CHECK CONSTRAINT [FK_Exasm_Discipline]
GO
ALTER TABLE [dbo].[Exasm]  WITH CHECK ADD  CONSTRAINT [FK_Exasm_Employee] FOREIGN KEY([ID_empl])
REFERENCES [dbo].[Employee] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exasm] CHECK CONSTRAINT [FK_Exasm_Employee]
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
ALTER TABLE [dbo].[School]  WITH CHECK ADD  CONSTRAINT [FK_School_SchoolTitle] FOREIGN KEY([ID_scholl_title])
REFERENCES [dbo].[SchoolTitle] ([ID])
GO
ALTER TABLE [dbo].[School] CHECK CONSTRAINT [FK_School_SchoolTitle]
GO
ALTER TABLE [dbo].[Speciality]  WITH CHECK ADD  CONSTRAINT [FK_Speciality_Department] FOREIGN KEY([ID_dep])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Speciality] CHECK CONSTRAINT [FK_Speciality_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_AboutStudent] FOREIGN KEY([ID_info])
REFERENCES [dbo].[AboutStudent] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_AboutStudent]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Speciality] FOREIGN KEY([ID_spec])
REFERENCES [dbo].[Speciality] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Speciality]
GO
