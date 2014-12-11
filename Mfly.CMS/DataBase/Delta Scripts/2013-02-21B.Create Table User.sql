USE [CMS]
GO

----创建用户表---
IF NOT EXISTS ( SELECT  'X'
                FROM    [sys].[OBJECTS]
                WHERE   OBJECT_ID = OBJECT_ID(N'[User]')
                        AND OBJECTPROPERTY(object_id, N'IsUserTable') = 1 ) 
    BEGIN
        CREATE TABLE [User]
            (
              UserId INT IDENTITY(1, 1) ,
              LoginName NVARCHAR(50) NOT NULL ,
              RealName NVARCHAR(50) NULL ,
              Password VARCHAR(50) NOT NULL ,
              PasswordSalt VARCHAR(50) NOT NULL ,
              Gender INT NULL ,
              Birthday DATETIME NULL ,
              QQ VARCHAR(20) NULL ,
              MSN VARCHAR(50) NULL ,
              Phone VARCHAR(20) NULL ,
              Email VARCHAR(50) NULL ,
              CompanyName NVARCHAR(50) NULL ,
              Position NVARCHAR(20) NULL ,
              IsDeleted BIT NOT NULL ,
              UserType INT NOT NULL ,
              CreatedDate DATETIME NOT NULL ,
              PhotoAttachmentId INT NULL ,
              CompanyProfile TEXT NULL ,
              CompanyTel VARCHAR(20) NULL ,
              CompanyHomepage VARCHAR(50) NULL ,
              CompanyEmail VARCHAR(50) NULL ,
              CompanyIndustry NVARCHAR(50) NULL ,
              UserStatus INT NOT NULL ,
              Hobby NVARCHAR(100) NULL ,
              Signature NVARCHAR(200) NULL
            )
    END

--PRIMARY KEY
IF NOT EXISTS ( SELECT  'X'
                FROM    sys.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('PK_UserId')
                        AND TYPE IN ( 'PK' ) ) 
    BEGIN
        ALTER TABLE [User] ADD CONSTRAINT [PK_UserId] PRIMARY KEY (UserId)
    END

-----FOREIGN KEY
IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('FK_User_Attachment_PhotoAttachmentId')
                        AND TYPE IN ( 'F' ) ) 
    BEGIN
        ALTER TABLE [User] ADD CONSTRAINT [FK_User_Attachment_PhotoAttachmentId] FOREIGN KEY ([PhotoAttachmentId]) REFERENCES [Attachment](AttachmentId)
    END
GO 