USE CMS
GO

IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('Article_Attachment')
                        AND OBJECTPROPERTY(OBJECT_ID, 'IsUserTable') = 1 ) 
    BEGIN
        CREATE TABLE Article_Attachment
            (
              ArticleAttachmentId INT IDENTITY(1, 1) NOT NULL,
              ArticleId INT  NULL ,
              AttachmentId INT NOT NULL ,
              Type INT NULL,
              Descripton NVARCHAR(50)
            )
    END
 GO
 
 -----primary key
IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('PK_ArticleAttachmentId')
                        AND TYPE IN ( 'PK' ) ) 
    BEGIN
        ALTER TABLE Article_Attachment ADD CONSTRAINT [PK_ArticleAttachmentId] PRIMARY KEY (ArticleAttachmentId)
    END
   
-----FOREIGN KEY
IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('FK_Article_Attachment_ArticleId')
                        AND TYPE IN ( 'F' ) ) 
    BEGIN
        ALTER TABLE Article_Attachment ADD CONSTRAINT [FK_Article_Attachment_ArticleId] FOREIGN KEY (ArticleId) REFERENCES [Article](ArticleId)
    END

IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('FK_Article_Attachment_AttachmentId')
                        AND TYPE IN ( 'F' ) ) 
    BEGIN
        ALTER TABLE Article_Attachment ADD CONSTRAINT [FK_Article_Attachment_AttachmentId] FOREIGN KEY (AttachmentId) REFERENCES [Attachment](AttachmentId)
    END
GO 
    
