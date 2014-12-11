using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    /// <summary>
    /// ��������Info
    /// </summary>
    public class PostReplyInfo
    {
        #region public static variables
        public static string TableName = "PostReply";

        public static string Column_PostReplyId = "PostReplyId";
        public static string Column_PostId = "PostId";
        public static string Column_Content = "Content";
        public static string Column_CreatedDate = "CreatedDate";
        public static string Column_Status = "Status";
        public static string Column_CreatedByUserId = "CreatedByUserId";
        public static string Column_OrderNum = "OrderNum";

        #endregion

        #region public properties

        /// <summary>
        /// ����ID
        /// </summary>
        public int PostReplyId { get; set; }

        /// <summary>
        /// ����ID
        /// </summary>
        public int PostId { get; set; }

        /// <summary>
        /// ��������
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// ����ʱ��
        /// </summary>
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// ״̬
        /// </summary>
        public PostReplyStatusEnum Status { get; set; }

        /// <summary>
        /// ������ID
        /// </summary>
        public int CreatedByUserId { get; set; }


        public int OrderNum { get; set; }

        #endregion
    }
}
