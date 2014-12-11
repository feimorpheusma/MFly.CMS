USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[Post_Attachment_Save]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [Post_Attachment_Save]
    END
GO

CREATE PROCEDURE [Post_Attachment_Save]
    (
      @PostAttachmentId INT OUTPUT ,
      @PostId INT ,
      @AttachmentId INT ,
      @Type INT 
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

        IF ISNULL(@PostAttachmentId, 0) = 0 
            BEGIN
                INSERT  INTO [Post_Attachment]
                        ( PostId, AttachmentId, Type )
                VALUES  ( @PostId, @AttachmentId, @Type )
 
                SELECT  @error = @@ERROR ,
                        @count = @@ROWCOUNT ,
                        @PostAttachmentId = SCOPE_IDENTITY()

                IF @error <> 0 
                    BEGIN
                        GOTO ERR_EXIT
                    END
            END
        ELSE 
            BEGIN                
                UPDATE  [Post_Attachment ]
                SET     PostId = @PostId ,
                        AttachmentId = @AttachmentId ,
                        Type = @Type
                WHERE   PostAttachmentId = @PostAttachmentId

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



