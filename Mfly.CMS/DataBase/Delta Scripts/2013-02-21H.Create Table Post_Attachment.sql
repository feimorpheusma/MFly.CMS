USE CMS
GO

----Ìû×Ó¸½¼þ±í---
IF NOT EXISTS(SELECT 'X' FROM [sys].[OBJECTS] WHERE OBJECT_ID=OBJECT_ID(N'[Post_Attachment]')  AND OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
BEGIN
    CREATE TABLE [dbo].[Post_Attachment]
	(
		[PostAttachmentId] [int] IDENTITY(1,1) NOT NULL,
		[PostId] [int] NOT NULL,
		[AttachmentId] [int] NOT NULL,
		[Type] [int] NOT NULL
	)
END

--PRIMARY KEY
IF NOT EXISTS(SELECT 'X' FROM sys.OBJECTS WHERE OBJECT_ID=OBJECT_ID('[PK_Post_Attachment]') AND TYPE IN ('PK'))
BEGIN
    ALTER TABLE [Post_Attachment] ADD CONSTRAINT [PK_Post_Attachment] PRIMARY KEY ([PostAttachmentId])
END

-----FOREIGN KEY
IF NOT EXISTS(SELECT 'X' FROM SYS.OBJECTS WHERE OBJECT_ID=OBJECT_ID('[FK_Post_Attachment_PostId]') AND TYPE IN ('F') )
BEGIN
    ALTER TABLE [Post_Attachment] ADD CONSTRAINT [FK_Post_Attachment_PostId] FOREIGN KEY ([PostId]) REFERENCES [Post]([PostId])
END

IF NOT EXISTS(SELECT 'X' FROM SYS.OBJECTS WHERE OBJECT_ID=OBJECT_ID('[FK_Post_Attachment_AttachmentId]') AND TYPE IN ('F') )
BEGIN
    ALTER TABLE [Post_Attachment] ADD CONSTRAINT [FK_Post_Attachment_AttachmentId] FOREIGN KEY ([AttachmentId]) REFERENCES [Attachment]([AttachmentId])
END
GO 