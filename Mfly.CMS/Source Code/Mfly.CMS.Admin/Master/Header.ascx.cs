using System;
using System.Web;
using System.Web.UI;

namespace Mfly.CMS.Admin.LeftMenu
{
    public partial class Header : System.Web.UI.UserControl
    {
        protected void lkbLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}