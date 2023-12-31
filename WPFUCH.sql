USE [SpecialForWPFSaf]
GO
/****** Object:  Table [dbo].[AboutStudent]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditorium]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exasm]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Extent]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job_title]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rank]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolTitle]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 21.11.2023 13:08:47 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
