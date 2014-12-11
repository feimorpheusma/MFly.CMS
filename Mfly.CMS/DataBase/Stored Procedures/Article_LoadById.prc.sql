USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[Article_LoadById]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [Article_LoadById]
    END
GO

CREATE PROCEDURE [Article_LoadById] ( @ArticleId INT )
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
        
        SELECT  A.ArticleId ,
                A.Title ,
                A.MenuId ,
                A.Content ,
                A.CreatedDate ,
                A.Source ,
                A.Type ,
                A.Views ,
                A.CreatedByUserId ,
                A.Author ,
                Att.AttachmentId ,
                U.RealName ,
                CONVERT(VARCHAR(40), TargetFileName) + FileExtension AS AttachmentName,
                ArticleAttachmentId ,
                M.Name AS MenuName
        FROM    [Article] A
                LEFT JOIN dbo.Article_Attachment ON A.ArticleId = dbo.Article_Attachment.ArticleId
                LEFT JOIN dbo.Attachment Att ON dbo.Article_Attachment.AttachmentId = Att.AttachmentId
                INNER JOIN dbo.[User] U ON A.CreatedByUserId = U.UserId
                INNER JOIN [Menu] M ON M.MenuId = A.MenuId
        WHERE   A.ArticleId = @ArticleId
        
        SELECT  @error = @@ERROR ,
                @count = @@ROWCOUNT
    
        IF @error <> 0 
            BEGIN
                GOTO ERR_EXIT
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
        IF ISNULL(@return, 0) = 0 
            SELECT  @return = @error
        GOTO OK_EXIT           
    END
GO



