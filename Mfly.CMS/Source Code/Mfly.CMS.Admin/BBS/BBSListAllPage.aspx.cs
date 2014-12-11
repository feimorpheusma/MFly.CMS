using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mfly.CMS.Admin.UI;
using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.Utility.WebControls;

namespace Mfly.CMS.Admin.BBS
{
    public partial class BBSListAllPage : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.gvPostsList.PageSize = App_Code.PageHelper.GetPageSize(); 
                SearchPostList("", "");
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="postUserName"></param>
        /// <param name="postTitle"></param>
        private void SearchPostList(string postUserName, string postTitle)
        {
            int count = 0;
            int pageSize = App_Code.PageHelper.GetPageSize(); 
            int startIndex = gvPostsList.PageSize * gvPostsList.PageIndex;

            var list = PostManager.ListWithPage(startIndex, pageSize, postUserName, postTitle, out count);
            GridViewObjectDataSource gbds = new GridViewObjectDataSource(list, count);
            this.gvPostsList.DataSource = gbds;
            this.gvPostsList.DataBind();
        }


        protected void gvPostsList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPostsList.PageIndex = e.NewPageIndex;
            SearchPostList("", "");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string postUserName = this.txtPostUserName.Text.Trim();
            string postTitle = this.txtPostTitle.Text.Trim();
            gvPostsList.PageIndex = 0;
            SearchPostList(postUserName, postTitle);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvPostsList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleUser")
            {
                int postId = Convert.ToInt32(e.CommandArgument.ToString());
                PostManager.Delete(postId);
            }


            SearchPostList("", "");
        }
    }
}