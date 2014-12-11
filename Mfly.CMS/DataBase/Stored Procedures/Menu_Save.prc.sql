USE [CMS]
GO
IF EXISTS ( SELECT  'X' FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Menu_Save]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROC [Menu_Save]
END
GO

CREATE PROCEDURE [Menu_Save]
(
    @MenuId int OUTPUT,
    @ParentMenuId int ,    
    @Name nvarchar(50) ,    
    @Level int ,    
    @Key nvarchar(50) ,    
    @Type int ,    
    @Page nvarchar(50) ,    
    @URL nvarchar(50) ,    
    @Visable bit ,    
    @IsDeleted bit 
)
AS 
    BEGIN
        SET NOCOUNT ON
        
        DECLARE  @count INT,
                 @error INT,
                 @return INT

        DECLARE @RET_OK INT,
                @RET_NOT_FOUND INT

        SELECT @RET_OK = 0, 
               @RET_NOT_FOUND = -1

        IF ISNULL(@MenuId,0) = 0 
            BEGIN
                INSERT INTO [Menu] 
                (
                    ParentMenuId, 
                    Name, 
                    Level, 
                    [Key], 
                    Type, 
                    Page, 
                    URL, 
                    Visable, 
                    IsDeleted  
                )
                VALUES
                (
                    @ParentMenuId, 
                    @Name, 
                    @Level, 
                    @Key, 
                    @Type, 
                    @Page, 
                    @URL, 
                    @Visable, 
                    @IsDeleted 
                )
 
                SELECT @error = @@ERROR, 
                       @count = @@ROWCOUNT, 
                       @MenuId = SCOPE_IDENTITY()

                IF @error <> 0
                BEGIN
                    GOTO ERR_EXIT
                END
            END
        ELSE 
            BEGIN                
                UPDATE [Menu ]
                SET
                    ParentMenuId = @ParentMenuId, 
                    Name = @Name, 
                    Level = @Level, 
                    [Key] = @Key, 
                    Type = @Type, 
                    Page = @Page, 
                    URL = @URL, 
                    Visable = @Visable, 
                    IsDeleted = @IsDeleted 
                WHERE MenuId = @MenuId

                SELECT @error = @@ERROR, @count = @@ROWCOUNT
                IF @error <> 0
                BEGIN
                    GOTO ERR_EXIT
                END
                ELSE IF @count = 0
                BEGIN
                    SELECT @return = @RET_NOT_FOUND
                    GOTO ERR_EXIT
                END
            END
               
        OK_EXIT: 
            IF @return IS NULL 
            SELECT  @return = @RET_OK
            SET NOCOUNT OFF
            RETURN @return
        ERR_EXIT:
            IF ( @return IS NULL OR @return = 0 ) 
            SELECT  @return = @error
            GOTO OK_EXIT
    END
GO



