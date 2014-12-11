USE [CMS]
GO
USE [CMS]
GO
IF EXISTS ( SELECT  'X'
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[PostReplyList_LoadByPostId]')
                    AND OBJECTPROPERTY(id, N'IsProcedure') = 1 ) 
    BEGIN
        DROP PROC [PostReplyList_LoadByPostId]
    END
GO

CREATE PROCEDURE [dbo].[PostReplyList_LoadByPostId] ( @postId INT )
AS 
    BEGIN
        SET NOCOUNT ON

        DECLARE @error INT ,
            @return INT

        DECLARE @RET_OK INT

        SELECT  @RET_OK = 0

        SELECT  A.PostReplyId ,
                A.PostId ,
                A.Content ,
                A.CreatedDate ,
                A.Status ,
                A.CreatedByUserId ,
                B.UserId ,
                B.LoginName ,
                B.RealName ,
                B.PhotoAttachmentId ,
                CONVERT(VARCHAR(40), C.TargetFileName) + C.FileExtension AS PhotoAttachmentName
        FROM    [PostReply] AS A
                LEFT JOIN [User] AS B ON A.CreatedByUserId = B.UserId
                LEFT JOIN [Attachment] AS C ON B.PhotoAttachmentId = C.AttachmentId
        WHERE   PostId = @postId

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


