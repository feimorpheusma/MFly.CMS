USE CMS
GO

IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('Attachment')
                        AND OBJECTPROPERTY(OBJECT_ID, 'IsUserTable') = 1 ) 
    BEGIN
        CREATE TABLE Attachment
            (
              AttachmentId INT IDENTITY(1, 1) NOT NULL,
              OriginalFileName NVARCHAR(50) NOT NULL ,
              TargetFileName UNIQUEIDENTIFIER NOT NULL ,
              FileExtension VARCHAR(15) NOT NULL ,
              Content VARBINARY(MAX) NOT NULL
            )
    END
 GO
 
 -----primary key
IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('PK_AttachmentId')
                        AND TYPE IN ( 'PK' ) ) 
    BEGIN
        ALTER TABLE Attachment ADD CONSTRAINT [PK_AttachmentId] PRIMARY KEY (AttachmentId)
    END
    GO
    
