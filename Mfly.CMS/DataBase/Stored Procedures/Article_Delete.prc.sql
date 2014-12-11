USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[Article_Delete]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC Article_Delete
    END
GO

CREATE PROCEDURE Article_Delete ( @ArticleId INT )
AS 
    BEGIN
        SET NOCOUNT ON

        DECLARE @count INT ,
            @error INT ,
            @return INT

        DECLARE @RET_OK INT ,
            @RET_NOT_FOUND INT

        SELECT  @RET_OK = 0 ,
                @RET_NOT_FOUND = -1
        DECLARE @AttachmentId INT
        
        BEGIN TRAN
        SELECT  @AttachmentId = AttachmentId
        FROM    dbo.Article_Attachment
        WHERE   ArticleId = @ArticleId
        
        DELETE  FROM dbo.Article_Attachment
        WHERE   ArticleId = @ArticleId
                AND AttachmentId = @AttachmentId
        
        IF ( @AttachmentId <> 0 ) 
            BEGIN
                DELETE  FROM dbo.Attachment
                WHERE   AttachmentId = @AttachmentId 
            END
        
        DELETE  FROM [Article]
        WHERE   ArticleId = @ArticleId        
        
        SELECT  @error = @@ERROR ,
                @count = @@ROWCOUNT
        
        IF @error <> 0 
            BEGIN
                ROLLBACK
                GOTO ERR_EXIT
            END
        ELSE 
            BEGIN
                COMMIT
            END

        IF @count = 0 
            BEGIN
                SELECT  @return = @RET_NOT_FOUND
                GOTO ERR_EXIT
            END

        OK_EXIT: 
        IF @return IS NULL 
            SELECT  @return = @RET_OK
        SET NOCOUNT OFF
        RETURN @return
        ERR_EXIT:
        IF ( @return IS NULL
             OR @return = 0
           ) 
            SELECT  @return = @error
        GOTO OK_EXIT    
    END
GO



