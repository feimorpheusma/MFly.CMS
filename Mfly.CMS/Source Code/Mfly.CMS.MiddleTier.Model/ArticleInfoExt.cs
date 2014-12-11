using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    public class ArticleInfoExt : ArticleInfo
    {
        #region public static variables

        public static string Column_AttachmentId = "AttachmentId";
        public static string Column_AttachmentName = "AttachmentName";
        public static string Column_AttachmentType = "AttachmentType";
        public static string Column_RealName = "RealName";
        public static string Column_MenuName = "MenuName";
        public static string Column_ArticleAttachmentId = "ArticleAttachmentId";

        #endregion

        #region public properties
        /// <summary>
        /// 
        /// </summary>
        public int AttachmentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string AttachmentName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int AttachmentType { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string RealName { get; set; }

        public string MenuName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int ArticleAttachmentId { get; set; }

        #endregion
    }
}
