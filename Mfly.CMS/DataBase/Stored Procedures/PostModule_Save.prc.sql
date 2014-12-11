USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[PostModule_Save]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [PostModule_Save]
    END
GO

CREATE PROCEDURE [PostModule_Save]
    (
      @PostModuleId INT OUTPUT ,
      @Name NVARCHAR(50) ,
      @Description NVARCHAR(200)
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

        IF ISNULL(@PostModuleId, 0) = 0 
            BEGIN
                INSERT  INTO [PostModule]
                        ( Name, Description )
                VALUES  ( @Name, @Description )
 
                SELECT  @error = @@ERROR ,
                        @count = @@ROWCOUNT ,
                        @PostModuleId = SCOPE_IDENTITY()

                IF @error <> 0 
                    BEGIN
                        GOTO ERR_EXIT
                    END
            END
        ELSE 
            BEGIN                
                UPDATE  [PostModule ]
                SET     Name = @Name ,
                        Description = @Description
                WHERE   PostModuleId = @PostModuleId

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



