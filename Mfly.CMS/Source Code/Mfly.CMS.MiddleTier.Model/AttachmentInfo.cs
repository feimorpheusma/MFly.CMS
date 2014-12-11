using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    public class AttachmentInfo
    {
        #region public static variables
           public static string TableName = "Attachment";
      
        public static string Column_AttachmentId = "AttachmentId"; 
        public static string Column_OriginalFileName = "OriginalFileName"; 
        public static string Column_TargetFileName = "TargetFileName"; 
        public static string Column_FileExtension = "FileExtension"; 
        public static string Column_Content = "Content"; 
        
        #endregion
        
           #region public properties
        
        /// <summary>
        /// 
        /// </summary>
        public  int AttachmentId { get; set; }
        
        /// <summary>
        /// 
        /// </summary>
        public  string OriginalFileName { get; set; }
        
        /// <summary>
        /// 
        /// </summary>
        public  Guid TargetFileName { get; set; }
        
        /// <summary>
        /// 
        /// </summary>
        public  string FileExtension { get; set; }
        
        /// <summary>
        /// 
        /// </summary>
        public  byte[] Content { get; set; }
        

         #endregion        
    }
}
