USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[Article_AttachmentList_Load]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [Article_AttachmentList_Load]
    END
GO

CREATE PROCEDURE [Article_AttachmentList_Load]
(
      @ArticleId INT 
)
AS 
    BEGIN
        SET NOCOUNT ON

        DECLARE @error INT ,
            @return INT
    
        DECLARE @RET_OK INT 

        SELECT  @RET_OK = 0 
    
        SELECT  ArticleAttachmentId ,
                ArticleId ,
                A.AttachmentId ,
                Type,
                Description,
                CONVERT(VARCHAR(40), AT.TargetFileName) + AT.FileExtension AS AttachmentName
        FROM    [Article_Attachment] A
                INNER JOIN dbo.Attachment AT ON A.AttachmentId = AT.AttachmentId
        WHERE   ISNULL(@ArticleId, 0) = 0
                OR A.ArticleId = @ArticleId
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



