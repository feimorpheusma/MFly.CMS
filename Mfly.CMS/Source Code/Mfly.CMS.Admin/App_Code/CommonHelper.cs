using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.Admin.App_Code
{
    public class CommonHelper
    {
        public static void ResponseUrl(ErrorCodeEnum code)
        {
            HttpContext.Current.Response.Redirect(string.Format("/Error.aspx?code={0}", (int)code), true);
        }

        public static int GetId(string idStr, ErrorCodeEnum code)
        {
            int id = 0;
            if (string.IsNullOrEmpty(idStr) == false)
            {
                if (int.TryParse(idStr, out id) == false)
                {
                    App_Code.CommonHelper.ResponseUrl(code);
                }
            }
            return id;
        }

        public static int GetIntValue(string str)
        {
            int intValue = 0;
            int.TryParse(str, out intValue);
            return intValue;
        }

        public static DateTime? GetDate(string dateStr)
        {
            DateTime datetime;
            if (string.IsNullOrEmpty(dateStr) == false)
            {
                if (DateTime.TryParse(dateStr, out datetime) == false)
                {
                    App_Code.CommonHelper.ResponseUrl(ErrorCodeEnum.UnLegal);
                }
                else
                {
                    return datetime;
                }
            }
            return null;
        }

      
    }
}