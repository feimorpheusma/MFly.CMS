USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[Article_Save]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [Article_Save]
    END
GO

CREATE PROCEDURE [Article_Save]
    (
      @ArticleId INT OUTPUT ,
      @MenuId INT ,
      @Title NVARCHAR(100) ,
      @Content TEXT ,
      @CreatedDate DATETIME ,
      @Source NVARCHAR(20) ,
      @Type INT ,
      @Views INT ,
      @CreatedByUserId INT ,
      @Author CHAR(18)
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

        IF ISNULL(@ArticleId, 0) = 0 
            BEGIN
                INSERT  INTO [Article]
                        ( Title ,
                          MenuId ,
                          Content ,
                          CreatedDate ,
                          Source ,
                          Type ,
                          Views ,
                          CreatedByUserId ,
                          Author  
                        )
                VALUES  ( @Title ,
                          @MenuId ,
                          @Content ,
                          @CreatedDate ,
                          @Source ,
                          @Type ,
                          @Views ,
                          @CreatedByUserId ,
                          @Author 
                        )
 
                SELECT  @error = @@ERROR ,
                        @count = @@ROWCOUNT ,
                        @ArticleId = SCOPE_IDENTITY()

                IF @error <> 0 
                    BEGIN
                        GOTO ERR_EXIT
                    END
            END
        ELSE 
            BEGIN                
                UPDATE  [Article]
                SET     Title = @Title ,
                        MenuId = @MenuId ,
                        Content = @Content ,
                        CreatedDate = @CreatedDate ,
                        Source = @Source ,
                        Type = @Type ,
                        Views = @Views ,
                        CreatedByUserId = @CreatedByUserId ,
                        Author = @Author
                WHERE   ArticleId = @ArticleId

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



