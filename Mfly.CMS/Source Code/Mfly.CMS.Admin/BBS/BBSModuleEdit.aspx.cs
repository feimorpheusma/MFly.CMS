using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mfly.CMS.Admin.UI;
using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.Utility;
using Mfly.CMS.Utility.WebControls;

namespace Mfly.CMS.Admin.BBS
{
    public partial class BBSModuleEdit : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGrid();
            }
        }

        private void bindGrid()
        {
            int sumCount = 0;
            int startIndex = gvModuleList.PageIndex * gvModuleList.PageSize;
            int pageSize = App_Code.PageHelper.GetPageSize(); 

            var list = PostModuleManager.ListWithPage(startIndex, pageSize, out sumCount);

            GridViewObjectDataSource vds = new GridViewObjectDataSource(list, sumCount);
            gvModuleList.DataSource = vds;
            gvModuleList.DataBind();

        }

        //protected override void OnInit(EventArgs e)
        //{
        //    base.OnInit(e);
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("BBSModuleDetail.aspx");
        }

        protected void gvModuleList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "EditModule":
                    {
                        string url = string.Format("BBSModuleDetail.aspx?mid={0}", e.CommandArgument.ToString());
                        Response.Redirect(url);
                        break;
                    }
                case "DeleModule":
                    {
                        int PostModuleId = Convert.ToInt32(e.CommandArgument.ToString());
                        PostModuleManager.Delete(PostModuleId);
                        if (gvModuleList.PageIndex != 0 && gvModuleList.Rows.Count == 1)
                        {
                            gvModuleList.PageIndex--;
                        }
                        bindGrid();
                        break;
                    }
                default:
                    {
                        break;
                    }
            }
        }

        protected void gvModuleList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvModuleList.PageIndex = e.NewPageIndex;
            bindGrid();
        }
    }
}