using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    public class PostInfoExt : PostInfo
    {
        public static string Column_UserId = "UserId";
        public static string Column_LoginName = "LoginName";
        public static string Column_RealName = "RealName";
        public static string Column_PhotoAttachmentId = "PhotoAttachmentId";
        public static string Column_PhotoAttachmentName = "PhotoAttachmentName";
        public static string Column_ReplyCount = "ReplyCount";
        public static string Column_LastReplyDateTime = "LastReplyDateTime";
        public static string Column_PostModuleName = "PostModuleName";

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

        /// <summary>
        /// 回复次数
        /// </summary>
        public int ReplyCount { get; set; }

        public DateTime LastReplyDateTime { get; set; }

        public string PostModuleName { get; set; }

    }
}
