using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    public class UserInfoExt : UserInfo
    {
        #region public static variables
        public static string TableName = "User";

        public static string Column_PhotoAttachmentName = "PhotoAttachmentName";

        #endregion

        #region public properties

        /// <summary>
        /// 
        /// </summary>
        public string PhotoAttachmentName { get; set; }


        #endregion
    }
}
