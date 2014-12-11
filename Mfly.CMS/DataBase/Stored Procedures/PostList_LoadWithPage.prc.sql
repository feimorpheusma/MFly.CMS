USE [CMS]
GO
IF EXISTS ( SELECT  'X' FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[PostList_LoadWithPage]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
    BEGIN
        DROP PROC [PostList_LoadWithPage]
    END
GO

CREATE PROCEDURE [PostList_LoadWithPage]
(
    @StartIndex               INT,
    @PageSize                 INT,
    @UserId					  INT,
    @Type					  INT,
    @SumCount                 INT OUTPUT
)  
AS 
    BEGIN	
        SET NOCOUNT ON
	
        DECLARE @error INT ,
                @return INT
    
        DECLARE @RET_OK INT
    
        SELECT  @RET_OK = 0;
        
		WITH IDS
              AS ( SELECT   PostId
                   FROM     dbo.Post
                   WHERE    ( ISNULL(@UserId, 0) = 0
                              OR CreatedByUserId = @UserId
                            )
                            AND ISNULL(@Type, 0) = 0
                   UNION
                   SELECT   PostId
                   FROM     dbo.PostReply
                   WHERE    ( ISNULL(@UserId, 0) = 0
                              OR CreatedByUserId = @UserId
                            )
                            AND ISNULL(@Type, 0) = 1
                 ),
            Reply
              AS ( SELECT   PostId ,
                            COUNT(PostId) AS ReplyCount ,
                            MAX(CreatedDate) AS LastReplyDateTime
                   FROM     [PostReply]
                   GROUP BY PostId
                 ),
			SEPARATE AS (         
							SELECT  ROW_NUMBER() OVER (ORDER BY [Post].CreatedDate DESC) AS ID,
									[Post].PostId ,
									[Post].Title ,
									[Post].Status ,
									[Post].CreatedDate ,
									[Post].Views ,
									[Post].CreatedByUserId ,
									[Post].OrderStatus ,
									[User].UserId ,
									[User].LoginName ,
									[User].RealName ,
									ISNULL(Reply.LastReplyDateTime, [Post].CreatedDate) AS LastReplyDateTime ,
									ISNULL(Reply.ReplyCount, 0) AS ReplyCount
							FROM    [Post]
									INNER JOIN IDS ON [Post].PostId = IDS.PostId
									INNER JOIN [User] ON [Post].CreatedByUserId = [User].UserId
									LEFT JOIN Reply ON [Post].PostId = Reply.PostId								
						)
        SELECT  *
        INTO    #tmp
        FROM    SEPARATE  
        
        SELECT  @sumCount = COUNT(1)
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
            IF ISNULL(@return,0) = 0
            SELECT  @return = @error
            GOTO OK_EXIT           
    END
GO



