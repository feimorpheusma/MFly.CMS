using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    /// <summary>
    /// 帖子模板Info
    /// </summary>
    public class PostModuleInfo
    {
        #region public static variables
        public static string TableName = "PostModule";

        public static string Column_PostModuleId = "PostModuleId";
        public static string Column_Name = "Name";
        public static string Column_Description = "Description";

        #endregion

        #region public properties

        /// <summary>
        /// 帖子模板ID
        /// </summary>
        public int PostModuleId { get; set; }

        /// <summary>
        /// 模板名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        public string Description { get; set; }


        #endregion
    }
}
