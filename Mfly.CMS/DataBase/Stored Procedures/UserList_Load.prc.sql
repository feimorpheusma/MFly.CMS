USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[UserList_Load]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [UserList_Load]
    END
GO

CREATE PROCEDURE [UserList_Load]
AS 
    BEGIN
        SET NOCOUNT ON

        DECLARE @error INT ,
            @return INT
    
        DECLARE @RET_OK INT 

        SELECT  @RET_OK = 0 
    
        SELECT  UserId ,
                LoginName ,
                RealName ,
                Password ,
                PasswordSalt ,
                Gender ,
                Birthday ,
                QQ ,
                MSN ,
                Phone ,
                Email ,
                CompanyName ,
                Position ,
                IsDeleted ,
                UserType ,
                CreatedDate ,
                PhotoAttachmentId ,
                CompanyProfile ,
                CompanyTel ,
                CompanyHomepage ,
                CompanyEmail ,
                CompanyIndustry ,
                UserStatus ,
                Hobby ,
                Signature,
                CONVERT(VARCHAR(40),TargetFileName)+FileExtension AS PhotoAttachmentName,
                IsAudit
        FROM    [User]
        LEFT JOIN dbo.Attachment ON dbo.[User].PhotoAttachmentId = dbo.Attachment.AttachmentId
        WHERE IsDeleted=0
    
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



