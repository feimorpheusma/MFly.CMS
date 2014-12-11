USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[PostReplyList_LoadWithPage]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [PostReplyList_LoadWithPage]
    END
GO

CREATE PROCEDURE [PostReplyList_LoadWithPage]
    (
      @StartIndex INT ,
      @PageSize INT ,
      @SumCount INT OUTPUT
    )
AS 
    BEGIN	
        SET NOCOUNT ON
	
        DECLARE @error INT ,
            @return INT
    
        DECLARE @RET_OK INT
    
        SELECT  @RET_OK = 0 ;
        WITH    SEPARATE
                  AS ( SELECT   ROW_NUMBER() OVER ( ORDER BY PostReplyId DESC ) AS ID ,
                                PostReplyId ,
                                PostId ,
                                Content ,
                                CreatedDate ,
                                Status ,
                                CreatedByUserId
                       FROM     [PostReply]
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



