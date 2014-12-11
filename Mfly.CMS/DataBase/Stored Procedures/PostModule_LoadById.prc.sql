USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[PostModule_LoadById]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [PostModule_LoadById]
    END
GO

CREATE PROCEDURE [PostModule_LoadById] ( @PostModuleId INT )
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
        
        SELECT  PostModuleId ,
                Name ,
                Description
        FROM    [PostModule]
        WHERE   PostModuleId = @PostModuleId AND IsDeleted = 0
        
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



