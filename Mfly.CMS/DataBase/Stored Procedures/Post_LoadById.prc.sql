USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[Post_LoadById]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [Post_LoadById]
    END
GO

CREATE PROCEDURE [Post_LoadById] ( @PostId INT )
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
        
        SELECT  A.PostId ,
                A.Title ,
                A.Content ,
                A.Status ,
                A.CreatedDate ,
                A.Views ,
                A.CreatedByUserId ,
                A.PostModuleId ,
                A.OrderStatus,
                B.UserId,
                B.LoginName,
                B.RealName,
                B.PhotoAttachmentId,
                CONVERT(VARCHAR(40), C.TargetFileName) + C.FileExtension AS PhotoAttachmentName,
                D.Name AS PostModuleName
        FROM    [Post] AS A 
        LEFT JOIN [User] AS B ON
        A.CreatedByUserId = B.UserId
        LEFT JOIN [Attachment] AS C ON
        B.PhotoAttachmentId = C.AttachmentId
        LEFT JOIN [PostModule] AS D ON
        D.PostModuleId = A.PostModuleId
        WHERE   PostId = @PostId
        
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



