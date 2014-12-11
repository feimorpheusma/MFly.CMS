USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[Article_Attachment_LoadById]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [Article_Attachment_LoadById]
    END
GO

CREATE PROCEDURE [Article_Attachment_LoadById]
    (
      @ArticleAttachmentId INT
    )
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
        
        
        SELECT  ArticleAttachmentId ,
                ArticleId ,
                A.AttachmentId ,
                Type,
                Description,
                CONVERT(VARCHAR(40), AT.TargetFileName) + AT.FileExtension AS AttachmentName
        FROM    [Article_Attachment] A
                INNER JOIN dbo.Attachment AT ON A.AttachmentId = AT.AttachmentId
        WHERE   ArticleAttachmentId = @ArticleAttachmentId
        
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



