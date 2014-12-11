USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[Teacher_Save]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [Teacher_Save]
    END
GO

CREATE PROCEDURE [Teacher_Save]
    (
      @TeacherId INT OUTPUT ,
      @RealName NVARCHAR(50) ,
      @Profile NVARCHAR(500) ,
      @PhotoAttachmentId INT 
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

        IF ISNULL(@TeacherId, 0) = 0 
            BEGIN
                INSERT  INTO [Teacher]
                        ( RealName ,
                          Profile ,
                          PhotoAttachmentId  
                        )
                VALUES  ( @RealName ,
                          @Profile ,
                          @PhotoAttachmentId 
                        )
 
                SELECT  @error = @@ERROR ,
                        @count = @@ROWCOUNT ,
                        @TeacherId = SCOPE_IDENTITY()

                IF @error <> 0 
                    BEGIN
                        GOTO ERR_EXIT
                    END
            END
        ELSE 
            BEGIN                
                UPDATE  [Teacher ]
                SET     RealName = @RealName ,
                        Profile = @Profile ,
                        PhotoAttachmentId = @PhotoAttachmentId
                WHERE   TeacherId = @TeacherId

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



