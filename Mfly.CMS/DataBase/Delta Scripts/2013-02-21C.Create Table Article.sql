USE CMS
GO

IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('Article')
                        AND OBJECTPROPERTY(OBJECT_ID, 'IsUserTable') = 1 ) 
    BEGIN
        CREATE TABLE Article
            (
              ArticleId INT IDENTITY(1, 1) NOT NULL,
              MenuId INT NOT NULL,
              Title NVARCHAR(100) NOT NULL ,
              Content TEXT NULL ,
              CreatedDate DATETIME NOT NULL ,
              Source NVARCHAR(20) NULL ,
              Type INT NULL ,
              Views INT NULL ,
              CreatedByUserId INT NOT NULL ,
              Author NVARCHAR(50) NULL
            )
    END
 GO
 
 -----primary key
IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('PK_ArticleId')
                        AND TYPE IN ( 'PK' ) ) 
    BEGIN
        ALTER TABLE Article ADD CONSTRAINT [PK_ArticleId] PRIMARY KEY (ArticleId)
    END
 
 -------foreign key
IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('FK_Article_CreatedByUserId')
                        AND TYPE IN ( 'F' ) ) 
    BEGIN
        ALTER TABLE Article ADD CONSTRAINT [FK_Article_CreatedByUserId] FOREIGN KEY(CreatedByUserId) REFERENCES [User](UserId)
    END

 -------foreign key
IF NOT EXISTS ( SELECT  'X'
                FROM    SYS.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('FK_Article_MenuId')
                        AND TYPE IN ( 'F' ) ) 
    BEGIN
        ALTER TABLE Article ADD CONSTRAINT [FK_Article_MenuId] FOREIGN KEY(MenuId) REFERENCES [Menu](MenuId)
    END