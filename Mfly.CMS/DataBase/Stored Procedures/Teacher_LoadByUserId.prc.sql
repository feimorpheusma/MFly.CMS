USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[Teacher_LoadByUserId]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [Teacher_LoadByUserId]
    END
GO

CREATE PROCEDURE [Teacher_LoadByUserId] ( @UserId INT )
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
        
        SELECT  TeacherId ,
                RealName ,
                Profile ,
                UserId ,
                PhotoAttachmentId ,
                CONVERT(VARCHAR(40), TargetFileName) + FileExtension AS PhotoAttachmentName
        FROM    [Teacher]
                LEFT JOIN dbo.Attachment ON dbo.[Teacher].PhotoAttachmentId = dbo.Attachment.AttachmentId
        WHERE   UserId = @UserId
        
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


