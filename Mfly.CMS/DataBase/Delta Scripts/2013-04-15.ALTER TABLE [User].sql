USE CMS
GO

--�����Ƿ������ֶ�
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
		--�����������޸ĳ�����׼״̬
		UPDATE [User] SET IsAudit=1 WHERE IsAudit IS NULL
	END
GO