USE CMS
GO

--增加是否审批字段
IF NOT EXISTS ( SELECT  'x'
                FROM    syscolumns
                WHERE   id = OBJECT_ID('User')
                        AND name = 'IsAudit' ) 
    BEGIN
        ALTER TABLE [User] ADD IsAudit BIT
        
    END
GO

IF EXISTS ( SELECT  'x'
                FROM    syscolumns
                WHERE   id = OBJECT_ID('User')
                        AND name = 'IsAudit' ) 
    BEGIN
		--对已有数据修改成已批准状态
		UPDATE [User] SET IsAudit=1 WHERE IsAudit IS NULL
	END
GO