USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[PostReply_Delete]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC PostReply_Delete
    END
GO

CREATE PROCEDURE PostReply_Delete ( @PostReplyId INT )
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
            
        DELETE  FROM [PostReply]
        WHERE   PostReplyId = @PostReplyId        
        
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
        IF ( @return IS NULL
             OR @return = 0
           ) 
            SELECT  @return = @error
        GOTO OK_EXIT    
    END
GO



