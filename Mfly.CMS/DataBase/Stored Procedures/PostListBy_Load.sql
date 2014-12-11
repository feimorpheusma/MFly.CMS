USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[PostListBy_Load]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [PostListBy_Load]
    END
GO


CREATE PROCEDURE [PostListBy_Load] ( @UserName NVARCHAR(50), @title NVARCHAR(50) )
AS 
    BEGIN
        SET NOCOUNT ON

        DECLARE @error INT ,
            @return INT
    
        DECLARE @RET_OK INT,
				@SqlStr NVARCHAR(MAX)

        SELECT  @RET_OK = 0 
        
		SELECT  A.PostId ,
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
				AND (ISNULL(@UserName,'')=''OR B.LoginName LIKE '%' + @UserName + '%'))
		ORDER BY A.CreatedDate DESC
    
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
