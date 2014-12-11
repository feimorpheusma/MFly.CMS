USE CMS
IF NOT EXISTS ( SELECT  'x'
                FROM    dbo.[User]
                WHERE   LoginName = 'admin' ) 
    BEGIN	
        INSERT  INTO dbo.[User]
                ( LoginName ,
                  RealName ,
                  Password ,
                  PasswordSalt ,
                  Gender ,
                  Birthday ,
                  QQ ,
                  MSN ,
                  Phone ,
                  Email ,
                  CompanyName ,
                  Position ,
                  IsDeleted ,
                  UserType ,
                  CreatedDate ,
                  PhotoAttachmentId ,
                  CompanyProfile ,
                  CompanyTel ,
                  CompanyHomepage ,
                  CompanyEmail ,
                  CompanyIndustry ,
                  UserStatus ,
                  Hobby ,
                  Signature
                )
        VALUES  ( N'admin' , -- LoginName - nvarchar(50)
                  N'π‹¿Ì‘±' , -- RealName - nvarchar(50)
                  'YNPrfnztjsE=' , -- Password - varchar(50)
                  'QM?%*P2f' , -- PasswordSalt - varchar(50)
                  0 , -- Gender - int
                  '2013-03-05 09:36:15' , -- Birthday - datetime
                  '' , -- QQ - varchar(20)
                  '' , -- MSN - varchar(50)
                  '' , -- Phone - varchar(20)
                  '' , -- Email - varchar(50)
                  N'' , -- CompanyName - nvarchar(50)
                  N'' , -- Position - nvarchar(20)
                  0 , -- IsDeleted - bit
                  1 , -- UserType - int
                  '2013-03-05 09:36:15' , -- CreatedDate - datetime
                  NULL , -- PhotoAttachmentId - int
                  '' , -- CompanyProfile - text
                  '' , -- CompanyTel - varchar(20)
                  '' , -- CompanyHomepage - varchar(50)
                  '' , -- CompanyEmail - varchar(50)
                  N'' , -- CompanyIndustry - nvarchar(50)
                  1 , -- UserStatus - int
                  N'' , -- Hobby - nvarchar(100)
                  N''  -- Signature - nvarchar(200)
                )
    END