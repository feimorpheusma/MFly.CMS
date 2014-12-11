using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;
using System.Transactions;

namespace Mfly.CMS.Admin.BBS
{
    public partial class BBSModuleDetail : System.Web.UI.Page
    {
        #region

        private int _moduleId = 0;

        public int ModuleId
        {
            get
            {
                if (_moduleId == 0 && Request["mid"] != null)
                {
                    _moduleId = Convert.ToInt32(Request["mid"]);
                }
                return _moduleId;
            }
        }

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                if (ModuleId != 0)
                {
                    initData();
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BBS/BBSModuleEdit.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid==false)
            {
                return;
            }
            PostModuleInfo model = new PostModuleInfo();
            if (ModuleId != 0)
            {
                model = PostModuleManager.LoadById(ModuleId);
            } 
            
            model.Name = txtModuleName.Text.Trim();
            model.Description = txtModuleMemo.Text.Trim();
            PostModuleManager.Save(model);
            Response.Redirect("BBSModuleEdit.aspx");
        }

        private void initData()
        {
            var model = PostModuleManager.LoadById(ModuleId);
            txtModuleName.Text = model.Name;
            txtModuleMemo.Text = model.Description;
        }
    }
}