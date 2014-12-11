USE [CMS]
GO

----创建讲师表---
IF NOT EXISTS ( SELECT  'X'
                FROM    [sys].[OBJECTS]
                WHERE   OBJECT_ID = OBJECT_ID(N'[Teacher]')
                        AND OBJECTPROPERTY(object_id, N'IsUserTable') = 1 ) 
    BEGIN
        CREATE TABLE [Teacher]
            (
              TeacherId INT IDENTITY(1, 1) ,
              RealName NVARCHAR(50) NULL ,
              Profile NVARCHAR(500) NULL ,
              UserId INT NULL ,
              PhotoAttachmentId INT NULL
            )
    END

--PRIMARY KEY
IF NOT EXISTS ( SELECT  'X'
                FROM    sys.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('PK_TeacherId')
                        AND TYPE IN ( 'PK' ) ) 
    BEGIN
        ALTER TABLE [Teacher] ADD CONSTRAINT [PK_TeacherId] PRIMARY KEY (TeacherId)
    END

-----FOREIGN KEY
IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('FK_Teacher_User_UserId')
                        AND TYPE IN ( 'F' ) ) 
    BEGIN
        ALTER TABLE [Teacher] ADD CONSTRAINT [FK_Teacher_User_UserId] FOREIGN KEY (UserId) REFERENCES [User](UserId)
    END

IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('FK_Teacher_Attachment_PhotoAttachmentId')
                        AND TYPE IN ( 'F' ) ) 
    BEGIN
        ALTER TABLE [Teacher] ADD CONSTRAINT [FK_Teacher_Attachment_PhotoAttachmentId] FOREIGN KEY ([PhotoAttachmentId]) REFERENCES [Attachment](AttachmentId)
    END
GO 