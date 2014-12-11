USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[ArticleList_LoadWithPage]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [ArticleList_LoadWithPage]
    END
GO

CREATE PROCEDURE [ArticleList_LoadWithPage]
    (
      @StartIndex INT ,
      @PageSize INT ,
      @MenuId INT ,
      @UserId INT,
      @SumCount INT OUTPUT
    )
AS 
    BEGIN	
        SET NOCOUNT ON
	
        DECLARE @error INT ,
            @return INT
    
        DECLARE @RET_OK INT
        
        DECLARE @sql VARCHAR(MAX)
    
        SELECT  @RET_OK = 0 ;
        WITH    SEPARATE
                  AS ( SELECT   ROW_NUMBER() OVER ( ORDER BY ArticleId DESC ) AS ID ,
                                A.ArticleId ,
                                A.Title ,
                                A.Content ,
                                A.CreatedDate ,
                                A.Source ,
                                A.Type ,
                                A.Views ,
                                A.CreatedByUserId ,
                                A.Author,
                                U.RealName,
                                M.Name AS MenuName
                       FROM     [Article] A
                       LEFT JOIN dbo.[User] U ON A.CreatedByUserId = U.UserId
                       INNER JOIN [Menu] M ON M.MenuId = A.MenuId
                       WHERE    (@MenuId = 0 OR A.[MenuId]=@MenuId) AND (@UserId=0 OR UserId=@UserId)
                     )
            SELECT  *
            INTO    #tmp
            FROM    SEPARATE
            
        SELECT  @sumCount = COUNT(*)
        FROM    #tmp
        
        SELECT  *
        FROM    #tmp
        WHERE   ID BETWEEN ( @startIndex + 1 )
                   AND     ( @pageSize + @startIndex )			
		
        SELECT  @error = @@ERROR
    
        IF @error <> 0 
            BEGIN
                GOTO ERR_EXIT
            END
		
        OK_EXIT: 
        IF @return IS NULL 
            SELECT  @return = @RET_OK
        SET NOCOUNT OFF
        RETURN @return
        ERR_EXIT:
        IF ISNULL(@return, 0) = 0 
            SELECT  @return = @error
        GOTO OK_EXIT           
    END
GO



