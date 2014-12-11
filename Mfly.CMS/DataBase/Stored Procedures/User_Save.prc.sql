USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[User_Save]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [User_Save]
    END
GO

CREATE PROCEDURE [User_Save]
    (
      @UserId INT OUTPUT ,
      @LoginName NVARCHAR(50) ,
      @RealName NVARCHAR(50) ,
      @Password VARCHAR(50) ,
      @PasswordSalt VARCHAR(50) ,
      @Gender INT ,
      @Birthday DATETIME ,
      @QQ VARCHAR(20) ,
      @MSN VARCHAR(50) ,
      @Phone VARCHAR(20) ,
      @Email VARCHAR(50) ,
      @CompanyName NVARCHAR(50) ,
      @Position NVARCHAR(20) ,
      @IsDeleted BIT ,
      @UserType INT ,
      @CreatedDate DATETIME ,
      @PhotoAttachmentId INT ,
      @CompanyProfile TEXT,
      @CompanyTel VARCHAR(20) ,
      @CompanyHomepage VARCHAR(50) ,
      @CompanyEmail VARCHAR(50) ,
      @CompanyIndustry NVARCHAR(50) ,
      @UserStatus INT ,
      @Hobby NVARCHAR(100) ,
      @Signature NVARCHAR(200),
      @IsAudit BIT
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

        IF ISNULL(@UserId, 0) = 0 
            BEGIN
                INSERT  INTO [User]
                        ( LoginName ,
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
                          IsAudit  
                        )
                VALUES  ( @LoginName ,
                          @RealName ,
                          @Password ,
                          @PasswordSalt ,
                          @Gender ,
                          @Birthday ,
                          @QQ ,
                          @MSN ,
                          @Phone ,
                          @Email ,
                          @CompanyName ,
                          @Position ,
                          @IsDeleted ,
                          @UserType ,
                          @CreatedDate ,
                          @PhotoAttachmentId ,
                          @CompanyProfile ,
                          @CompanyTel ,
                          @CompanyHomepage ,
                          @CompanyEmail ,
                          @CompanyIndustry ,
                          @UserStatus ,
                          @Hobby ,
                          @Signature,
                          @IsAudit 
                        )
 
                SELECT  @error = @@ERROR ,
                        @count = @@ROWCOUNT ,
                        @UserId = SCOPE_IDENTITY()

                IF @error <> 0 
                    BEGIN
                        GOTO ERR_EXIT
                    END
            END
        ELSE 
            BEGIN                
                UPDATE  [User ]
                SET     LoginName = @LoginName ,
                        RealName = @RealName ,
                        Password = @Password ,
                        PasswordSalt = @PasswordSalt ,
                        Gender = @Gender ,
                        Birthday = @Birthday ,
                        QQ = @QQ ,
                        MSN = @MSN ,
                        Phone = @Phone ,
                        Email = @Email ,
                        CompanyName = @CompanyName ,
                        Position = @Position ,
                        IsDeleted = @IsDeleted ,
                        UserType = @UserType ,
                        CreatedDate = @CreatedDate ,
                        PhotoAttachmentId = @PhotoAttachmentId ,
                        CompanyProfile = @CompanyProfile ,
                        CompanyTel = @CompanyTel ,
                        CompanyHomepage = @CompanyHomepage ,
                        CompanyEmail = @CompanyEmail ,
                        CompanyIndustry = @CompanyIndustry ,
                        UserStatus = @UserStatus ,
                        Hobby = @Hobby ,
                        Signature = @Signature,
                        IsAudit=@IsAudit
                WHERE   UserId = @UserId

                SELECT  @error = @@ERROR ,
                        @count = @@ROWCOUNT
                IF @error <> 0 
                    BEGIN
                        GOTO ERR_EXIT
                    END
                ELSE 
                    IF @count = 0 
                        BEGIN
                            SELECT  @return = @RET_NOT_FOUND
                            GOTO ERR_EXIT
                        END
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



