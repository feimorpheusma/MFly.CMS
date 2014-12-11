USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[ArticleList_Load]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [ArticleList_Load]
    END
GO

CREATE PROCEDURE [ArticleList_Load] ( @MenuId INT )
AS 
    BEGIN
        SET NOCOUNT ON

        DECLARE @error INT ,
            @return INT
    
        DECLARE @RET_OK INT 

        SELECT  @RET_OK = 0 
    
        SELECT  A.ArticleId ,
                A.Title ,
                A.MenuId,
                A.Content ,
                A.CreatedDate ,
                A.Source ,
                A.Type ,
                A.Views ,
                A.CreatedByUserId ,
                A.Author ,
                AT.AttachmentId ,
                Article_Attachment.TYPE AS AttachmentType,
                CONVERT(VARCHAR(40), AT.TargetFileName) + AT.FileExtension AS AttachmentName,
                createUser.RealName,
                M.Name AS MenuName
        FROM    [Article] A
                LEFT JOIN dbo.Article_Attachment  ON A.ArticleId = dbo.Article_Attachment.ArticleId AND Article_Attachment.Type=1
                LEFT JOIN dbo.Attachment AT ON dbo.Article_Attachment.AttachmentId = AT.AttachmentId
                LEFT JOIN dbo.[User] createUser ON createUser.UserId=A.CreatedByUserId
                INNER JOIN [Menu] M ON M.MenuId = A.MenuId
        WHERE   ISNULL(@MenuId, 0) = 0
                OR A.MenuId = @MenuId
        ORDER BY CreatedDate DESC
    
        SELECT  @error = @@ERROR
    
        IF @error <> 0 
            BEGIN
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



