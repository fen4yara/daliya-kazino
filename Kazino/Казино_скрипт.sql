USE [kazik1]
GO
/****** Object:  Table [dbo].[Bets]    Script Date: 06.12.2024 20:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bets](
	[BetID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [int] NOT NULL,
	[BetAmount] [decimal](18, 2) NOT NULL,
	[Result] [nvarchar](50) NOT NULL,
	[WinAmount] [int] NULL,
 CONSTRAINT [PK_Bets] PRIMARY KEY CLUSTERED 
(
	[BetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 06.12.2024 20:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[GameName] [nvarchar](max) NOT NULL,
	[Descr] [nvarchar](max) NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameSessions]    Script Date: 06.12.2024 20:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameSessions](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[BetAmount] [decimal](18, 2) NULL,
	[WinAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_GameSessions] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 06.12.2024 20:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ID_Report] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[GameCount] [int] NULL,
	[Wins] [int] NULL,
	[Losses] [int] NULL,
	[AmountResult] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ID_Report] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06.12.2024 20:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 06.12.2024 20:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TransactionType] [nchar](10) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 06.12.2024 20:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[PassHash] [nvarchar](max) NOT NULL,
	[IsBanned] [bit] NOT NULL,
	[RegistrationDate] [date] NOT NULL,
	[Balance] [int] NOT NULL,
	[Telegram] [nvarchar](50) NULL,
	[TelegramChatID] [int] NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([GameID], [GameName], [Descr]) VALUES (1, N'Blackjack', N'Raketka')
INSERT [dbo].[Game] ([GameID], [GameName], [Descr]) VALUES (2, N'Monetka', N'Много денег')
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
SET IDENTITY_INSERT [dbo].[GameSessions] ON 

INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (1, 1, 1, CAST(N'2024-09-21T17:24:15.083' AS DateTime), CAST(111.00 AS Decimal(18, 2)), CAST(172.20 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (2, 1, 1, CAST(N'2024-09-21T17:25:50.410' AS DateTime), CAST(123.00 AS Decimal(18, 2)), CAST(904.40 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (3, 1, 1, CAST(N'2024-09-21T17:26:10.933' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(448.94 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (4, 1, 1, CAST(N'2024-09-21T17:26:56.610' AS DateTime), CAST(182.00 AS Decimal(18, 2)), CAST(49.43 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (5, 1, 1, CAST(N'2024-09-21T17:43:31.570' AS DateTime), CAST(111.00 AS Decimal(18, 2)), CAST(-11.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (6, 1, 1, CAST(N'2024-09-21T17:46:28.760' AS DateTime), CAST(123.00 AS Decimal(18, 2)), CAST(196.80 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (7, 1, 1, CAST(N'2024-09-21T17:46:53.710' AS DateTime), CAST(532.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (8, 1, 1, CAST(N'2024-09-21T17:49:24.733' AS DateTime), CAST(123.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (9, 1, 1, CAST(N'2024-09-21T17:50:27.720' AS DateTime), CAST(12.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (10, 1, 1, CAST(N'2024-09-21T17:52:37.287' AS DateTime), CAST(11.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (11, 1, 1, CAST(N'2024-09-21T19:07:27.707' AS DateTime), CAST(123.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (12, 2, 1, CAST(N'2024-09-21T19:15:13.227' AS DateTime), CAST(1000.00 AS Decimal(18, 2)), CAST(1530.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (13, 2, 1, CAST(N'2024-09-21T19:15:26.223' AS DateTime), CAST(10.00 AS Decimal(18, 2)), CAST(-10.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (16, 8, 2, CAST(N'2024-10-11T09:32:25.320' AS DateTime), CAST(300.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (17, 8, 2, CAST(N'2024-10-11T09:32:29.247' AS DateTime), CAST(300.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (18, 8, 2, CAST(N'2024-10-11T09:34:16.183' AS DateTime), CAST(3.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (19, 8, 2, CAST(N'2024-10-11T09:34:17.077' AS DateTime), CAST(3.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (20, 8, 2, CAST(N'2024-10-11T09:34:17.757' AS DateTime), CAST(3.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (21, 8, 2, CAST(N'2024-10-11T09:34:18.573' AS DateTime), CAST(3.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (22, 8, 2, CAST(N'2024-10-11T09:34:19.263' AS DateTime), CAST(3.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (23, 8, 2, CAST(N'2024-10-11T09:34:22.527' AS DateTime), CAST(3.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (24, 8, 2, CAST(N'2024-10-11T09:34:23.280' AS DateTime), CAST(3.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (25, 8, 2, CAST(N'2024-10-11T10:29:37.713' AS DateTime), CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (26, 8, 2, CAST(N'2024-10-11T10:29:38.990' AS DateTime), CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (27, 8, 2, CAST(N'2024-10-11T10:29:40.087' AS DateTime), CAST(500.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (28, 8, 2, CAST(N'2024-10-11T10:29:41.040' AS DateTime), CAST(500.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[GameSessions] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (1, 1, N'Пополнение', CAST(1111.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:23:03.617' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (2, 1, N'Выигрыш   ', CAST(172.20 AS Decimal(18, 2)), CAST(N'2024-09-21T17:25:51.093' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (3, 1, N'Ставка    ', CAST(-182.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:27:09.117' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (4, 1, N'Ставка    ', CAST(-111.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:43:43.763' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (5, 1, N'Ставка    ', CAST(-123.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:46:39.727' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (6, 1, N'Выигрыш   ', CAST(904.40 AS Decimal(18, 2)), CAST(N'2024-09-21T17:46:54.947' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (7, 1, N'Выигрыш   ', CAST(448.94 AS Decimal(18, 2)), CAST(N'2024-09-21T17:49:29.320' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (8, 1, N'Выигрыш   ', CAST(49.43 AS Decimal(18, 2)), CAST(N'2024-09-21T17:50:38.750' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (9, 1, N'Ставка    ', CAST(-11.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:52:44.347' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (10, 1, N'Вывод     ', CAST(3333.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:54:48.520' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (11, 1, N'Пополнение', CAST(1231231.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:59:13.680' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (12, 1, N'Выигрыш   ', CAST(196.80 AS Decimal(18, 2)), CAST(N'2024-09-21T19:07:29.997' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (13, 2, N'Пополнение', CAST(123111.00 AS Decimal(18, 2)), CAST(N'2024-09-21T19:14:48.400' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (14, 2, N'Вывод     ', CAST(123.00 AS Decimal(18, 2)), CAST(N'2024-09-21T19:15:02.730' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (15, 2, N'Выигрыш   ', CAST(1530.00 AS Decimal(18, 2)), CAST(N'2024-09-21T19:15:15.300' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (16, 2, N'Ставка    ', CAST(-10.00 AS Decimal(18, 2)), CAST(N'2024-09-21T19:15:35.493' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (17, 7, N'Пополнение', CAST(78.00 AS Decimal(18, 2)), CAST(N'2024-10-11T02:46:43.020' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (18, 8, N'Пополнение', CAST(50000.00 AS Decimal(18, 2)), CAST(N'2024-10-11T09:22:38.857' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (19, 8, N'Вывод     ', CAST(50000.00 AS Decimal(18, 2)), CAST(N'2024-10-11T09:22:41.747' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (20, 8, N'Пополнение', CAST(5000.00 AS Decimal(18, 2)), CAST(N'2024-10-11T09:26:31.430' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (21, 8, N'Пополнение', CAST(400.00 AS Decimal(18, 2)), CAST(N'2024-10-11T10:29:02.723' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (0, N'Wario', N'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 0, CAST(N'2024-09-20' AS Date), 11357, N'adm', NULL, NULL)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (1, N'Feta', N'qVvBZjGuK2+ttFXuAY2grcJwPlbYnj7tB0zlbS97G2o=', 0, CAST(N'2024-09-21' AS Date), 1229217, N'fen4yara', 572341363, NULL)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (2, N'Arseniy', N'SJzV28cIx+VB3k182Rzm0PFhNXO3/FtA05Qsy5VVzzU=', 0, CAST(N'2024-09-21' AS Date), 123498, N'Frolovsenya', 589993860, NULL)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (3, N'Alice', N'a4ayc/80/OGda4BO/1o/V0etpOqiLx1JwB5S3beHW0s=', 0, CAST(N'2024-10-11' AS Date), -5, NULL, NULL, 1)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (6, N'flower', N'flower', 0, CAST(N'2024-11-10' AS Date), 0, NULL, NULL, 1)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (7, N'Cool men', N'1HNeOiZeFu7gP1lxi5tdAwGcB9i2xR+Q2jpmbuwTqzU=', 0, CAST(N'2024-10-11' AS Date), 78, NULL, NULL, 2)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [Telegram], [TelegramChatID], [RoleID]) VALUES (8, N'Daliya', N'a4ayc/80/OGda4BO/1o/V0etpOqiLx1JwB5S3beHW0s=', 0, CAST(N'2024-10-11' AS Date), 1991, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Balance]  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[Bets]  WITH CHECK ADD  CONSTRAINT [FK_Bets_GameSessions] FOREIGN KEY([SessionID])
REFERENCES [dbo].[GameSessions] ([SessionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bets] CHECK CONSTRAINT [FK_Bets_GameSessions]
GO
ALTER TABLE [dbo].[GameSessions]  WITH CHECK ADD  CONSTRAINT [FK_GameSessions_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GameSessions] CHECK CONSTRAINT [FK_GameSessions_Game]
GO
ALTER TABLE [dbo].[GameSessions]  WITH CHECK ADD  CONSTRAINT [FK_GameSessions_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GameSessions] CHECK CONSTRAINT [FK_GameSessions_User]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_User]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
