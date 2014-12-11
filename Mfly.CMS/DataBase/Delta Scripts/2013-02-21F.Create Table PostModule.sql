USE CMS
GO

----Ìû×ÓÄ£¿é±í---
IF NOT EXISTS ( SELECT  'X'
                FROM    [sys].[OBJECTS]
                WHERE   OBJECT_ID = OBJECT_ID(N'[PostModule]')
                        AND OBJECTPROPERTY(object_id, N'IsUserTable') = 1 ) 
    BEGIN
     
        CREATE TABLE [dbo].[PostModule]
            (
              [PostModuleId] [int] IDENTITY(1, 1)
                                   NOT NULL ,
              [Name] [nvarchar](50) NOT NULL ,
              [Description] [nvarchar](200) NULL ,
              [IsDeleted] BIT NOT NULL
                              DEFAULT ( 0 )
            )
    END

--PRIMARY KEY
IF NOT EXISTS ( SELECT  'X'
                FROM    sys.OBJECTS
                WHERE   OBJECT_ID = OBJECT_ID('[PK_PostModule]')
                        AND TYPE IN ( 'PK' ) ) 
    BEGIN
        ALTER TABLE [PostModule] ADD CONSTRAINT [PK_PostModule] PRIMARY KEY ([PostModuleId])
    END