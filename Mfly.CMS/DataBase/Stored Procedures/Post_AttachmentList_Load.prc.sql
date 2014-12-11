USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[Post_AttachmentList_Load]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [Post_AttachmentList_Load]
    END
GO

CREATE PROCEDURE [Post_AttachmentList_Load]
AS 
    BEGIN
        SET NOCOUNT ON

        DECLARE @error INT ,
            @return INT
    
        DECLARE @RET_OK INT 

        SELECT  @RET_OK = 0 
    
        SELECT  PostAttachmentId ,
                PostId ,
                AttachmentId ,
                Type
        FROM    [Post_Attachment]
    
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



