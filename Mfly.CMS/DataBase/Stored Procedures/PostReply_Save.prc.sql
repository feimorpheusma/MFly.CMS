USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[PostReply_Save]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [PostReply_Save]
    END
GO

CREATE PROCEDURE [PostReply_Save]
    (
      @PostReplyId INT OUTPUT ,
      @PostId INT ,
      @Content TEXT ,
      @CreatedDate DATETIME ,
      @Status INT ,
      @CreatedByUserId INT 
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

        IF ISNULL(@PostReplyId, 0) = 0 
            BEGIN
                INSERT  INTO [PostReply]
                        ( PostId ,
                          Content ,
                          CreatedDate ,
                          Status ,
                          CreatedByUserId  
                        )
                VALUES  ( @PostId ,
                          @Content ,
                          @CreatedDate ,
                          @Status ,
                          @CreatedByUserId 
                        )
 
                SELECT  @error = @@ERROR ,
                        @count = @@ROWCOUNT ,
                        @PostReplyId = SCOPE_IDENTITY()

                IF @error <> 0 
                    BEGIN
                        GOTO ERR_EXIT
                    END
            END
        ELSE 
            BEGIN                
                UPDATE  [PostReply]
                SET     PostId = @PostId ,
                        Content = @Content ,
                        CreatedDate = @CreatedDate ,
                        Status = @Status ,
                        CreatedByUserId = @CreatedByUserId
                WHERE   PostReplyId = @PostReplyId

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



