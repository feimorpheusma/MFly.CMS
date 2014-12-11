using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Mfly.CMS.Web.App_Code
{
    public static class FormartHelper
    {
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

        public static string RemoveHTMLTag(string Htmlstring, int length)
        {
            var str = RemoveHTMLTag(Htmlstring);
            if (str.Length > length)
            {
                str = str.Substring(0, length);
            }
            return str;
        }
    }
}