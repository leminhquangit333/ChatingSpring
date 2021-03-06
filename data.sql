USE [master]
GO
/****** Object:  Database [ChatSpring]    Script Date: 20/01/2021 21:14:49 ******/
CREATE DATABASE [ChatSpring]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLUser', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLUser.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLUser_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLUser_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ChatSpring] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChatSpring].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChatSpring] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChatSpring] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChatSpring] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChatSpring] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChatSpring] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChatSpring] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChatSpring] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChatSpring] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChatSpring] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChatSpring] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChatSpring] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChatSpring] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChatSpring] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChatSpring] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChatSpring] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChatSpring] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChatSpring] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChatSpring] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChatSpring] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChatSpring] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChatSpring] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChatSpring] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChatSpring] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ChatSpring] SET  MULTI_USER 
GO
ALTER DATABASE [ChatSpring] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChatSpring] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChatSpring] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChatSpring] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ChatSpring] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ChatSpring]
GO
/****** Object:  Table [dbo].[MakeFriend]    Script Date: 20/01/2021 21:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MakeFriend](
	[User1] [nvarchar](50) NOT NULL,
	[User2] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Friend] PRIMARY KEY CLUSTERED 
(
	[User1] ASC,
	[User2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 20/01/2021 21:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserSend] [nvarchar](50) NOT NULL,
	[UserReceive] [nvarchar](50) NOT NULL,
	[ContentMessage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MessageFriend] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 20/01/2021 21:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QLUser] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[Fn_findFriend]    Script Date: 20/01/2021 21:14:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Fn_findFriend](@nickName nvarchar(50))
returns table return
	select NickName from dbo.Users where NickName like ('%'+@nickName+'%')
GO
INSERT [dbo].[MakeFriend] ([User1], [User2]) VALUES (N'dmoe01', N'USER3')
INSERT [dbo].[MakeFriend] ([User1], [User2]) VALUES (N'USER1', N'USER3')
INSERT [dbo].[MakeFriend] ([User1], [User2]) VALUES (N'USER1', N'USER5')
INSERT [dbo].[MakeFriend] ([User1], [User2]) VALUES (N'USER2', N'USER3')
INSERT [dbo].[MakeFriend] ([User1], [User2]) VALUES (N'USER3', N'dmoe01')
INSERT [dbo].[MakeFriend] ([User1], [User2]) VALUES (N'USER3', N'USER1')
INSERT [dbo].[MakeFriend] ([User1], [User2]) VALUES (N'USER3', N'USER2')
INSERT [dbo].[MakeFriend] ([User1], [User2]) VALUES (N'USER5', N'USER1')
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (78, N'USER1', N'USER5', N'aloo')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (79, N'USER5', N'USER1', N'tin nhắn 1')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (80, N'USER1', N'USER5', N'tin nhắn 2
')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (81, N'USER1', N'USER5', N'hello bạn hôm nay trời đẹp nhỉ

')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (82, N'USER5', N'USER1', N'mình cũng thấy thế ')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (83, N'USER3', N'USER1', N'kêu gắn hình')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (84, N'USER1', N'USER3', N'alo1234')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (86, N'USER3', N'USER1', N'alo
')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (87, N'USER3', N'USER1', N'alo123')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (88, N'USER1', N'USER3', N'hello user3 toi la user 1')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (89, N'USER3', N'USER1', N'hi usrer1')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (90, N'USER1', N'USER3', N'toi la user1')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (91, N'USER3', N'USER1', N'chao user1')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (92, N'USER1', N'USER3', N'helo demo us1')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (93, N'USER3', N'USER1', N'ok us3')
INSERT [dbo].[Messages] ([ID], [UserSend], [UserReceive], [ContentMessage]) VALUES (94, N'USER3', N'dmoe01', N'ádsfsd')
SET IDENTITY_INSERT [dbo].[Messages] OFF
INSERT [dbo].[Users] ([Email], [MatKhau], [NickName]) VALUES (N'abc@gmail.com', N'123456', N'USER4')
INSERT [dbo].[Users] ([Email], [MatKhau], [NickName]) VALUES (N'leminhquangit@gmail.com', N'123456', N'USER3')
INSERT [dbo].[Users] ([Email], [MatKhau], [NickName]) VALUES (N'leminhquangit1@gmail.com', N'132456', N'Leminhquangne')
INSERT [dbo].[Users] ([Email], [MatKhau], [NickName]) VALUES (N'leminhquangit2@gmail.com', N'123456', N'Leminhquangne1123')
INSERT [dbo].[Users] ([Email], [MatKhau], [NickName]) VALUES (N'leminhquangit4@gmail.com', N'123456', N'Leminhquangne112')
INSERT [dbo].[Users] ([Email], [MatKhau], [NickName]) VALUES (N'lmq123', N'123456', N'USER2')
INSERT [dbo].[Users] ([Email], [MatKhau], [NickName]) VALUES (N'lquang@gmail.com', N'123456', N'USER1')
INSERT [dbo].[Users] ([Email], [MatKhau], [NickName]) VALUES (N'quang', N'123654', N'administrator')
INSERT [dbo].[Users] ([Email], [MatKhau], [NickName]) VALUES (N'quang@gmail.com', N'123', N'USER5')
INSERT [dbo].[Users] ([Email], [MatKhau], [NickName]) VALUES (N'quang123@gmail.com', N'123456', N'abacde')
INSERT [dbo].[Users] ([Email], [MatKhau], [NickName]) VALUES (N'sikaqwe01', N'123456', N'dmoe01')
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_QLUser]    Script Date: 20/01/2021 21:14:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_QLUser] ON [dbo].[Users]
(
	[NickName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MakeFriend]  WITH CHECK ADD  CONSTRAINT [FK_MakeFriend_Users] FOREIGN KEY([User1])
REFERENCES [dbo].[Users] ([NickName])
GO
ALTER TABLE [dbo].[MakeFriend] CHECK CONSTRAINT [FK_MakeFriend_Users]
GO
ALTER TABLE [dbo].[MakeFriend]  WITH CHECK ADD  CONSTRAINT [FK_MakeFriend_Users1] FOREIGN KEY([User2])
REFERENCES [dbo].[Users] ([NickName])
GO
ALTER TABLE [dbo].[MakeFriend] CHECK CONSTRAINT [FK_MakeFriend_Users1]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users] FOREIGN KEY([UserSend])
REFERENCES [dbo].[Users] ([NickName])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users1] FOREIGN KEY([UserReceive])
REFERENCES [dbo].[Users] ([NickName])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users1]
GO
USE [master]
GO
ALTER DATABASE [ChatSpring] SET  READ_WRITE 
GO
