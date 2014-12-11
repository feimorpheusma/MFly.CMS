USE CMS
GO

----Ìû×ÓÆÀÂÛ±í---
IF NOT EXISTS(SELECT 'X' FROM [sys].[OBJECTS] WHERE OBJECT_ID=OBJECT_ID(N'[PostReply]')  AND OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
BEGIN
    CREATE TABLE [dbo].[PostReply]
	(
		[PostReplyId] [int] IDENTITY(1,1) NOT NULL,
		[PostId] [int] NOT NULL,
		[Content] [text] NOT NULL,
		[CreatedDate] [datetime] NOT NULL,
		[Status] [int] NOT NULL,
		[CreatedByUserId] [int] NOT NULL
	)
END

--PRIMARY KEY
IF NOT EXISTS(SELECT 'X' FROM sys.OBJECTS WHERE OBJECT_ID=OBJECT_ID('[PK_PostReply]') AND TYPE IN ('PK'))
BEGIN
    ALTER TABLE [PostReply] ADD CONSTRAINT [PK_PostReply] PRIMARY KEY ([PostReplyId])
END

-----FOREIGN KEY
IF NOT EXISTS(SELECT 'X' FROM SYS.OBJECTS WHERE OBJECT_ID=OBJECT_ID('[FK_PostReply_PostId]') AND TYPE IN ('F') )
BEGIN
    ALTER TABLE [PostReply] ADD CONSTRAINT [FK_PostReply_PostId] FOREIGN KEY ([PostId]) REFERENCES [Post]([PostId])
END

IF NOT EXISTS(SELECT 'X' FROM SYS.OBJECTS WHERE OBJECT_ID=OBJECT_ID('[FK_PostReply_CreatedByUserId]') AND TYPE IN ('F') )
BEGIN
    ALTER TABLE [PostReply] ADD CONSTRAINT [FK_PostReply_CreatedByUserId] FOREIGN KEY ([CreatedByUserId]) REFERENCES [User]([UserId])
END
GO 