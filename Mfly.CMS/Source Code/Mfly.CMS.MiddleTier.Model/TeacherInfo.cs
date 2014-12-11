using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    public class TeacherInfo
    {
        #region public static variables
        public static string TableName = "Teacher";

        public static string Column_TeacherId = "TeacherId";
        public static string Column_Profile = "Profile";
        public static string Column_UserId = "UserId";
        public static string Column_PhotoAttachmentId = "PhotoAttachmentId";
        public static string Column_RealName = "RealName";

        #endregion

        #region public properties

        /// <summary>
        /// 
        /// </summary>
        public int TeacherId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Profile { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int PhotoAttachmentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string RealName { get; set; }

        #endregion
    }
}
