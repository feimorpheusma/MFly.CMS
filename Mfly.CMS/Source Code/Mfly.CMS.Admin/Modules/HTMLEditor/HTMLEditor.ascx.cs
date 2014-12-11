using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mfly.CMS.ERP.Modules.HTMLEditor
{
    public partial class HTMLEditor : System.Web.UI.UserControl
    {

        public string Text
        {
            get
            {
                return txtEditorContent.Text;
            }
            set
            {
                txtEditorContent.Text = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}