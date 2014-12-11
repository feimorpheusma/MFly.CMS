USE CMS
GO

----Ö÷Ìù±í---
IF NOT EXISTS(SELECT 'X' FROM [sys].[OBJECTS] WHERE OBJECT_ID=OBJECT_ID(N'[Post]')  AND OBJECTPROPERTY(object_id, N'IsUserTable') = 1)
BEGIN
   
CREATE TABLE [dbo].[Menu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[ParentMenuId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Level] [int] NULL,
	[Key] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[Page] [nvarchar](50) NULL,
	[URL] [nvarchar](50) NULL,	
	[Visable] [bit] NULL,
	[IsDeleted] [bit] NULL
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
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