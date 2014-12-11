USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[Post_Save]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [Post_Save]
    END
GO

CREATE PROCEDURE [Post_Save]
    (
      @PostId INT OUTPUT ,
      @Title NVARCHAR(50) ,
      @Content TEXT ,
      @Status INT ,
      @CreatedDate DATETIME ,
      @Views INT ,
      @CreatedByUserId INT ,
      @PostModuleId INT ,
      @OrderStatus INT 
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

        IF ISNULL(@PostId, 0) = 0 
            BEGIN
                INSERT  INTO [Post]
                        ( Title ,
                          Content ,
                          Status ,
                          CreatedDate ,
                          Views ,
                          CreatedByUserId ,
                          PostModuleId ,
                          OrderStatus  
                        )
                VALUES  ( @Title ,
                          @Content ,
                          @Status ,
                          @CreatedDate ,
                          @Views ,
                          @CreatedByUserId ,
                          @PostModuleId ,
                          @OrderStatus 
                        )
 
                SELECT  @error = @@ERROR ,
                        @count = @@ROWCOUNT ,
                        @PostId = SCOPE_IDENTITY()

                IF @error <> 0 
                    BEGIN
                        GOTO ERR_EXIT
                    END
            END
        ELSE 
            BEGIN                
                UPDATE  [Post]
                SET     Title = @Title ,
                        Content = @Content ,
                        Status = @Status ,
                        CreatedDate = @CreatedDate ,
                        Views = @Views ,
                        CreatedByUserId = @CreatedByUserId ,
                        PostModuleId = @PostModuleId ,
                        OrderStatus = @OrderStatus
                WHERE   PostId = @PostId

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



