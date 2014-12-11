using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    public class Article_AttachmentInfoExt : Article_AttachmentInfo
    {
        #region public static variables

        public static string Column_AttachmentName = "AttachmentName";

        #endregion

        #region public properties
       
        /// <summary>
        /// 
        /// </summary>
        public string AttachmentName { get; set; }

        #endregion
    }
}
