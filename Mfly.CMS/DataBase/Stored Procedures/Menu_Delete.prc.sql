USE [CMS]
GO
IF EXISTS ( SELECT  'X' FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Menu_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
    BEGIN
        DROP PROC Menu_Delete
    END
GO

CREATE PROCEDURE Menu_Delete
    (@MenuId int)       
AS 
    BEGIN
        SET NOCOUNT ON

        DECLARE 
            @count int,
            @error int,
            @return int

        DECLARE
            @RET_OK int,
            @RET_NOT_FOUND int

        SELECT 
            @RET_OK = 0,
            @RET_NOT_FOUND = -1
            
        DELETE FROM [Menu]
        WHERE MenuId = @MenuId        
        
        SELECT @error = @@ERROR,
               @count = @@ROWCOUNT
        
        IF @error <> 0
        BEGIN
            GOTO ERR_EXIT
        END

        IF @count = 0
        BEGIN
            SELECT @return = @RET_NOT_FOUND
            GOTO ERR_EXIT
        END

        OK_EXIT: 
            IF @return IS NULL 
			SELECT @return = @RET_OK
            SET NOCOUNT OFF
            RETURN @return
        ERR_EXIT:
            IF (@return IS NULL OR @return = 0) 
            SELECT @return = @error
            GOTO OK_EXIT    
    END
GO



