using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    /// <summary>
    /// ���Ӹ�����Info
    /// </summary>
    public class Post_AttachmentInfo
    {
        #region public static variables
        public static string TableName = "Post_Attachment";

        public static string Column_PostAttachmentId = "PostAttachmentId";
        public static string Column_PostId = "PostId";
        public static string Column_AttachmentId = "AttachmentId";
        public static string Column_Type = "Type";

        #endregion

        #region public properties

        /// <summary>
        /// ���Ӹ���ID
        /// </summary>
        public int PostAttachmentId { get; set; }

        /// <summary>
        /// ����ID
        /// </summary>
        public int PostId { get; set; }

        /// <summary>
        /// ����ID
        /// </summary>
        public int AttachmentId { get; set; }

        /// <summary>
        /// ��������
        /// </summary>
        public int Type { get; set; }


        #endregion
    }
}
