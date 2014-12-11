using System.Web.UI;

namespace Mfly.CMS.Utility
{
    /// <summary>
    /// 定义弹出对话框
    /// </summary>
    public class MessageBox
    {
        public static void Show(Page page, string msg)
        {
            msg = string.Format("alert('" + msg + "!');");
            ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "commit", msg, true);
        }


        public static void ShowAndRedirect(Page page, string msg, string url)
        {
            msg = "alert('" + msg + "!');window.location.href='" + url + "'";
            ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "commit", msg, true);
        }
    }
}
