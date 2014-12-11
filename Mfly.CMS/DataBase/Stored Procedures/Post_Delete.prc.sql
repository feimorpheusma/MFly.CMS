USE [CMS]
GO
IF EXISTS ( SELECT  'X' FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Post_Delete]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1 )
    BEGIN
        DROP PROC Post_Delete
    END
GO

CREATE PROCEDURE Post_Delete
    (@PostId int)       
AS 
    BEGIN TRANSACTION

        DECLARE 
            @count int,
            @error int,
            @return int,
            @PostAttachmentId int

        DECLARE
            @RET_OK int,
            @RET_NOT_FOUND int

        SELECT 
            @RET_OK = 0,
            @RET_NOT_FOUND = -1
        
        -- �Ӹ�������ɾ����ظ�����Ϣ
        DELETE FROM [Attachment] 
        WHERE [AttachmentId] 
        IN(        
			SELECT 
				PostAttachmentId 
			FROM 
				[Post_Attachment] 
			WHERE
				PostId=@PostId
		)
        
        SET @error = @error + @@ERROR
        SET @count = @count + @@ROWCOUNT
		
        
        -- ɾ�����Ӹ��������
        DELETE FROM [Post_Attachment]
        WHERE PostId=@PostId
        
        SET @error = @error + @@ERROR
        SET @count = @count + @@ROWCOUNT
        
        -- ɾ�����۱����
        DELETE FROM [PostReply] 
        WHERE PostId=@PostId
        
        SET @error = @error + @@ERROR
        SET @count = @count + @@ROWCOUNT
        
        -- ɾ�����ӱ�
        DELETE FROM [Post]
        WHERE PostId = @PostId        
        
        SET @error = @error + @@ERROR
        SET @count = @count + @@ROWCOUNT

        IF @error <> 0 
            BEGIN
				ROLLBACK TRANSACTION
				RETURN @RET_NOT_FOUND
            END
        ELSE
			BEGIN
				COMMIT TRANSACTION
				RETURN @RET_OK
			END



