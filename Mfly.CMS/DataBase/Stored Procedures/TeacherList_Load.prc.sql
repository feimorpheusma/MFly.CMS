USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[TeacherList_Load]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [TeacherList_Load]
    END
GO

CREATE PROCEDURE [TeacherList_Load]
AS 
    BEGIN
        SET NOCOUNT ON

        DECLARE @error INT ,
            @return INT
    
        DECLARE @RET_OK INT 

        SELECT  @RET_OK = 0 
    
        SELECT  TeacherId ,
                Profile ,
                [Teacher].UserId ,
                [Teacher].PhotoAttachmentId ,
                RealName ,
                CONVERT(VARCHAR(40), TargetFileName) + FileExtension AS PhotoAttachmentName
        FROM    [Teacher]
                LEFT JOIN dbo.Attachment ON dbo.Teacher.PhotoAttachmentId = dbo.Attachment.AttachmentId
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

