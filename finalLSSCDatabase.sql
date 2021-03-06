USE [master]
GO
/****** Object:  Database [lsscPortal]    Script Date: 2/17/2020 12:14:22 PM ******/
CREATE DATABASE [lsscPortal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lsscPortal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\lsscPortal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'lsscPortal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\lsscPortal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [lsscPortal] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lsscPortal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lsscPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lsscPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lsscPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lsscPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lsscPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [lsscPortal] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [lsscPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lsscPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lsscPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lsscPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lsscPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lsscPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lsscPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lsscPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lsscPortal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [lsscPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lsscPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lsscPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lsscPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lsscPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lsscPortal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lsscPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lsscPortal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [lsscPortal] SET  MULTI_USER 
GO
ALTER DATABASE [lsscPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lsscPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lsscPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lsscPortal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [lsscPortal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [lsscPortal] SET QUERY_STORE = OFF
GO
USE [lsscPortal]
GO
/****** Object:  Table [dbo].[tblAssessmentBatch]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAssessmentBatch](
	[asId] [int] IDENTITY(1,1) NOT NULL,
	[asType] [nvarchar](20) NOT NULL,
	[asPartner] [nvarchar](40) NOT NULL,
	[asState] [nvarchar](30) NOT NULL,
	[asCity] [nvarchar](30) NOT NULL,
	[asQpId] [nvarchar](100) NOT NULL,
	[asQuestionBankID] [nvarchar](12) NOT NULL,
	[asQuestionVersion] [nvarchar](12) NOT NULL,
	[asFacilitator] [nvarchar](30) NOT NULL,
	[asSDMSBatchName] [nvarchar](20) NOT NULL,
	[asCenterId] [nvarchar](20) NOT NULL,
	[asProjectId] [nvarchar](20) NOT NULL,
	[asContactPerson] [nvarchar](40) NULL,
	[asContactPersonPhoneNo] [bigint] NULL,
	[asContactPersonEmailId] [nvarchar](40) NULL,
	[asTrainingStartDate] [date] NOT NULL,
	[asTrainingEndDate] [date] NOT NULL,
	[asAssesmentStartDate] [date] NOT NULL,
	[asAssesmentEndtDate] [date] NOT NULL,
	[asAssessmentStartTime] [time](7) NULL,
	[asAssessmentEndTime] [time](7) NULL,
	[asEnglish] [bit] NULL,
	[asTamil] [bit] NULL,
	[asBangla] [bit] NULL,
	[asHindi] [bit] NULL,
	[asRemarks] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[asId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAssessmentProof]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAssessmentProof](
	[asID] [int] IDENTITY(1,1) NOT NULL,
	[asbatchID] [int] NULL,
	[asCandidateId] [nvarchar](50) NULL,
	[asAssesser] [nvarchar](30) NULL,
	[asPersonalPhoto] [varbinary](max) NULL,
	[asAddharPhoto] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[asID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCandidateList]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCandidateList](
	[clEnrollmentNo] [nvarchar](50) NOT NULL,
	[clName] [nvarchar](50) NOT NULL,
	[clReqNo] [int] NULL,
	[clPracticalDone] [bit] NULL,
	[clTheoryDeone] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[clEnrollmentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCenter]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCenter](
	[centerCode] [nvarchar](20) NOT NULL,
	[centerName] [nvarchar](40) NOT NULL,
	[centerAddress] [nvarchar](100) NULL,
	[centerContactPerson] [nvarchar](30) NULL,
	[centerContactNo] [bigint] NOT NULL,
	[centerEmailID] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[centerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFinalResult]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFinalResult](
	[frID] [int] IDENTITY(1,1) NOT NULL,
	[frbatchID] [int] NULL,
	[frCandidateId] [nvarchar](50) NOT NULL,
	[frTheoryID] [int] NULL,
	[frPracticalID] [int] NULL,
	[frTheoryResult] [int] NULL,
	[frPracticalResult] [int] NULL,
	[frFinalResult] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[frID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNOS]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNOS](
	[nosCode] [nvarchar](50) NOT NULL,
	[nosName] [nvarchar](100) NOT NULL,
	[nosActive] [bit] NOT NULL,
	[nosQpCode] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[nosCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPracticalQuestion]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPracticalQuestion](
	[pqCode] [int] IDENTITY(1,1) NOT NULL,
	[pqNOS] [nvarchar](50) NOT NULL,
	[pqPC] [nvarchar](100) NULL,
	[pqQuestion] [nvarchar](500) NOT NULL,
	[pqType] [nvarchar](30) NOT NULL,
	[pqMarks] [int] NOT NULL,
	[pqVersionOfQB] [nvarchar](12) NULL,
	[pqLang] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[pqCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPracticalResult]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPracticalResult](
	[prID] [int] IDENTITY(1,1) NOT NULL,
	[prbatchID] [int] NULL,
	[prCandidateId] [nvarchar](50) NOT NULL,
	[prQuestionID] [int] NULL,
	[prMarks] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[prID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProject]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProject](
	[projId] [nvarchar](20) NOT NULL,
	[projName] [nvarchar](40) NOT NULL,
	[projDesp] [nvarchar](100) NULL,
	[projManager] [nvarchar](30) NOT NULL,
	[projAssesmentType] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[projId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQP]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQP](
	[qpCode] [nvarchar](100) NOT NULL,
	[qpName] [nvarchar](100) NOT NULL,
	[qpNsqfLevel] [int] NULL,
	[qpSectorName] [nvarchar](20) NULL,
	[qpNoOfNOS] [int] NOT NULL,
	[qpMinEDLevel] [nvarchar](30) NULL,
	[qpMaxEDLevel] [nvarchar](30) NULL,
	[qpActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[qpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestionBank]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestionBank](
	[qbQuestionID] [int] IDENTITY(1,1) NOT NULL,
	[qbQuestionCode]  AS ('QB'+CONVERT([nvarchar](10),[qbQuestionID])) PERSISTED NOT NULL,
	[qbName] [nvarchar](100) NOT NULL,
	[qbRelatedQP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[qbQuestionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestionPaperVersion]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestionPaperVersion](
	[qvVersionID] [int] IDENTITY(1,1) NOT NULL,
	[qvVersionCode]  AS ('QV'+CONVERT([nvarchar](10),[qvVersionID])) PERSISTED NOT NULL,
	[qvName] [nvarchar](50) NOT NULL,
	[qvType] [nvarchar](30) NOT NULL,
	[qvQBCode] [nvarchar](12) NULL,
	[qvHindi] [bit] NULL,
	[qvTamil] [bit] NULL,
	[qvBangla] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[qvVersionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTheoryQuestions]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTheoryQuestions](
	[tqCode] [int] IDENTITY(1,1) NOT NULL,
	[tqQuestion] [nvarchar](max) NOT NULL,
	[tqOption1] [nvarchar](max) NOT NULL,
	[tqOption2] [nvarchar](max) NOT NULL,
	[tqOption3] [nvarchar](max) NOT NULL,
	[tqOption4] [nvarchar](max) NOT NULL,
	[tqCorrectAnswer] [int] NOT NULL,
	[tqMarks] [int] NOT NULL,
	[tqVersionOfQB] [nvarchar](12) NULL,
	[tqLanguage] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[tqCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTheoryResult]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTheoryResult](
	[trID] [int] IDENTITY(1,1) NOT NULL,
	[trbatchID] [int] NULL,
	[trCandidateId] [nvarchar](50) NOT NULL,
	[trMarks1] [int] NULL,
	[trMarks2] [int] NULL,
	[trMarks3] [int] NULL,
	[trMarks4] [int] NULL,
	[trMarks5] [int] NULL,
	[trMarks6] [int] NULL,
	[trMarks7] [int] NULL,
	[trMarks8] [int] NULL,
	[trMarks9] [int] NULL,
	[trMarks10] [int] NULL,
	[trMarks11] [int] NULL,
	[trMarks12] [int] NULL,
	[trMarks13] [int] NULL,
	[trMarks14] [int] NULL,
	[trMarks15] [int] NULL,
	[trMarks16] [int] NULL,
	[trMarks17] [int] NULL,
	[trMarks18] [int] NULL,
	[trMarks19] [int] NULL,
	[trMarks20] [int] NULL,
	[trTotalMarks] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[trID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTotalPracticalMarks]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTotalPracticalMarks](
	[tpmID] [int] IDENTITY(1,1) NOT NULL,
	[tpmbatchID] [int] NULL,
	[tpmCandidateId] [nvarchar](50) NOT NULL,
	[tpmTotalMarks] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tpmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTrainingPartner]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrainingPartner](
	[tpCode] [int] IDENTITY(1,1) NOT NULL,
	[tpName] [nvarchar](50) NULL,
	[tpActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tpCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAssessmentBatch] ON 

INSERT [dbo].[tblAssessmentBatch] ([asId], [asType], [asPartner], [asState], [asCity], [asQpId], [asQuestionBankID], [asQuestionVersion], [asFacilitator], [asSDMSBatchName], [asCenterId], [asProjectId], [asContactPerson], [asContactPersonPhoneNo], [asContactPersonEmailId], [asTrainingStartDate], [asTrainingEndDate], [asAssesmentStartDate], [asAssesmentEndtDate], [asAssessmentStartTime], [asAssessmentEndTime], [asEnglish], [asTamil], [asBangla], [asHindi], [asRemarks]) VALUES (1, N'RPL Type 4', N'LSSC', N'Tamil Nadu', N'Chennai', N'LSS/Q5501', N'QB1', N'QV1', N'ASDM', N'SDMS9178', N'C001', N'CSSM SST', N'Shbham', 9876543210, N'shubham@gmail.com', CAST(N'2020-02-20' AS Date), CAST(N'2020-03-06' AS Date), CAST(N'2020-03-07' AS Date), CAST(N'2020-03-12' AS Date), CAST(N'00:00:00' AS Time), CAST(N'00:00:00' AS Time), 1, 1, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[tblAssessmentBatch] OFF
INSERT [dbo].[tblCandidateList] ([clEnrollmentNo], [clName], [clReqNo], [clPracticalDone], [clTheoryDeone]) VALUES (N'23516278765', N'Sanni Kumar Singh', 1, 1, 1)
INSERT [dbo].[tblCandidateList] ([clEnrollmentNo], [clName], [clReqNo], [clPracticalDone], [clTheoryDeone]) VALUES (N'3452176543', N'Shubham Thakur', 1, 0, 0)
INSERT [dbo].[tblCandidateList] ([clEnrollmentNo], [clName], [clReqNo], [clPracticalDone], [clTheoryDeone]) VALUES (N'4387651283', N'Shruti Sharma', 1, 0, 1)
INSERT [dbo].[tblCandidateList] ([clEnrollmentNo], [clName], [clReqNo], [clPracticalDone], [clTheoryDeone]) VALUES (N'654327819', N'Pranjal prasun', 1, 0, 0)
INSERT [dbo].[tblCenter] ([centerCode], [centerName], [centerAddress], [centerContactPerson], [centerContactNo], [centerEmailID]) VALUES (N'C001', N'Chennai', N'Chnai', N'Sam', 9876543210, N'sam@gmail.com')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N' LSS/N5201', N'Carry out and ensure sample making operation in goods/garment manufacturing', 1, N'LSS/Q5201')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0101', N'Carry out fleshing operations ', 1, N'LSS/Q0101 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0102', N'Contribute to achieving product quality in fleshing operations ', 1, N'LSS/Q0101 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0201', N'Carry out scudding operation using machine                                         ', 1, N'LSS/Q0201 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0301', N'Carry out soaking operation ', 1, N'LSS/QO301 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0302', N'Carry out liming operation ', 1, N'LSS/QO301 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0303', N'Carry out pickling operation ', 1, N'LSS/QO301 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0304', N'Carry out tanning operation ', 1, N'LSS/QO301 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0305', N'Contribute to achieving product quality in drum operation ', 1, N'LSS/QO301 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0401', N'Carry out splitting operations ', 1, N'LSS/Q0401')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0402', N'Carry out sammying operations ', 1, N'LSS/Q0401')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0403', N'Contribute to achieving product quality in splitting and sammying operations ', 1, N'LSS/Q0401')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0501', N'Carry out shaving operations ', 1, N'LSS/Q0501')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0502', N'Contribute to achieving product quality in shaving operations ', 1, N'LSS/Q0501')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0601', N'Carry out setting operations', 1, N'LSS/Q0601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0602', N'Carry out reverse setting operations', 1, N'LSS/Q0601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0701', N'Carry out staking operations ', 1, N'LSS/Q0701 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0702', N'Carry out toggling operation ', 1, N'LSS/Q0701 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0703', N'Carry out de-dusting operations ', 1, N'LSS/Q0701 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0704', N'Carry out embossing operations ', 1, N'LSS/Q0701 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0705', N'Contribute to achieving product quality in post tanning operations ', 1, N'LSS/Q0701 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0801', N'Carry out buffing & snuffing operations ', 1, N'LSS/Q0801 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0802', N'Carry out dusting operations ', 1, N'LSS/Q0801 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0803', N'Contribute to achieving product quality in buffing operation ', 1, N'LSS/Q0801 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0804', N'Carry out glazing operations                                                                        ', 1, N'LSS/Q0802')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0805', N'Carry out staking operation using machine', 1, N'LSS/Q0803')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0806', N'Carry out toggling operation using machine', 1, N'LSS/Q0803')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0807', N'Carry out auto spray operation using machine', 1, N'LSS/Q0803')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0808', N'Carry out roll coating operation using machine', 1, N'LSS/Q0803')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0809', N'Carry out plating operation using machine', 1, N'LSS/Q0803')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0810', N'Carry out tumbling operation using machine', 1, N'LSS/Q0803')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0811', N'Carry out measuring operation using machine      ', 1, N'LSS/Q0803')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0812', N'Assist in finishing operations in finished leather ', 1, N'LSS/Q0804')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0813', N'Support to achieving product quality in finishing operations ', 1, N'LSS/Q0804')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0901', N'Assist in wet operations in finished leather ', 1, N'LSS/Q0901 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0902', N'Support to achieving product quality in dry operation ', 1, N'LSS/Q0902')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N0903', N'Assist in dry operations in finished leather ', 1, N'LSS/Q0902')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2101', N'Designing the footwear                                                                              ', 1, N'LSS/Q2101')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2102 ', N'Carry out pattern cutting operation in footwear manufacturing', 1, N'LSS/Q2102')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2103', N'Operate the CAD CAM software to design the footwear', 1, N'LSS/Q2103')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2201', N'Carry out and ensure sample making operation in footwear manufacturing', 1, N'LSS/Q2201')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2301', N'Carry out cutting operations ', 1, N'LSS/Q2301')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2302', N'Contribute to achieving product quality in cutting processes ', 1, N'LSS/Q2301')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2401', N'Carry out footwear skiving operations using machine ', 1, N'LSS/Q2401 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2402', N'Contribute to achieving product quality in footwear skiving operation ', 1, N'LSS/Q2401 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2403', N'Carry out skiving operations using Rampi/Kurpi', 1, N'LSS/Q2402')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2404 ', N'Contribute to achieving product quality in skiving operation', 1, N'LSS/Q2402')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2501', N'Carry out stitching operation using different machines ', 1, N'LSS/Q2501')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2502', N'Contribute to achieving product quality in stitching operations ', 1, N'LSS/Q2501')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2601', N'Carry out splitting operation ', 1, N'LSS/Q2601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2602', N'Carry out gimping operation ', 1, N'LSS/Q2601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2603', N'Carry out ironing operations ', 1, N'LSS/Q2601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2604', N'Carry out marking activities ', 1, N'LSS/Q2601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2605', N'Carry out edge coloring activities ', 1, N'LSS/Q2601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2606', N'Carry out pasting activities ', 1, N'LSS/Q2601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2607', N'Carry out hand folding activities ', 1, N'LSS/Q2601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2608 ', N'Carry out eyeletting operations ', 1, N'LSS/Q2601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2609', N'Support to achieving product quality in footwear manufacturing ', 1, N'LSS/Q2601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2701', N'Carry out lasting operations using machine ', 1, N'LSS/Q2701 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2702', N'Contribute to achieving product quality in lasting operation ', 1, N'LSS/Q2701 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2703 ', N'Carry out lasting operations by hand', 1, N'LSS/Q2702')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2704', N'Contribute to achieving product quality in hand lasting operation', 1, N'LSS/Q2702')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2801', N'Carry out heel building operation', 1, N'LSS/Q2801')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N2802', N'Contribute to achieve product quality', 1, N'LSS/Q2801')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3001', N' Carryout cleaning of the footwear', 1, N'LSS/Q3001')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3002', N'Carryout trimming process', 1, N'LSS/Q3001')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3003', N'Carryout sock insertion', 1, N'LSS/Q3001')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3004', N'Carryout top line forming operation', 1, N'LSS/Q3001')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3005', N'Carryout heat activation process', 1, N'LSS/Q3001')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3006 ', N'Carryout stamping/ embossing operation', 1, N'LSS/Q3001')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3007', N'Carryout polishing of the footwear', 1, N'LSS/Q3001')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3008', N'Carry out final inspection and packing of the footwear', 1, N'LSS/Q3001')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3009', N'Carry out supporting operations in footwear finishing ', 1, N'LSS/Q3002')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3010', N'Support to achieving product quality in footwear finishing operation ', 1, N'LSS/Q3002')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3101', N'Carry out quality checks in leather footwear manufacturing', 1, N'LSS/Q3101')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3102', N'Supervise the production line', 1, N'LSS/Q3102')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3103 ', N'Ensure that the production line tools and machines are maintained properly', 1, N'LSS/Q3102')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3201', N'Supervise material, receipt and dispatch activities', 1, N'LSS/Q3201')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3202', N'Carry out stockcontrol and management', 1, N'LSS/Q3201')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3301', N'Carry out supporting operations in footwear upper making ', 1, N'LSS/Q3301')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3302', N'Support to achieving product quality in footwear upper making ', 1, N'LSS/Q3301')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3303 ', N'Carry out supporting operations in footwear bottom making ', 1, N'LSS/Q3302')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N3304 ', N'Support to achieving product quality in footwear bottom making activities ', 1, N'LSS/Q3302')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5101', N'Operate the CAD CAM software to design leather goods', 1, N'LSS/Q5101')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5102', N'Operate the CAD CAM software to design leather garment', 1, N'LSS/Q5102')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5103 ', N'Carry out pattern cutting operation in goods and garment manufacturing', 1, N'LSS/Q5103')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5301', N'Carry out cutting operations using hand ', 1, N'LSS/Q5301 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5302 ', N'Carry out cutting operations using clicking machine ', 1, N'LSS/Q5301 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5303', N'Contribute to achieving product quality in cutting operation ', 1, N'LSS/Q5301 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5401', N'Carry out goods and garments skiving operation using machine', 1, N'LSS/Q5401')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5501', N'Stitch components to produce leather goods& garments ', 1, N'LSS/Q5501')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5502', N'Contribute to achieving the product quality in stitching operations ', 1, N'LSS/Q5501')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5503', N'Carry out supporting operations in making components of leather goods and garments ', 1, N'LSS/Q5502')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5504', N'Support to achieving product quality in parts making ', 1, N'LSS/Q5502')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5601', N'Carry out supporting operations in finishing of leather goods and garments ', 1, N'LSS/Q5601 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5602', N'Support to achieving product quality in  goods and garments finishing operations ', 1, N'LSS/Q5601 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N5701', N'Carry out quality checks in goods and garments manufacturing', 1, N'LSS/Q5701')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7101', N'Carry out and ensure sample making operation', 1, N'LSS/Q7101')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7102', N'Contribute to achieving product quality in saddle making', 1, N'LSS/Q7101')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7201', N'Carry out the harness making operations', 1, N'LSS/Q7201')
GO
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7202', N'Contribute to achieving product quality in harness making', 1, N'LSS/Q7201')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7401 ', N'Carryout quality checks in saddle making', 1, N'LSS/Q7401')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7501', N'Carry out moulding operations using machine ', 1, N'LSS/Q7501 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7502', N'Contribute to achieving product quality in moulding operation ', 1, N'LSS/Q7501 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7601', N'Delegate and monitor the work as per production plan', 1, N'LSS/Q7601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7602', N'Interact and coordinate with team members, colleagues and seniors', 1, N'LSS/Q7601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7603', N'Check the various inputs required for the moulding process', 1, N'LSS/Q7601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7604', N'Ensure the quality standards as per the quality specifications', 1, N'LSS/Q7601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7605', N'Ensure the production line, tools and machines are maintained properly', 1, N'LSS/Q7601')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7701', N'Inspect and check quality of raw materials                                                          ', 1, N'LSS/Q7701')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7702', N'Check quality of semi-finished product after clicking process', 1, N'LSS/Q7701')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7703', N'Check quality of semi-finished product after stitching process      ', 1, N'LSS/Q7701')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7704', N'Check quality of semi-finished product after moulding process     ', 1, N'LSS/Q7701')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7705', N'Check quality of product after trimming process  ', 1, N'LSS/Q7701')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7706', N'Check quality of product after finishing process ', 1, N'LSS/Q7701')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N7707', N'Interact and coordinate across levels and departments', 1, N'LSS/Q7701')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N8501', N'Maintain the work area, tools and machines', 1, N'LSS/Q0902')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N860', N'Maintain health, safety and security at workplace', 1, N'LSS/Q0701 ')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N8601', N'Maintain health, safety and security at workplace', 1, N'LSS/Q0902')
INSERT [dbo].[tblNOS] ([nosCode], [nosName], [nosActive], [nosQpCode]) VALUES (N'LSS/N8701 ', N'Comply with industry, regulatory and organizational requirements', 1, N'LSS/Q0902')
SET IDENTITY_INSERT [dbo].[tblPracticalQuestion] ON 

INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (1, N'LSS/N5501', N'6', N'Select the right sewing machine, threads and bobbins for the materials as per the specifications in the job card', N'Observation', 10, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (2, N'LSS/N5501', N'7', N'Check the equipment prior to making the stitching,', N'Observation', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (3, N'LSS/N5501', N'8', N'Set machine controls for the materials being stitched', N'Observation', 10, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (4, N'LSS/N5501', N'10', N'Adjust machine controls where necessary', N'Observation', 10, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (5, N'LSS/N5501', N'26', N'Perform eyelet punching, eyelet putting and eyelet setting by hand', N'Observation', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (6, N'LSS/N5501', N'15', N'Check the upper components and conduct shade wise pairing', N'VIVA', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (7, N'LSS/N5501', N'16', N'Stitch the correct materials in the right sequence as required by the production specification', N'VIVA', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (8, N'LSS/N5501', N'24', N'Perform edge trimming operation by machine/hand', N'VIVA', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (9, N'LSS/N5501', N'26', N'Perform eyelet punching, eyelet putting and eyelet setting by hand', N'VIVA', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (10, N'LSS/N5501', N'31', N'Report risks/ problems likely to affect services to the relevant person', N'VIVA', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (11, N'LSS/N5501', N'36', N'Pass the stitched item to the next stage in the manufacturing process after validation', N'VIVA
', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (12, N'LSS/N5502', N'12', N'Complete inspection of all Closing process', N'Observations', 10, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (13, N'LSS/N5502', N'17', N'Submit to next stage for process', N'Observations', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (14, N'LSS/N5502', N'8', N'Ensure that without any damage, complete product is done', N'VIVA', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (15, N'LSS/N5502', N'9', N'Proper adhesives utilization', N'VIVA', 2, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (16, N'LSS/N5502', N'10', N'Reason for folding', N'VIVA', 2, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (17, N'LSS/N5502', N'14', N'Minimum wastage and maximum utilization of material', N'VIVA', 2, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (18, N'LSS/N5502', N'15', N'Control of faulty work and maintain the quality of work', N'VIVA', 2, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (19, N'LSS/N5502', N'18', N'After completion of work, area should be clean & safe', N'VIVA', 2, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (20, N'LSS/N8501', N'12', N'Machine guards or protector are in correct place', N'Observations', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (21, N'LSS/N8501', N'14', N'Use proper equipment', N'Observations', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (22, N'LSS/N8501', N'18', N'Proper lighting, ventilation for comfort work', N'Observations', 2, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (23, N'LSS/N8501', N'13', N'Good working posture', N'VIVA', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (24, N'LSS/N8501', N'16', N'After use of tools keep them safely', N'VIVA', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (25, N'LSS/N8501', N'17', N'Records and documentation', N'VIVA', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (26, N'LSS/N8501', N'20', N'Report outside your area of responsibilit', N'VIVA', 3, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (27, N'LSS/N8501', N'21', N'Safely handling the materials, equipment and tools', N'VIVA', 5, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (28, N'LSS/N8701', N'3', N'Implementation of policies and procedures at work place', N'Observations', 10, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (29, N'LSS/N8701', N'2', N'Clarification from senior person for policies & procedures', N'VIVA', 2, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (30, N'LSS/N8701', N'5', N'Report for requirements', N'VIVA', 3, N'QV1', N'English')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (31, N'LSS/N5501', N'6', N'வேலை அட்டையில் உள்ள விவரக்குறிப்புகளின்படி சரியான தையல் இயந்திரம், நூல்கள் மற்றும் பாபின்களைத் தேர்ந்தெடுக்கவும்', N'Observation', 10, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (32, N'LSS/N5501', N'7', N'மூடுவதற்கு முன் சாதனங்களைச் சரிபார்க்கவும், அவற்றுள்: இயந்திரக் கட்டுப்பாடுகள் கூறுகள் இணைப்புகள் ஊசிகளை மாற்றுதல் நூல்களை மாற்றுதல்', N'Observation', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (33, N'LSS/N5501', N'8', N'மூடுவதற்கு இயந்திர சமநிலையை அமைக்கவும்', N'Observation', 10, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (34, N'LSS/N5501', N'10', N'தேவையான இடங்களில் இயந்திரக் கட்டுப்பாடுகளை சரிசெய்யவும்', N'Observation', 10, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (35, N'LSS/N5501', N'26', N'இயந்திரம் / கையால் கண்ணிமை / ரிவெட் செய்யவும்', N'Observation', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (36, N'LSS/N5501', N'15', N'நிழல் மாறுபாடுகளுக்கான கூறுகளை சரிசெய்யவும்', N'VIVA', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (37, N'LSS/N5501', N'16', N'உற்பத்தி விவரக்குறிப்புக்கு ஏற்ப சரியான பொருள்களை சரியான வரிசையில் தைக்கவும்.', N'VIVA', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (38, N'LSS/N5501', N'24', N'பிந்தைய படுக்கை இயந்திரத்தால் பயன்படுத்தப்படும் புறணி பகுதியுடன் இணைதல்', N'VIVA', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (39, N'LSS/N5501', N'26', N'எட்ஜ் டிரிமிங் செயல்பாடு', N'VIVA', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (40, N'LSS/N5501', N'31', N'இயந்திரங்களின் அடிப்படை பராமரிப்பு', N'VIVA', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (41, N'LSS/N5501', N'36', N'உற்பத்திக்கான பொருள் வீணாவதைக் குறைத்தல்', N'VIVA
', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (42, N'LSS/N5502', N'12', N'அனைத்து நிறைவு செயல்முறைகளின் முழுமையான ஆய்வு', N'Observations', 10, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (43, N'LSS/N5502', N'17', N'செயல்முறைக்கு அடுத்த கட்டத்திற்கு சமர்ப்பிக்கவும்', N'Observations', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (44, N'LSS/N5502', N'8', N'எந்த சேதமும் இல்லாமல், முழுமையான தயாரிப்பு செய்யப்படுவதை உறுதிசெய்க', N'VIVA', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (45, N'LSS/N5502', N'9', N'சரியான பசைகள் பயன்பாடு', N'VIVA', 2, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (46, N'LSS/N5502', N'10', N'மடிப்புக்கான காரணம்', N'VIVA', 2, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (47, N'LSS/N5502', N'14', N'குறைந்தபட்ச வீணானது மற்றும் பொருளின் அதிகபட்ச பயன்பாடு', N'VIVA', 2, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (48, N'LSS/N5502', N'15', N'தவறான வேலையை கட்டுப்படுத்துதல் மற்றும் பணியின் தரத்தை பராமரித்தல்', N'VIVA', 2, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (49, N'LSS/N5502', N'18', N'வேலை முடிந்ததும், பகுதி சுத்தமாகவும் பாதுகாப்பாகவும் இருக்க வேண்டும்', N'VIVA', 2, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (50, N'LSS/N8501', N'12', N'இயந்திர guards அல்லது protector சரியான இடத்தில் உள்ளனர்', N'Observations', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (51, N'LSS/N8501', N'14', N'சரியான உபகரணங்களைப் பயன்படுத்துங்கள்', N'Observations', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (52, N'LSS/N8501', N'18', N'சரியான விளக்குகள், ஆறுதல் வேலைக்கு காற்றோட்டம்', N'Observations', 2, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (53, N'LSS/N8501', N'13', N'நல்ல வேலை செய்யும் தோரணை', N'VIVA', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (54, N'LSS/N8501', N'16', N'கருவிகளைப் பயன்படுத்திய பிறகு அவற்றைப் பாதுகாப்பாக வைக்கவும்', N'VIVA', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (55, N'LSS/N8501', N'17', N'பதிவுகள் மற்றும் ஆவணங்கள்', N'VIVA', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (56, N'LSS/N8501', N'20', N'உங்கள் பொறுப்புள்ள பகுதிக்கு வெளியே புகாரளிக்கவும்', N'VIVA', 3, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (57, N'LSS/N8501', N'21', N'பொருட்கள், உபகரணங்கள் மற்றும் கருவிகளைப் பாதுகாப்பாகக் கையாளுதல்', N'VIVA', 5, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (58, N'LSS/N8701', N'3', N'பணியிடத்தில் கொள்கைகள் மற்றும் நடைமுறைகளை செயல்படுத்துதல்', N'Observations', 10, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (59, N'LSS/N8701', N'2', N'கொள்கைகள் மற்றும் நடைமுறைகளுக்கு மூத்த நபரிடமிருந்து தெளிவுபடுத்தல்', N'VIVA', 2, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (60, N'LSS/N8701', N'5', N'தேவைகளுக்கான அறிக்கை', N'VIVA', 3, N'QV1', N'Tamil')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (61, N'LSS/N5501', N'6', N'जॉब कार्ड में विनिर्देशों के अनुसार सामग्री के लिए सही सिलाई मशीन, धागे और बॉबिन का चयन करें', N'Observation', 10, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (62, N'LSS/N5501', N'7', N'सिलाई करने से पहले उपकरण की जांच करें,', N'Observation', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (63, N'LSS/N5501', N'8', N'सिलाई की जा रही सामग्री के लिए सेट मशीन नियंत्रण', N'Observation', 10, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (64, N'LSS/N5501', N'10', N'जहाँ आवश्यक हो मशीन के समायोजन को समायोजित करें', N'Observation', 10, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (65, N'LSS/N5501', N'26', N'सुराख़ छिद्रण, सुराख़ लगाना और हाथ से सुराख़ करना', N'Observation', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (66, N'LSS/N5501', N'15', N'ऊपरी घटकों की जांच करें और छायावार युग्मन का संचालन करें', N'VIVA', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (67, N'LSS/N5501', N'16', N'उत्पादन विनिर्देश द्वारा आवश्यक के रूप में सही अनुक्रम में सही सामग्री सिलाई', N'VIVA', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (68, N'LSS/N5501', N'24', N'मशीन / हाथ से एज ट्रिमिंग ऑपरेशन करें', N'VIVA', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (69, N'LSS/N5501', N'26', N'सुराख़ छिद्रण, सुराख़ लगाना और हाथ से सुराख़ करना', N'VIVA', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (70, N'LSS/N5501', N'31', N'संबंधित व्यक्ति को सेवाओं को प्रभावित करने की संभावना जोखिम / समस्याओं की रिपोर्ट करें', N'VIVA', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (71, N'LSS/N5501', N'36', N'सत्यापन के बाद विनिर्माण प्रक्रिया में अगले चरण में सिले हुए आइटम को पास करें', N'VIVA
', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (72, N'LSS/N5502', N'12', N'सभी समापन प्रक्रिया का पूर्ण निरीक्षण', N'Observations', 10, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (73, N'LSS/N5502', N'17', N'प्रक्रिया के लिए अगले चरण में जमा करें', N'Observations', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (74, N'LSS/N5502', N'8', N'सुनिश्चित करें कि किसी भी नुकसान के बिना, पूरा उत्पाद किया जाता है', N'VIVA', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (75, N'LSS/N5502', N'9', N'उचित आसंजन उपयोग', N'VIVA', 2, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (76, N'LSS/N5502', N'10', N'तह करने का कारण', N'VIVA', 2, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (77, N'LSS/N5502', N'14', N'न्यूनतम अपव्यय और सामग्री का अधिकतम उपयोग', N'VIVA', 2, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (78, N'LSS/N5502', N'15', N'दोषपूर्ण कार्य का नियंत्रण और कार्य की गुणवत्ता बनाए रखना', N'VIVA', 2, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (79, N'LSS/N5502', N'18', N'काम पूरा होने के बाद, क्षेत्र साफ और सुरक्षित होना चाहिए', N'VIVA', 2, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (80, N'LSS/N8501', N'12', N'मशीन गार्ड या रक्षक सही जगह पर हैं', N'Observations', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (81, N'LSS/N8501', N'14', N'उचित उपकरण का उपयोग करें', N'Observations', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (82, N'LSS/N8501', N'18', N'उचित प्रकाश, आराम कार्य के लिए वेंटिलेशन', N'Observations', 2, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (83, N'LSS/N8501', N'13', N'अच्छा काम करने वाला आसन', N'VIVA', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (84, N'LSS/N8501', N'16', N'साधनों के उपयोग के बाद उन्हें सुरक्षित रूप से रखें', N'VIVA', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (85, N'LSS/N8501', N'17', N'रिकॉर्ड और प्रलेखन', N'VIVA', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (86, N'LSS/N8501', N'20', N'जिम्मेदारी के अपने क्षेत्र के बाहर की रिपोर्ट करें', N'VIVA', 3, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (87, N'LSS/N8501', N'21', N'सामग्री, उपकरण और उपकरणों को सुरक्षित रूप से संभालना', N'VIVA', 5, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (88, N'LSS/N8701', N'3', N'कार्य स्थल पर नीतियों और प्रक्रियाओं का कार्यान्वयन', N'Observations', 10, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (89, N'LSS/N8701', N'2', N'नीतियों और प्रक्रियाओं के लिए वरिष्ठ व्यक्ति से स्पष्टीकरण', N'VIVA', 2, N'QV1', N'Hindi')
INSERT [dbo].[tblPracticalQuestion] ([pqCode], [pqNOS], [pqPC], [pqQuestion], [pqType], [pqMarks], [pqVersionOfQB], [pqLang]) VALUES (90, N'LSS/N8701', N'5', N'आवश्यकताओं के लिए रिपोर्ट करें', N'VIVA', 3, N'QV1', N'Hindi')
SET IDENTITY_INSERT [dbo].[tblPracticalQuestion] OFF
SET IDENTITY_INSERT [dbo].[tblPracticalResult] ON 

INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (1, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (2, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (3, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (4, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (5, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (6, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (7, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (8, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (9, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (10, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (11, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (12, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (13, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (14, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (15, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (16, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (17, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (18, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (19, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (20, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (21, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (22, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (23, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (24, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (25, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (26, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (27, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (28, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (29, 1, N'3452176543', 30, 5)
INSERT [dbo].[tblPracticalResult] ([prID], [prbatchID], [prCandidateId], [prQuestionID], [prMarks]) VALUES (30, 1, N'3452176543', 30, 5)
SET IDENTITY_INSERT [dbo].[tblPracticalResult] OFF
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'CSSM SST', N'CSSM SST', NULL, N'LSSC', NULL)
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'DIPP', N'DIPP', NULL, N'LSSC', NULL)
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'DPIIT', N'DPIIT', NULL, N'LSSC', NULL)
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'FDDI', N'FDDI', NULL, N'LSSC', NULL)
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'MSSDS', N'MSSDS', N'Maharashtra State Skill Development Society', N'LSSC', NULL)
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'PBSSD', N'PBSSD', N'Certification', N'LSSC', NULL)
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'PMKVY _SPProjects', N'PMKVY _SPECIAL Projects', NULL, N'LSSC', NULL)
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'PSDM', N'PSDM', NULL, N'LSSC', NULL)
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'QAprojCode1', N'DPIIT', NULL, N'LSSC', NULL)
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'TOA', N'TOA', NULL, N'LSSC', NULL)
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'TOT', N'TOT', NULL, N'LSSC', NULL)
INSERT [dbo].[tblProject] ([projId], [projName], [projDesp], [projManager], [projAssesmentType]) VALUES (N'Type 4 RPL', N'Type 4 RPL', NULL, N'LSSC', NULL)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0101 ', N'Fleshing Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0201 ', N'Scudder (Machine)', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0401', N'Splitting and Sammying Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0501', N'Shaving Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0601', N'Setting Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0701 ', N'Post Tanning Machine Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0801 ', N'Buffing Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0802', N'Glazing Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0803', N'Finishing  Operator ', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0804', N'Helper- Finishing Operations', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0901 ', N'Helper- Wet Operations', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q0902', N'Helper Dry Operations', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2101', N'Product Developer', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2102', N'Pattern Cutter ', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2103', N'CAD CAM Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2201', N'Sample Maker', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2301', N'Cutter ', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2401 ', N'Skiving Operator ', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2402', N'Skiver-by hand ', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2501', N'Stitching Operator ', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2601', N'Pre-assembly Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2701 ', N'Lasting Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2702', N'Laster- by hand', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2801', N'Heel Builder', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q2901', N'Heel Attacher ', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q3001', N'Finsihing Operator- Post Lasting', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q3002', N'Helper- Finishing ', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q3101', N'Quality Control Inspector ', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q3102', N'Line Supervisor', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q3201', N'Store In-charge', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q3301', N'Helper- Upper Making', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q3302', N'Helper- Bottom Making', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q5101', N'CAD CAM Operator (Goods)', 4, N'Goods', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q5102', N'CAD CAM Operator (Garments)', 4, N'Garments', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q5103', N'Pattern Cutter (Goods & Garments)', 4, N'Goods & Garments', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q5201', N'Sample Maker', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q5301 ', N'Cutter', 4, N'Goods & Garments', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q5401', N'Skiving Operator (Machine)', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q5501', N'Stitcher ', 4, N'Goods & Garments', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q5502', N'Helper- Parts Making', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q5601 ', N'Helper- Finishing Operations', 4, N'Goods & Garments', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q5701', N'Quality Control Inspector (Goods & Garments)', 4, N'Goods & Garments', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q7101', N'Saddle Maker', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q7201', N'Harness Maker', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q7301', N'Sewing Machine Operator- Saddlery', 4, N'Footwear', 5, N'Class 5 ', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q7401', N'Quality Control Inspector- Saddlery', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q7501 ', N'Moulding Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q7601', N'Moulding Supervisor', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/Q7701', N'Quality Control Inspector ', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
INSERT [dbo].[tblQP] ([qpCode], [qpName], [qpNsqfLevel], [qpSectorName], [qpNoOfNOS], [qpMinEDLevel], [qpMaxEDLevel], [qpActive]) VALUES (N'LSS/QO301 ', N'Drum Operator', 4, N'Footwear', 5, N'Class 5', N'N/A', 1)
SET IDENTITY_INSERT [dbo].[tblQuestionBank] ON 

INSERT [dbo].[tblQuestionBank] ([qbQuestionID], [qbName], [qbRelatedQP]) VALUES (1, N'Basic CLosing Operator Question Bank', N'LSS/Q5501')
SET IDENTITY_INSERT [dbo].[tblQuestionBank] OFF
SET IDENTITY_INSERT [dbo].[tblQuestionPaperVersion] ON 

INSERT [dbo].[tblQuestionPaperVersion] ([qvVersionID], [qvName], [qvType], [qvQBCode], [qvHindi], [qvTamil], [qvBangla]) VALUES (1, N' Basic Operator Version 1', N'Theory + Practical', N'QB1', 1, 1, 0)
SET IDENTITY_INSERT [dbo].[tblQuestionPaperVersion] OFF
SET IDENTITY_INSERT [dbo].[tblTheoryQuestions] ON 

INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (1, N'____________ consists of instructions of the work to be carried out by basic closing operator', N'Job card', N'Identity card', N'Log book', N'Accident report', 1, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (2, N'At the end of the day, you notice some stiffness in your back and realize it''s from working in the same position for extended periods of time.   You make a note to:', N'Vary your position more often', N'Talk to your boss about an ergonomics assessment of your workstation', N'Book a massage', N'Both A and B', 4, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (3, N'Before operating closing machines you should check for which of the following?( i). Machine controls  (ii).Components attachments               (iii). Changing needles   (iv). Changing threads', N'i and ii only', N' ii and iii only', N' i, ii and iii only', N'i, ii, iii and iv', 4, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (4, N'Busted seams are repaired using which of the following materials?', N'Curved needle only', N'Upholstery thread only', N'Needle nose only', N' All of the above', 4, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (5, N'How do you ensure that your workplace is neat and tidy?', N'By reducing the material wastage for production', N'Immediately dispatching the materials to the next stage', N' Both A and B', N'By storing the waste materials next to your desk and disposing them weekly', 3, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (6, N'How do you ensure the quality of products before dispatching them to the next stage?', N'Performing quality checks at agreed intervals and in the approved way', N'Check and verify every stage in the Closing processes', N'Ensure that without any damage, complete product is done', N'All of the above', 4, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (7, N'How should you interact with other team members while coordinating with them for any work?', N'Arrogantly', N'Politely', N'Rudely', N'Aggressively', 2, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (8, N'Identify the fault in the image given', N'Detached zipper', N'Ripped seam', N'Loose stitch', N'Lining not attached properly', 2, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (9, N'Identify the material given below', N'Cutter', N'Piping', N'Seam awl', N'Shaper', 3, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (10, N'Identify the part of closing machine given below', N'Knives', N'Spring balancer', N'Needle plate', N'Hook', 3, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (11, N'Identify the purpose of machine used for?', N'Bag closing machine', N'Packaging machine', N'Leather cutting machine', N'Leather jacket sewing machine', 1, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (12, N'On your way to dispatching the products, you walk past that piece of equipment and notice that one of the guards has been removed. What do you do?', N'Lock out the machine', N'Put it back in place, if you are qualified to do so', N'Report it to your supervisor', N'All of the above', 4, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (13, N'The following machine in leather industry is used for', N'Eyelet or riveting', N'Pressing for getting proper texture', N'Smooth edging', N'Repairing bobbins of sewing machine', 1, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (14, N'The type of sewing machine given in the mage below is', N'Post bed sewing machine', N'Flat bed sewing machine', N'Zig zag machine', N'Piping machine', 1, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (15, N'What is the error in the lather product given below?', N'Broken seam', N'Piping error', N'Bad leather quality', N'No proper edging', 1, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (16, N'What is the work done in the image given below?', N'Edging', N'Piping', N'Zigzag', N'Cutting', 2, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (17, N'When you find the product damaged, what will you do?', N'Immediately correct using suitable measures', N'Immediately escalate to the supervisor', N'Throw the damaged product in the dustbin', N'Use the damaged product for personal/cleaning purpose', 1, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (18, N'Which of the following is NOT a guideline for safe lifting?', N'Do not lift any item that you cannot get your arms around or that you cannot see over when carrying.', N'Bend slightly at the knees and hips but do not stoop', N'Lift with the leg muscles', N'Keep the object away from the body.', 3, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (19, N'Which of the following rules contributes to a safe, accident-free work environment?', N'Take adequate time', N'Correct unsafe conditions immediately or report it to a supervisor', N'Do it safely the first time', N'All of the above', 4, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (20, N'Who should you report when you come across any damages in products?', N'Supervisor', N'Colleague', N'Person responsible for damage', N'No one', 1, 1, N'QV1', N'English')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (21, N'_________ அடிப்படை நிறைவு செயற்குறி மூலம் மேற்கொள்ளப்பட வேண்டிய வேலையின் செயல்குறிப்புகள் ஆகும', N'வேலை அட்டை', N'அடையாள அட்டை', N'லோக நூல', N'விபத்து அறிக்கை', 1, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (22, N'நாளின் முடிவில், உங்கள் முதுகில் சில விறைப்புத் தன்மை இருப்பதை நீங்கள் கவனித்தீர்கள், மேலும் நீண்ட நேரம் அதே நிலையில் வேலை செய்வதைநீங்கள் உணர்கிறீர்களா?  நீங்கள் ஒரு குறிப்பை செய்ய: ', N'அடிக்கடி உங்கள் நிலையை வேறுபடுத்தி கொள்ளுங்கள', N'உங்கள் பணியிடத்தின் பணிச்சூழல் மதிப்பீட்டை பற்றி உங்கள் மேலதிகாரியிடம் பேசவும', N'புத்தகம் ஒரு மசாஜ', N'A மற்றும் B', 4, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (23, N'மூடும் இயந்திரங்களை இயக்கும் முன்,  பின்வருவனவற்றில் எது உள்ளதா என்று நீங்கள் சரிபார்க்க வேண்டும்?  (i). எந்திரக் கட்டுப்பாடுகள் (ii). பாகங்கள் இணைப்புகள் (iii). மாறும் ஊசிகள் (iv). நூல்களை மாற்றுதல', N'i and ii only', N'ii and iii only', N' i, ii and iii only', N'i, ii, iii and iv', 4, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (24, N'உங்கள் பணியிடம் சுத்தமாகவும் நேர்த்தியாகவும் இருப்பதை எப்படி உறுதிப்படுத்துவீர்கள்?
', N'"உற்பத்திக்கு மூலப்பொருள் வீணாவதை குறைப்பதன் மூலம்
"
', N'"உற்பத்திக்கு மூலப்பொருள் வீணாவதை குறைப்பதன் மூலம்
"
', N'A மற்றும் B
', N'உங்கள் மேஜைக்கு அருகில் உள்ள கழிவுப் பொருட்களை சேமித்து வாரந்தோறும் அவற்றை அப்புறப்படுத்துவது
', 3, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (25, N'பின்வரும் பொருள்களில் எவை பயன்படுத்தப்படுகின்றன?
', N'வளைந்த ஊசி மட்டும
', N'மேல் நூல் மட்டும
', N'ஊசி மூக்கு மட்டும
', N'மேற்கூறிய அனைத்தும்
', 4, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (26, N'உங்கள் பணியிடம் சுத்தமாகவும் நேர்த்தியாகவும் இருப்பதை எப்படி உறுதிப்படுத்துவீர்கள்?
', N'உற்பத்திக்கு மூலப்பொருள் வீணாவதை குறைப்பதன் மூலம்
', N'உடனடியாக அடுத்த கட்டத்திற்கு பொருட்களை அனுப்புதல
', N'A மற்றும் B
', N'உங்கள் மேஜைக்கு அருகில் உள்ள கழிவுப் பொருட்களை சேமித்து வாரந்தோறும் அவற்றை அப்புறப்படுத்துவது
', 3, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (27, N'பொருள்களின் தரத்தை அடுத்த கட்டத்திற்கு அனுப்புவதற்கு முன் எவ்வாறு உறுதி செய்வது?
', N'ஒப்புக்கொண்ட இடைவெளிகளிலும் அங்கீகரிக்கப்பட்ட வழியிலும் தரச் சோதனைகளை மேற்கொள்வதன
', N'நிறைவுசெய்யும் செயல்முறைகளில் ஒவ்வொரு கட்டத்திலும் சரிபார்த்து சரிபார்க்கவும்
', N'எந்த பாதிப்பும் இல்லாமல், முழுமையான தயாரிப்பு செய்யப்படுகிறது என்பதை உறுதி செய்யவும
', N'மேற்கூறிய அனைத்தும
', 4, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (28, N'எந்த வேலைக்காக அவர்களுடன் ஒருங்கிணைந்திருக்கும்போது மற்ற குழு உறுப்பினர்களுடன் நீங்கள் எப்படி ஊடாட வேண்டும்? 
', N'அருகணக
', N'கண்ணியமாக
', N'முரட்டுத்தனமாக
', N'ஆக்ரோஷமாக
', 2, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (29, N'கொடுக்கப்பட்டுள்ள படத்தில் உள்ள பழுதை அடையாளம் காணுங்கள
', N'ஒட்டப்பட்ட சிப்பி
', N'பிளக்கும் சீம
', N'தளர்வான தையல்
', N'லைனிங் சரியாக இணைக்கப்படவில்லை
', 2, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (30, N'கீழே கொடுக்கப்பட்டுள்ள பொருளை அடையாளம் காணவும
', N'கட்டர்
', N'குழாய்
', N'சேம் அவால
', N'ஷப்பர
', 3, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (31, N'கீழே கொடுக்கப்பட்டுள்ள மூடும் இயந்திரத்தின் பகுதியை அடையாளம் காணவும
', N'கத்திகள
', N'வசந்த பாலன்கர
', N'ஊசி தட்டு
', N'கொக்கி
', 3, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (32, N'நீங்கள் பொருட்களை அனுப்பச் செல்லும் வழியில், நீங்கள் அந்த உபகரணத் துண்டை கடந்து நடந்து சென்று, காவலாளிகள் ஒருவர் அகற்றப்பட்டிருக்கிறார் என்பதைக் கவனியுங்கள். நீங்கள் என்ன செய்கிறீர்கள்? 
', N'எந்திரத்தை லாக் அவுட் செய்தல
', N'"நீங்கள் செய்ய தகுதி இருந்தால், அதை மீண்டும் இடத்தில் வைத்து
"
', N'உங்கள் மேற்பார்வையாளரிடம் தெரிவிக்கவும
', N'மேற்கூறிய அனைத்தும
', 4, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (33, N'தோல் தொழிற்சாலையில்  கீழ்க்கண்ட இயந்திரம் பயன்படுகிறது
', N'கண்ணிமை அல்லது ரிவீட்டிங்
', N'சரியான நுட்பம் பெற அழுத்தம
', N'"சீரான முறையில் நீக்குதல்
"
', N'" தையல் இயந்திரத்தின் பொபின்களை பழுதுபார்த்தல்
"
', 1, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (34, N'கீழே உள்ள image  வழங்கப்படும் தையல் இயந்திரத்தின் வகை
', N'போஸ்ட் பெட் தையல் இயந்திரம
', N'தட்டையான படுக்கை தையல் இயந்திரம
', N'ஜிக் சாபாக இயந்திரம
', N'பைலிங் இயந்திரம
', 1, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (35, N'கீழே கொடுக்கப்பட்டுள்ள லாவுத்தர் தயாரிப்பில் பிழை என்ன?
', N'உடைந்த சேம
', N'குழாய் பிழை
', N'மோசமான தோல் தரம
', N'சரியான எடைத்தல் இல்லை
', 1, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (36, N'கீழே கொடுக்கப்பட்டுள்ள படத்தில் என்ன வேலை செய்யப்படுகிறது?
', N'எடைத்தல்
', N'"குழாய்
"
', N'ஏற்ற இறக்கமான
', N'வெட்டுதல
', 2, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (37, N'விளைபொருள் சேதமடைந்ததை நீங்கள் கண்டால், என்ன செய்வார்கள்?
', N'தகுந்த நடவடிக்கைகளைப் பயன்படுத்தி உடனடியாக சரிசெய்தல
', N'மேற்பார்வையாளரை உடனடியாக தீவிரமாக்கவும
', N'"சேதமடைந்த தயாரிப்பை குப்பைத் தொட்டியில் எறியுங்கள்
"
', N'தனிப்பட்ட/சுத்தப்படுத்தும் நோக்கத்திற்காக சேதமடைந்த தயாரிப்பை பயன்படுத்தவும
', 1, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (38, N'பின்வருபவற்றில் எது  பாதுகாப்பான தூக்கலுக்கு வழிகாட்டி அல்ல? 
', N'"நீங்கள் உங்கள் கைகள் பெற முடியாது என்று எந்த உருப்படியை தூக்க வேண்டாம் அல்லது நீங்கள்
கொண்டு போது மேல் பார்க்க முடியாது என்று"
', N'முழங்கால் மற்றும் இடுப்பின் மீது சற்று குனிந்து, ஆனால் ஸ்டெப வேண்டாம
', N'கால் தசைகளை தூக்குங்கள
', N'பொருளை உடலிலிருந்து விலக்கி வைக்கவும
', 3, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (39, N'"பின்வரும் விதிகளில் எது பாதுகாப்பான, விபத்தற்ற
பணிச்சூழலுக்கான பங்களிக்கிறது?"
', N'போதுமான நேரம் எடுத்துக்கொள்ளுங்கள
', N'. பாதுகாப்பற்ற நிலைமைகளை உடனடியாக சரி செய்யவும் அல்லது மேற்பார்வையாளரிடம் தெரிவிக்கவும
', N'முதல் முறையாக அதை பத்திரமாக செய்யுங்கள்.
', N'மேற்கூறியவை அனைத்தும
', 4, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (40, N'தயாரிப்புகளில் ஏதேனும் சேதாரங்கள் ஏற்பட்டால் நீங்கள் யார் தெரிவிக்க வேண்டும்?
', N'மேற்பார்வையாளர்
', N'சகா
', N'சேதத்திற்கு பொறுப்பான நபர்
', N'யாரும்
', 1, 1, N'QV1', N'Tamil')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (41, N'______________ में बुनियादी समापन ऑपरेटर द्वारा किये जाने वाले कार्य के निर्देश शामिल हैं |
', N'जॉब कार्ड
', N'पहचान पत्र
', N'लॉग बुक
', N'दुर्घटना की रिपोर्ट
', 1, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (42, N'"दिन के अंत में , आप अपनी पीठ में
कुछ कठोरता नोटिस करते हैं और महसूस करते हैं कि यह उसी स्थिति में काम करने से है जी समय की विस्तारित अवधि के लिए है | आप एक नोट
बनाएं :"
', N'अधिकतर आपकी स्थिति
', N'अपने वर्कस्टेशन के एर्गोनोमिक्स मूल्यांकन के बारे में अपने बॉस से बात करें |
', N'"एक मसाज़ बुक करें
"
', N'1 और 2 दोनो
', 4, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (43, N'समापन मशीनों के संचालन से पहले आपको निम्नलिखित में से किसकी जांच करनी चाहिए ? (i). मशीन नियंत्रण (ii).घटक संलग्नक (iii). सुईयों का बदलना (iv). धागों का बदलना
', N'"केवल i और ii
"
', N'केवल ii और iii
', N' i , ii और iii केवल
', N'i , ii , iii और iv
', 4, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (44, N'निम्नलिखित में से किसका उपयोग करके बस्ट सीम की मरम्मत की जाती है ?
', N'"केवल घुमावदार सुई
"
', N'अपहोस्टरी (असबाब) धागा
', N'केवल सुई की नोक
', N'"उपरोक्त सभी
"
', 4, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (45, N'"आप यह कैसे सुनिश्चित करते हैं कि आपका कार्यस्थल साफ़ सुथरा हो ?
"
', N'उत्पादन के लिए सामग्री अपव्यय को कम करक
', N'सामग्री को तुरंत अगले चरण के लिए भेजना
', N'1 और 2 दोनो
', N'अपने डेस्क के बगल में अपशिष्ट सामग्रियों को स्टोर करके और साप्ताहिक रूप में उनका निपटान करक
', 3, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (46, N'"उत्पादों को अगले चरण में भेजने से पहले आप उनकी गुणवत्ता कैसे
सुनिश्चित करेंगे ?"
', N'सहमत अंतराल पर और अनुमोदित तरीके से गुणवत्ता क जांच करक
', N'समापन प्रक्रियाओं में प्रत्येक चरण की जांच करके और सत्यापित करक
', N'सुनिश्चित करें कि बिना किसी क्षति के उत्पाद को पूरा किया गया है
', N'उपरोक्त सभी
', 4, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (47, N'"किसी भी काम के लिए टीम के सदस्यों के साथ समन्वय करते हुए आपको उनसे कैसे बातचीत करनी चाहिए ?
"
', N'अहंकारपूर्वक
', N'विनम्रता स
', N'बेरुखी स
', N'आक्रामक तरीके स
', 2, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (48, N'दी गयी छवि में दोष की पहचान करें |
', N'"अलग किया हुआ जिपर
"
', N'फटी हुई सिलाई
', N'ढीली सिलाई
', N'अस्तर ठीक से संलग्न नहीं ह
', 2, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (49, N'नीचे दी गयी सामग्री को पहचाने |
', N'कटर
', N'पाइपिंग
', N'सीम अव्ल (सुआ)
', N'शेपर
', 3, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (50, N'नीचे दिए गए समापन मशीन के भाग की पहचान करें |
', N'चाक
', N'स्प्रिंग बैलेंसर
', N'सुई की प्लेट
', N'ुक
', 3, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (51, N'मशीन के उद्देश्य की पहचान किसके लिए की जाती है ?
', N'बैग बंद करने की मशीन
', N'पैकेजिंग मशीन
', N'चमड़ा काटने की मशीन
', N'चमड़े की जैकेट की सिलाई मशीन
', 1, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (52, N'उत्पादों को भेजने के लिए अपने रास्ते पर , आप उपकरण के उस टुकड़े से आगे बढ़ते हैं और ध्यान देते हैं कि एक गार्ड हटा दिया गया है | ऐसे में आप क्या करते हैं ?
', N'"मशीन को लॉक कर दें
"
', N'यदि आप ऐसा करने के लिए योग्य हैं , तो इसे वापस रखें |
', N'"अपने सुपरवाइजर को इसकी सूचना दें |
"
', N'उपरोक्त सभी
', 4, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (53, N'"निम्नलिखित मशीन का उपयोग चमड़ा उद्योग में
____________ के लिए किया जाता है |
"
', N'सुराख या राइवेटिंग
', N'"उचित बनावट प्राप्त करने के लिए दबाव डालना
"
', N'चिकना किनारा
', N'सिलाई मशीन के बॉबिन की मरम्मत करना
', 1, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (54, N'नीचे छवि में दी गयी सिलाई मशीन का प्रकार है --
', N'पोस्ट बेड सिलाई मशीन
', N'फ्लैट बेड सिलाई मशीन
', N'जिग ज़ैग मशीन
', N'पाइपिंग मशीन
', 1, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (55, N'नीचे दिए गए चमड़ा उत्पाद में क्या त्रुटी है ?
', N'टूटी हुई सिलाई
', N'पाइपिंग त्रुटी
', N'खराब चमड़े की गुणवत्ता
', N'कोई उचित किनारा नही
', 1, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (56, N'नीचे दी गयी छवि में क्या काम किया जा रहा है ?
', N'किनारे का
', N'पाइपिंग का
', N'जिगजैग (वक्र) का
', N'काटने का
', 2, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (57, N'"जब आप उत्पाद को क्षतिग्रस्त पाते  हैं , तो आप क्या करेंगे ?
"
', N'"उपयुक्त उपायों का उपयोग करके तुरंत सही करें
"
', N'"तुरंत सुपरवाइजर को बढ़ा दें
"
', N'क्षतिग्रस्त उत्पाद को कूड़ेदान में फेंक द
', N'क्षतिग्रस्त उत्पाद का उपयोग व्यक्तिगत / सफाई उद्देश्य के लिए करे
', 1, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (58, N'निम्नलिखित में से कौन सा सुरक्षित लिफ्टिंग  के लिए एक दिशानिर्देश नहीं है ?
', N'"किसी भी ऐसी वस्तु को न उठायें जिसके चारों ओर आप अपनी भुजाओं को नहीं ले जा सकते हैं या जिसे ले जाते समय आप देख नहीं सकते हैं
|
"
', N'घुटनों और कूल्हों पर थोड़ा झुकें लेकिन रुके नही
', N'पैर की मांसपेशियों के साथ उठाय
', N'वस्तु को शरीर से दूर रख
', 3, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (59, N'"निम्नलिखित में से कौन सा नियम एक सुरक्षित , दुर्घटना-
मुक्त कार्य वातावरण में योगदान देता है ?
       "
', N'पर्याप्त समय ले
', N'असुरक्षित स्थितियों को तुरंत ठीक करें या सुपरवाइजर को इसकी सूचना दें |
', N'पहली बार इसे सुरक्षित रूप से कर
', N'उपरोक्त सभी
', 4, 1, N'QV1', N'Hindi')
INSERT [dbo].[tblTheoryQuestions] ([tqCode], [tqQuestion], [tqOption1], [tqOption2], [tqOption3], [tqOption4], [tqCorrectAnswer], [tqMarks], [tqVersionOfQB], [tqLanguage]) VALUES (60, N'जब आप उत्पादों में किसी भी नुकसान के बारे में रिपोर्ट करते हैं, तो आपको कौन चाहिए?
', N'पर्यवेक्षक
', N'साथ काम करने वाला
', N'क्षति के लिए जिम्मेदार व्यक्ति
', N'कोई नहीं
', 1, 1, N'QV1', N'Hindi')
SET IDENTITY_INSERT [dbo].[tblTheoryQuestions] OFF
SET IDENTITY_INSERT [dbo].[tblTheoryResult] ON 

INSERT [dbo].[tblTheoryResult] ([trID], [trbatchID], [trCandidateId], [trMarks1], [trMarks2], [trMarks3], [trMarks4], [trMarks5], [trMarks6], [trMarks7], [trMarks8], [trMarks9], [trMarks10], [trMarks11], [trMarks12], [trMarks13], [trMarks14], [trMarks15], [trMarks16], [trMarks17], [trMarks18], [trMarks19], [trMarks20], [trTotalMarks]) VALUES (1, 1, N'23516278765', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[tblTheoryResult] ([trID], [trbatchID], [trCandidateId], [trMarks1], [trMarks2], [trMarks3], [trMarks4], [trMarks5], [trMarks6], [trMarks7], [trMarks8], [trMarks9], [trMarks10], [trMarks11], [trMarks12], [trMarks13], [trMarks14], [trMarks15], [trMarks16], [trMarks17], [trMarks18], [trMarks19], [trMarks20], [trTotalMarks]) VALUES (2, 1, N'23516278765', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1)
INSERT [dbo].[tblTheoryResult] ([trID], [trbatchID], [trCandidateId], [trMarks1], [trMarks2], [trMarks3], [trMarks4], [trMarks5], [trMarks6], [trMarks7], [trMarks8], [trMarks9], [trMarks10], [trMarks11], [trMarks12], [trMarks13], [trMarks14], [trMarks15], [trMarks16], [trMarks17], [trMarks18], [trMarks19], [trMarks20], [trTotalMarks]) VALUES (3, 1, N'23516278765', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1)
INSERT [dbo].[tblTheoryResult] ([trID], [trbatchID], [trCandidateId], [trMarks1], [trMarks2], [trMarks3], [trMarks4], [trMarks5], [trMarks6], [trMarks7], [trMarks8], [trMarks9], [trMarks10], [trMarks11], [trMarks12], [trMarks13], [trMarks14], [trMarks15], [trMarks16], [trMarks17], [trMarks18], [trMarks19], [trMarks20], [trTotalMarks]) VALUES (4, 1, N'4387651283', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[tblTheoryResult] ([trID], [trbatchID], [trCandidateId], [trMarks1], [trMarks2], [trMarks3], [trMarks4], [trMarks5], [trMarks6], [trMarks7], [trMarks8], [trMarks9], [trMarks10], [trMarks11], [trMarks12], [trMarks13], [trMarks14], [trMarks15], [trMarks16], [trMarks17], [trMarks18], [trMarks19], [trMarks20], [trTotalMarks]) VALUES (5, 1, N'23516278765', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1)
INSERT [dbo].[tblTheoryResult] ([trID], [trbatchID], [trCandidateId], [trMarks1], [trMarks2], [trMarks3], [trMarks4], [trMarks5], [trMarks6], [trMarks7], [trMarks8], [trMarks9], [trMarks10], [trMarks11], [trMarks12], [trMarks13], [trMarks14], [trMarks15], [trMarks16], [trMarks17], [trMarks18], [trMarks19], [trMarks20], [trTotalMarks]) VALUES (6, 1, N'23516278765', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[tblTheoryResult] OFF
SET IDENTITY_INSERT [dbo].[tblTrainingPartner] ON 

INSERT [dbo].[tblTrainingPartner] ([tpCode], [tpName], [tpActive]) VALUES (1, N'Apex Global Solutions', 1)
INSERT [dbo].[tblTrainingPartner] ([tpCode], [tpName], [tpActive]) VALUES (2, N'Arrowpoint Infoteck', 1)
INSERT [dbo].[tblTrainingPartner] ([tpCode], [tpName], [tpActive]) VALUES (3, N'CFTI - Agra', 1)
INSERT [dbo].[tblTrainingPartner] ([tpCode], [tpName], [tpActive]) VALUES (4, N'CFTI - Chennai', 1)
INSERT [dbo].[tblTrainingPartner] ([tpCode], [tpName], [tpActive]) VALUES (5, N'Leather Sector Skill Council', 1)
INSERT [dbo].[tblTrainingPartner] ([tpCode], [tpName], [tpActive]) VALUES (6, N'MAULANA AZAD EDUCATION AID FOUNDATION-7', 1)
INSERT [dbo].[tblTrainingPartner] ([tpCode], [tpName], [tpActive]) VALUES (7, N'QA TP', 1)
INSERT [dbo].[tblTrainingPartner] ([tpCode], [tpName], [tpActive]) VALUES (8, N'Srinagar Samaj Unnayan Samity', 1)
INSERT [dbo].[tblTrainingPartner] ([tpCode], [tpName], [tpActive]) VALUES (9, N'Srinagar Samaj Unnayan Samity(Basanti)', 1)
INSERT [dbo].[tblTrainingPartner] ([tpCode], [tpName], [tpActive]) VALUES (10, N'Srinagar Samaj Unnayan Samity(Murshidabad)', 1)
SET IDENTITY_INSERT [dbo].[tblTrainingPartner] OFF
ALTER TABLE [dbo].[tblCandidateList] ADD  DEFAULT ((0)) FOR [clPracticalDone]
GO
ALTER TABLE [dbo].[tblCandidateList] ADD  DEFAULT ((0)) FOR [clTheoryDeone]
GO
ALTER TABLE [dbo].[tblFinalResult] ADD  DEFAULT (NULL) FOR [frTheoryResult]
GO
ALTER TABLE [dbo].[tblFinalResult] ADD  DEFAULT (NULL) FOR [frPracticalResult]
GO
ALTER TABLE [dbo].[tblFinalResult] ADD  DEFAULT (NULL) FOR [frFinalResult]
GO
ALTER TABLE [dbo].[tblAssessmentBatch]  WITH CHECK ADD  CONSTRAINT [FK_asQP] FOREIGN KEY([asQpId])
REFERENCES [dbo].[tblQP] ([qpCode])
GO
ALTER TABLE [dbo].[tblAssessmentBatch] CHECK CONSTRAINT [FK_asQP]
GO
ALTER TABLE [dbo].[tblAssessmentBatch]  WITH CHECK ADD  CONSTRAINT [FK_assecenterID] FOREIGN KEY([asCenterId])
REFERENCES [dbo].[tblCenter] ([centerCode])
GO
ALTER TABLE [dbo].[tblAssessmentBatch] CHECK CONSTRAINT [FK_assecenterID]
GO
ALTER TABLE [dbo].[tblAssessmentBatch]  WITH CHECK ADD  CONSTRAINT [FK_asseprojectID] FOREIGN KEY([asProjectId])
REFERENCES [dbo].[tblProject] ([projId])
GO
ALTER TABLE [dbo].[tblAssessmentBatch] CHECK CONSTRAINT [FK_asseprojectID]
GO
ALTER TABLE [dbo].[tblAssessmentBatch]  WITH CHECK ADD  CONSTRAINT [FK_qbID] FOREIGN KEY([asQuestionBankID])
REFERENCES [dbo].[tblQuestionBank] ([qbQuestionCode])
GO
ALTER TABLE [dbo].[tblAssessmentBatch] CHECK CONSTRAINT [FK_qbID]
GO
ALTER TABLE [dbo].[tblAssessmentBatch]  WITH CHECK ADD  CONSTRAINT [FK_QuestionVersion] FOREIGN KEY([asQuestionVersion])
REFERENCES [dbo].[tblQuestionPaperVersion] ([qvVersionCode])
GO
ALTER TABLE [dbo].[tblAssessmentBatch] CHECK CONSTRAINT [FK_QuestionVersion]
GO
ALTER TABLE [dbo].[tblAssessmentProof]  WITH CHECK ADD  CONSTRAINT [FK_batchIDas] FOREIGN KEY([asbatchID])
REFERENCES [dbo].[tblAssessmentBatch] ([asId])
GO
ALTER TABLE [dbo].[tblAssessmentProof] CHECK CONSTRAINT [FK_batchIDas]
GO
ALTER TABLE [dbo].[tblAssessmentProof]  WITH CHECK ADD  CONSTRAINT [FK_candidateIDas] FOREIGN KEY([asCandidateId])
REFERENCES [dbo].[tblCandidateList] ([clEnrollmentNo])
GO
ALTER TABLE [dbo].[tblAssessmentProof] CHECK CONSTRAINT [FK_candidateIDas]
GO
ALTER TABLE [dbo].[tblFinalResult]  WITH CHECK ADD  CONSTRAINT [FK_batchIDfr] FOREIGN KEY([frbatchID])
REFERENCES [dbo].[tblAssessmentBatch] ([asId])
GO
ALTER TABLE [dbo].[tblFinalResult] CHECK CONSTRAINT [FK_batchIDfr]
GO
ALTER TABLE [dbo].[tblFinalResult]  WITH CHECK ADD  CONSTRAINT [FK_candidateIDfr] FOREIGN KEY([frCandidateId])
REFERENCES [dbo].[tblCandidateList] ([clEnrollmentNo])
GO
ALTER TABLE [dbo].[tblFinalResult] CHECK CONSTRAINT [FK_candidateIDfr]
GO
ALTER TABLE [dbo].[tblFinalResult]  WITH CHECK ADD  CONSTRAINT [FK_PracticalResultIDfr] FOREIGN KEY([frPracticalID])
REFERENCES [dbo].[tblTotalPracticalMarks] ([tpmID])
GO
ALTER TABLE [dbo].[tblFinalResult] CHECK CONSTRAINT [FK_PracticalResultIDfr]
GO
ALTER TABLE [dbo].[tblFinalResult]  WITH CHECK ADD  CONSTRAINT [FK_theoryResultIDfr] FOREIGN KEY([frTheoryID])
REFERENCES [dbo].[tblTheoryResult] ([trID])
GO
ALTER TABLE [dbo].[tblFinalResult] CHECK CONSTRAINT [FK_theoryResultIDfr]
GO
ALTER TABLE [dbo].[tblNOS]  WITH CHECK ADD  CONSTRAINT [FK_nosQpConn] FOREIGN KEY([nosQpCode])
REFERENCES [dbo].[tblQP] ([qpCode])
GO
ALTER TABLE [dbo].[tblNOS] CHECK CONSTRAINT [FK_nosQpConn]
GO
ALTER TABLE [dbo].[tblPracticalQuestion]  WITH CHECK ADD  CONSTRAINT [FK_nosOfPQ] FOREIGN KEY([pqNOS])
REFERENCES [dbo].[tblNOS] ([nosCode])
GO
ALTER TABLE [dbo].[tblPracticalQuestion] CHECK CONSTRAINT [FK_nosOfPQ]
GO
ALTER TABLE [dbo].[tblPracticalQuestion]  WITH CHECK ADD  CONSTRAINT [FK_pqVersionID] FOREIGN KEY([pqVersionOfQB])
REFERENCES [dbo].[tblQuestionPaperVersion] ([qvVersionCode])
GO
ALTER TABLE [dbo].[tblPracticalQuestion] CHECK CONSTRAINT [FK_pqVersionID]
GO
ALTER TABLE [dbo].[tblPracticalResult]  WITH CHECK ADD  CONSTRAINT [FK_batchIDPR] FOREIGN KEY([prbatchID])
REFERENCES [dbo].[tblAssessmentBatch] ([asId])
GO
ALTER TABLE [dbo].[tblPracticalResult] CHECK CONSTRAINT [FK_batchIDPR]
GO
ALTER TABLE [dbo].[tblPracticalResult]  WITH CHECK ADD  CONSTRAINT [FK_candidateIDPR] FOREIGN KEY([prCandidateId])
REFERENCES [dbo].[tblCandidateList] ([clEnrollmentNo])
GO
ALTER TABLE [dbo].[tblPracticalResult] CHECK CONSTRAINT [FK_candidateIDPR]
GO
ALTER TABLE [dbo].[tblPracticalResult]  WITH CHECK ADD  CONSTRAINT [FK_questionIDPR] FOREIGN KEY([prQuestionID])
REFERENCES [dbo].[tblPracticalQuestion] ([pqCode])
GO
ALTER TABLE [dbo].[tblPracticalResult] CHECK CONSTRAINT [FK_questionIDPR]
GO
ALTER TABLE [dbo].[tblQuestionBank]  WITH CHECK ADD  CONSTRAINT [FK_qbQpConn] FOREIGN KEY([qbRelatedQP])
REFERENCES [dbo].[tblQP] ([qpCode])
GO
ALTER TABLE [dbo].[tblQuestionBank] CHECK CONSTRAINT [FK_qbQpConn]
GO
ALTER TABLE [dbo].[tblQuestionPaperVersion]  WITH CHECK ADD  CONSTRAINT [FK_QBCode] FOREIGN KEY([qvQBCode])
REFERENCES [dbo].[tblQuestionBank] ([qbQuestionCode])
GO
ALTER TABLE [dbo].[tblQuestionPaperVersion] CHECK CONSTRAINT [FK_QBCode]
GO
ALTER TABLE [dbo].[tblTheoryQuestions]  WITH CHECK ADD  CONSTRAINT [FK_versionID] FOREIGN KEY([tqVersionOfQB])
REFERENCES [dbo].[tblQuestionPaperVersion] ([qvVersionCode])
GO
ALTER TABLE [dbo].[tblTheoryQuestions] CHECK CONSTRAINT [FK_versionID]
GO
ALTER TABLE [dbo].[tblTheoryResult]  WITH CHECK ADD  CONSTRAINT [FK_batchID] FOREIGN KEY([trbatchID])
REFERENCES [dbo].[tblAssessmentBatch] ([asId])
GO
ALTER TABLE [dbo].[tblTheoryResult] CHECK CONSTRAINT [FK_batchID]
GO
ALTER TABLE [dbo].[tblTheoryResult]  WITH CHECK ADD  CONSTRAINT [FK_candidate] FOREIGN KEY([trCandidateId])
REFERENCES [dbo].[tblCandidateList] ([clEnrollmentNo])
GO
ALTER TABLE [dbo].[tblTheoryResult] CHECK CONSTRAINT [FK_candidate]
GO
ALTER TABLE [dbo].[tblTotalPracticalMarks]  WITH CHECK ADD  CONSTRAINT [FK_batchIDtpm] FOREIGN KEY([tpmbatchID])
REFERENCES [dbo].[tblAssessmentBatch] ([asId])
GO
ALTER TABLE [dbo].[tblTotalPracticalMarks] CHECK CONSTRAINT [FK_batchIDtpm]
GO
ALTER TABLE [dbo].[tblTotalPracticalMarks]  WITH CHECK ADD  CONSTRAINT [FK_candidateIDtpm] FOREIGN KEY([tpmCandidateId])
REFERENCES [dbo].[tblCandidateList] ([clEnrollmentNo])
GO
ALTER TABLE [dbo].[tblTotalPracticalMarks] CHECK CONSTRAINT [FK_candidateIDtpm]
GO
/****** Object:  StoredProcedure [dbo].[spCandidateList]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCandidateList] @id int
AS
Select cl.*
from tblCandidateList cl, tblAssessmentBatch ab
where ab.asId = cl.clReqNo and cl.clReqNo = @id
GO
/****** Object:  StoredProcedure [dbo].[spCenterAssesor]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCenterAssesor] @id int
AS
Select ab.asId, ab.asContactPerson,ab.asSDMSBatchName ,c.centerName,ab.asQuestionBankID,ab.asQuestionVersion,qvHindi,qvBangla,qvTamil
from tblAssessmentBatch ab, tblCenter c,tblQuestionPaperVersion qv
where ab.asCenterId = c.centerCode AND ab.asQuestionVersion = qv.qvVersionCode AND ab.asId =@id
GO
/****** Object:  StoredProcedure [dbo].[spPracticalBitChange]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spPracticalBitChange] @enroll nvarchar(50)  --this is to change the bit of the candidate that the exam is done
as
UPDATE tblCandidateList
SET clPracticalDone = 'true'
where clEnrollmentNo = @enroll
GO
/****** Object:  StoredProcedure [dbo].[spPracticalResult]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spPracticalResult] @candId nvarchar(50), @batchID int, @question int, @marks int
as 
insert into tblPracticalResult values(@batchID,'@candId',@question,@marks)
GO
/****** Object:  StoredProcedure [dbo].[spQuestionPaperPractical]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spQuestionPaperPractical] @id int
AS
Select pq.*
from tblPracticalQuestion pq,tblAssessmentBatch ab,tblQuestionPaperVersion qpv
where ab.asId = 1 And ab.asQuestionVersion = qpv.qvVersionCode  AND qpv.qvVersionCode = pq.pqVersionOfQB
GO
/****** Object:  StoredProcedure [dbo].[spQuestionPaperTheory]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spQuestionPaperTheory] @id int
AS
Select tq.*
from tblTheoryQuestions tq,tblAssessmentBatch ab,tblQuestionPaperVersion qpv
where ab.asId = 1 And ab.asQuestionVersion = qpv.qvVersionCode  AND qpv.qvVersionCode = tq.tqVersionOfQB
GO
/****** Object:  StoredProcedure [dbo].[spTheoryBitChange]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spTheoryBitChange] @enroll nvarchar(50)  --this is to change the bit of the candidate that the exam is done
as
UPDATE [dbo].[tblCandidateList]
SET [clTheoryDeone] = 'true'
where [clEnrollmentNo] = @enroll
GO
/****** Object:  StoredProcedure [dbo].[spTheoryResult]    Script Date: 2/17/2020 12:14:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTheoryResult] @candID nvarchar(50) ,@batch int , @marks1 int,@marks2 int,@marks3 int,@marks4 int,@marks5 int,@marks6 int,@marks7 int,@marks8 int,@marks9 int,@marks10 int,@marks11 int,@marks12 int,@marks13 int,@marks14 int,@marks15 int,@marks16 int,@marks17 int,@marks18 int,@marks19 int,@marks20 int,@total int
AS
Insert into tblTheoryResult values(@batch,'@cand',@marks1,@marks2,@marks3,@marks4,@marks5,@marks6,@marks7,@marks8,@marks9,@marks10,@marks11,@marks12,@marks13,@marks14,@marks15,@marks16,@marks17,@marks18,@marks19,@marks20,@total)
GO
USE [master]
GO
ALTER DATABASE [lsscPortal] SET  READ_WRITE 
GO
