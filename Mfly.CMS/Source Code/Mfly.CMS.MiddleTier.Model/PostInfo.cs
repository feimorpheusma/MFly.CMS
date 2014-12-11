using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    /// <summary>
    /// ����Info
    /// </summary>
    public class PostInfo
    {
        #region public static variables

        public static string TableName = "Post";

        public static string Column_PostId = "PostId";
        public static string Column_Title = "Title";
        public static string Column_Content = "Content";
        public static string Column_Status = "Status";
        public static string Column_CreatedDate = "CreatedDate";
        public static string Column_Views = "Views";
        public static string Column_CreatedByUserId = "CreatedByUserId";
        public static string Column_PostModuleId = "PostModuleId";
        public static string Column_OrderStatus = "OrderStatus";

        #endregion

        #region public properties

        /// <summary>
        /// ����ID
        /// </summary>
        public int PostId { get; set; }

        /// <summary>
        /// ����
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// ����
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// ״̬
        /// </summary>
        public PostStatusEnum Status { get; set; }

        /// <summary>
        /// ����ʱ��
        /// </summary>
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// �����
        /// </summary>
        public int Views { get; set; }

        /// <summary>
        /// ������ID
        /// </summary>
        public int CreatedByUserId { get; set; }

        /// <summary>
        /// ����ģ����
        /// </summary>
        public int PostModuleId { get; set; }

        /// <summary>
        /// ����״̬
        /// </summary>
        public PostOrderStatusEnum OrderStatus { get; set; }


        #endregion
    }
}
