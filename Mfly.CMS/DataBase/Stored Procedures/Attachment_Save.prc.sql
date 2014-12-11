USE [CMS]
GO

IF EXISTS ( SELECT  'X'
            FROM    SYS.SYSOBJECTS
            WHERE   ID = OBJECT_ID('Attachment_Save')
                    AND OBJECTPROPERTY(ID, 'IsProcedure') = 1 ) 
    DROP PROCEDURE [Attachment_Save]
GO

CREATE PROCEDURE [Attachment_Save]
    (
      @AttachmentId INT OUTPUT ,
      @OriginalFileName NVARCHAR(50) ,
      @FileExtension VARCHAR(15) ,
      @Content VARBINARY(MAX)
    )
AS 
    BEGIN
        SET NOCOUNT ON
  -----Declare Variables
        DECLARE @Count INT ,
            @Error INT ,
            @return INT
    -----Declare Return Value
        DECLARE @RET_OK INT ,
            @RET_NOT_FOUND INT
        SELECT  @RET_OK = 0 ,
                @RET_NOT_FOUND = -1
    
        IF @AttachmentId <> 0 
            BEGIN
                UPDATE  [Attachment]
                SET     [OriginalFileName] = @OriginalFileName ,
                        [FileExtension] = @FileExtension ,
                        [TargetFileName] = NEWID() ,
                        [Content] = @Content
                WHERE   AttachmentId = @AttachmentId
    
                SELECT  @Error = @@ERROR ,
                        @Count = @@ROWCOUNT
         
                IF @Error <> 0 
                    GOTO ERR_EXIT
                ELSE 
                    IF @Count = 0 
                        BEGIN
                            SELECT  @Return = @RET_NOT_FOUND
                            GOTO ERR_EXIT
                        END
    
            END
        ELSE 
            BEGIN
                INSERT  INTO [dbo].[Attachment]
                        ( [Content] ,
                          [OriginalFileName] ,
                          [TargetFileName] ,
                          [FileExtension]
                        )
                VALUES  ( @Content ,
                          @OriginalFileName ,
                          NEWID() ,
                          @FileExtension  
                        )
                SELECT  @Error = @@ERROR ,
                        @Count = @@ROWCOUNT ,
                        @AttachmentId = SCOPE_IDENTITY()
            
                IF @Error <> 0 
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
