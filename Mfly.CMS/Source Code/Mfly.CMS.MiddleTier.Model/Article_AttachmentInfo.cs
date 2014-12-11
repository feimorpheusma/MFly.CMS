using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    public class Article_AttachmentInfo
    {
        #region public static variables
        public static string TableName = "Article_Attachment";

        public static string Column_ArticleAttachmentId = "ArticleAttachmentId";
        public static string Column_ArticleId = "ArticleId";
        public static string Column_AttachmentId = "AttachmentId";
        public static string Column_Type = "Type";
        public static string Column_Description = "Description";

        #endregion

        #region public properties

        /// <summary>
        /// 
        /// </summary>
        public int ArticleAttachmentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int ArticleId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int AttachmentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public ImageTypeEnum Type { get; set; }
        public string Description { get; set; }


        #endregion
    }
}
