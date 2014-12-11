using System;

namespace Mfly.CMS.Admin.App_Code
{
    public class PageHelper
    {
        public static int GetPageSize()
        {
            string pageSize = System.Configuration.ConfigurationManager.AppSettings["PageSize"];
            if (string.IsNullOrEmpty(pageSize))
            {
                return 10;//默认为15条
            }
            return Convert.ToInt32(pageSize);
        }
       
    }
}