using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    /// <summary>
    /// 帖子Info
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
        /// 帖子ID
        /// </summary>
        public int PostId { get; set; }

        /// <summary>
        /// 标题
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 内容
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 状态
        /// </summary>
        public PostStatusEnum Status { get; set; }

        /// <summary>
        /// 发表时间
        /// </summary>
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// 点击率
        /// </summary>
        public int Views { get; set; }

        /// <summary>
        /// 发帖人ID
        /// </summary>
        public int CreatedByUserId { get; set; }

        /// <summary>
        /// 帖子模板编号
        /// </summary>
        public int PostModuleId { get; set; }

        /// <summary>
        /// 排序状态
        /// </summary>
        public PostOrderStatusEnum OrderStatus { get; set; }


        #endregion
    }
}
