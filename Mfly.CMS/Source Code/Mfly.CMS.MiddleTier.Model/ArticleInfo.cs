using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    public class ArticleInfo
    {
        #region public static variables
        public static string TableName = "Article";

        public static string Column_ArticleId = "ArticleId";
        public static string Column_MenuId = "MenuId";
        public static string Column_Title = "Title";
        public static string Column_Content = "Content";
        public static string Column_CreatedDate = "CreatedDate";
        public static string Column_Source = "Source";
        public static string Column_Type = "Type";
        public static string Column_Views = "Views";
        public static string Column_CreatedByUserId = "CreatedByUserId";
        public static string Column_Author = "Author";

        #endregion

        #region public properties

        /// <summary>
        /// 
        /// </summary>
        public int ArticleId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int MenuId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Source { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public ArticleTypeEnum Type { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int Views { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int CreatedByUserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Author { get; set; }


        #endregion
    }
}
