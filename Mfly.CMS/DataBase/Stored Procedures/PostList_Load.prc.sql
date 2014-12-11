USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[PostList_Load]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [PostList_Load]
    END
GO

CREATE PROCEDURE [PostList_Load] ( @UserId INT, @Type INT )
AS 
    BEGIN
        SET NOCOUNT ON

        DECLARE @error INT ,
            @return INT
    
        DECLARE @RET_OK INT 

        SELECT  @RET_OK = 0 ;
        WITH    IDS
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
                     )
            SELECT  [Post].PostId ,
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
            ORDER BY [Post].CreatedDate DESC	
        
       
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



