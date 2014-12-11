using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    public class UserInfo
    {
        #region public static variables
        public static string TableName = "User";

        public static string Column_UserId = "UserId";
        public static string Column_LoginName = "LoginName";
        public static string Column_RealName = "RealName";
        public static string Column_Password = "Password";
        public static string Column_PasswordSalt = "PasswordSalt";
        public static string Column_Gender = "Gender";
        public static string Column_Birthday = "Birthday";
        public static string Column_QQ = "QQ";
        public static string Column_MSN = "MSN";
        public static string Column_Phone = "Phone";
        public static string Column_Email = "Email";
        public static string Column_CompanyName = "CompanyName";
        public static string Column_Position = "Position";
        public static string Column_IsDeleted = "IsDeleted";
        public static string Column_UserType = "UserType";
        public static string Column_CreatedDate = "CreatedDate";
        public static string Column_PhotoAttachmentId = "PhotoAttachmentId";
        public static string Column_CompanyProfile = "CompanyProfile";
        public static string Column_CompanyTel = "CompanyTel";
        public static string Column_CompanyHomepage = "CompanyHomepage";
        public static string Column_CompanyEmail = "CompanyEmail";
        public static string Column_CompanyIndustry = "CompanyIndustry";
        public static string Column_UserStatus = "UserStatus";
        public static string Column_Hobby = "Hobby";
        public static string Column_Signature = "Signature";
        public static string Column_IsAudit = "IsAudit";

        #endregion

        #region public properties

        /// <summary>
        /// 
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string LoginName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string RealName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string PasswordSalt { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public GendTypeEnum Gender { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public DateTime Birthday { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string QQ { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string MSN { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Phone { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string CompanyName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Position { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public bool IsDeleted { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public UserTypeEnum UserType { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int PhotoAttachmentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string CompanyProfile { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string CompanyTel { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string CompanyHomepage { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string CompanyEmail { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string CompanyIndustry { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public UserStatusEnum UserStatus { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Hobby { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Signature { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public bool IsAudit { get; set; }

        #endregion
    }
}
