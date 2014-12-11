USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[UserList_LoadWithPage]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [UserList_LoadWithPage]
    END
GO

CREATE PROCEDURE [UserList_LoadWithPage]
    (
      @StartIndex INT ,
      @PageSize INT ,
      @LoginName NVARCHAR(50),
      @RealName NVARCHAR(50),
      @UserStatus INT,
      @IsAudit BIT,
      @SumCount INT OUTPUT
    )
AS 
    BEGIN	
        SET NOCOUNT ON
	
        DECLARE @error INT ,
            @return INT
    
        DECLARE @RET_OK INT
    
        SELECT  @RET_OK = 0 ;
        WITH    SEPARATE
                  AS ( SELECT   ROW_NUMBER() OVER ( ORDER BY UserId DESC ) AS ID ,
                                UserId ,
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
                                IsAudit
                       FROM     [User]
                       WHERE (ISNULL(@LoginName ,'')='' OR LoginName like  '%'+@LoginName+'%' )
							  AND (ISNULL(@UserStatus,0)=0 OR UserStatus=@UserStatus)
							  AND (ISNULL(@RealName,'')='' OR RealName like '%'+@RealName+'%' )
							  AND IsDeleted=0
							  AND IsAudit=@IsAudit
                     )
            SELECT  *
            INTO    #tmp
            FROM    SEPARATE  
            
        SELECT  @sumCount = COUNT(*)
        FROM    #tmp
        
        SELECT  *
        FROM    #tmp
        WHERE   ID BETWEEN ( @startIndex + 1 )
                   AND     ( @pageSize + @startIndex )			
		
        
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



