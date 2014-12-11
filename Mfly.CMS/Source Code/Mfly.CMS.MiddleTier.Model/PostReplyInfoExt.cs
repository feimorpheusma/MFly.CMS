using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    public class PostReplyInfoExt : PostReplyInfo
    {
        public static string Column_UserId = "UserId";
        public static string Column_LoginName = "LoginName";
        public static string Column_RealName = "RealName";
        public static string Column_PhotoAttachmentId = "PhotoAttachmentId";
        public static string Column_PhotoAttachmentName = "PhotoAttachmentName";

        /// <summary>
        /// 用户ID
        /// </summary>
        public int UserId { get; set; }

        /// <summary>
        /// 登陆名
        /// </summary>
        public string LoginName { get; set; }

        /// <summary>
        /// 真实姓名
        /// </summary>
        public string RealName { get; set; }

        /// <summary>
        /// 头像ID
        /// </summary>
        public int PhotoAttachmentId { get; set; }

        /// <summary>
        /// 头像地址
        /// </summary>
        public string PhotoAttachmentName { get; set; }
    }
}
