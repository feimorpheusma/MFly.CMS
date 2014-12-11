using System;
using System.Collections.Generic;
using System.Text;

namespace Mfly.CMS.MiddleTier.Model
{
    public class MenuInfo
    {
        #region public static variables
        public static string TableName = "Menu";

        public static string Column_MenuId = "MenuId";
        public static string Column_ParentMenuId = "ParentMenuId";
        public static string Column_Name = "Name";
        public static string Column_Level = "Level";
        public static string Column_Key = "Key";
        public static string Column_Type = "Type";
        public static string Column_Page = "Page";
        public static string Column_URL = "URL";
        public static string Column_Visable = "Visable";
        public static string Column_IsDeleted = "IsDeleted";

        #endregion

        #region public properties

        /// <summary>
        /// 
        /// </summary>
        public int MenuId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int ParentMenuId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public MenuLevelEnum Level { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Key { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public MenuTypeEnum Type { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Page { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string URL { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public bool Visable { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public bool IsDeleted { get; set; }


        #endregion
    }
}
