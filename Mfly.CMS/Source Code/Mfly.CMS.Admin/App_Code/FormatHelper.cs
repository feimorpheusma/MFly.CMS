using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Mfly.CMS.Admin.App_Code
{
    public class FormatHelper
    {
        #region private const string
        private const string FORMAT_DATE = "yyyy-MM-dd HH:mm:ss"; 
        #endregion

        #region public methods
        public static string FormatDateTime(DateTime dateTime)
        {
            return dateTime.ToString(FORMAT_DATE);
        }

        public static string FormatNullableDateTime(DateTime? dateTime)
        {
            string dateTimeStr = dateTime.HasValue ? dateTime.Value.ToString(FORMAT_DATE) : string.Empty;
            return dateTimeStr;
        }

        public static string GetShortString(string subject, int length)
        {
            if (subject.Length <= length)
            {
                return subject;
            }
            return subject.Substring(0, length) + "...";
        }

        public static string FormatDateTime(DateTime dateTime,string type)
        {
            type = string.IsNullOrEmpty(type) ? "yyyy-MM-dd" : FORMAT_DATE;
            return dateTime.ToString(type);
        }
        public static string FormatDecimalString(string value)
        {
            return Math.Round(Convert.ToDouble(Regex.Replace(value, "\\.?0*$", "")), 6).ToString();
        }

        public static string getExcelConnectionString(string fileName)
        {
            string connString = string.Empty;

            if (string.IsNullOrEmpty(fileName))
                return connString;

            string fileType = System.IO.Path.GetExtension(fileName.ToLower()).Trim();

            if (fileType == ".xls")
            {
                connString = "Provider=Microsoft.Jet.OLEDB.4.0;OLE DB Services=-4;Data Source=" + fileName +
                             ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=1\"";
            }
            else if (fileType == ".xlsx")
            {
                connString = "Provider=Microsoft.ACE.OLEDB.12.0;OLE DB Services=-4;Data Source=" + fileName +
                             ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=1\"";
            }
            return connString;
        }

        public static string RemoveHTMLTag(string Htmlstring)
        {
            if (string.IsNullOrEmpty(Htmlstring) == true)
            {
                return string.Empty;
            }

            Htmlstring = Regex.Replace(Htmlstring, @"<script[^>]*?>.*?</script>", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"<style[^>]*?>.*?</style>", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"-->", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"<!--.*", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, "<[^>]*>", "", RegexOptions.Compiled);
            Htmlstring = Regex.Replace(Htmlstring, @"([\r\n])[\s]+", " ", RegexOptions.Compiled);
            return Htmlstring.Replace("&nbsp;", " ");
        }
        #endregion
    }
}