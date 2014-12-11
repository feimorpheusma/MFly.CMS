USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[PostListBy_LoadWithPage]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [PostListBy_LoadWithPage]
    END
GO


CREATE PROCEDURE [PostListBy_LoadWithPage] 
( 
	@UserName		NVARCHAR(50), 
	@title			NVARCHAR(50),
    @StartIndex               INT,
    @PageSize                 INT,
    @SumCount                 INT OUTPUT	 
)
AS 
    BEGIN
        SET NOCOUNT ON

        DECLARE @error INT ,
            @return INT
    
        DECLARE @RET_OK INT,
				@SqlStr NVARCHAR(MAX)

        SELECT  @RET_OK = 0;
        
        WITH    SEPARATE
                  AS (SELECT 
						ROW_NUMBER() OVER (ORDER BY A.CreatedDate DESC ) AS ID,
						A.PostId ,
						A.Title ,
						A.Status ,
						A.CreatedDate ,
						A.Views ,
						A.CreatedByUserId ,
						A.OrderStatus ,
						B.UserId ,
						B.LoginName ,
						B.RealName ,
						ISNULL(C.LastReplyDateTime, A.CreatedDate) AS LastReplyDateTime ,
						ISNULL(C.ReplyCount, 0) AS ReplyCount
				FROM    [Post] AS A
						LEFT JOIN [User] AS B ON A.CreatedByUserId = B.UserId
						LEFT JOIN ( SELECT  PostId ,
											COUNT(PostId) AS ReplyCount ,
											MAX(CreatedDate) AS LastReplyDateTime
									FROM    [PostReply]
									GROUP BY PostId
								  ) AS C ON A.PostId = C.PostId
				WHERE ((ISNULL(@title,'')=''OR A.Title LIKE '%' + @title + '%')
						AND (ISNULL(@UserName,'')=''OR B.RealName LIKE '%' + @UserName + '%'))				
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
