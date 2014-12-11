USE CMS
GO

----Ö÷Ìù±í---
IF NOT EXISTS(SELECT 'X' FROM [sys].[OBJECTS] WHERE OBJECT_ID=OBJECT_ID(N'[Post]')  AND OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
BEGIN
    CREATE TABLE [dbo].[Post]
	(
		[PostId] [int] IDENTITY(1,1) NOT NULL,
		[Title] [nvarchar](50) NOT NULL,
		[Content] [text] NOT NULL,
		[Status] [int] NOT NULL,
		[CreatedDate] [datetime] NOT NULL,
		[Views] [int] NULL,
		[CreatedByUserId] [int] NOT NULL,
		[PostModuleId] [int] NOT NULL,
		[OrderStatus] [int] NOT NULL
	)
END

--PRIMARY KEY
IF NOT EXISTS(SELECT 'X' FROM sys.OBJECTS WHERE OBJECT_ID=OBJECT_ID('[PK_Post]') AND TYPE IN ('PK'))
BEGIN
    ALTER TABLE [Post] ADD CONSTRAINT [PK_Post] PRIMARY KEY ([PostId])
END

-----FOREIGN KEY
IF NOT EXISTS(SELECT 'X' FROM SYS.OBJECTS WHERE OBJECT_ID=OBJECT_ID('[FK_Post_CreatedByUserId]') AND TYPE IN ('F') )
BEGIN
    ALTER TABLE [Post] ADD CONSTRAINT [FK_Post_CreatedByUserId] FOREIGN KEY ([CreatedByUserId]) REFERENCES [User]([UserId])
END

IF NOT EXISTS(SELECT 'X' FROM SYS.OBJECTS WHERE OBJECT_ID=OBJECT_ID('[FK_Post_PostModuleId]') AND TYPE IN ('F') )
BEGIN
    ALTER TABLE [Post] ADD CONSTRAINT [FK_Post_PostModuleId] FOREIGN KEY ([PostModuleId]) REFERENCES [PostModule]([PostModuleId])
END
GO 