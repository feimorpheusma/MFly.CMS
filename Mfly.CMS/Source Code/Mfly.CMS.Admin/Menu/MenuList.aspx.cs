using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.Utility.WebControls;
using Mfly.CMS.Utility;
using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.Admin.UI;

namespace Mfly.CMS.Admin.Menu
{
    public partial class MenuList : BasePage
    {
        #region
        private int _pageIndex = 0;
        public int CurrentPageIndex
        {
            get
            {
                if (_pageIndex == 0 && Request["pi"] != null)
                {
                    _pageIndex = Convert.ToInt32(Request["pi"]);

                }
                return _pageIndex;
            }
        }
        #endregion

        #region
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                gvList.PageIndex = CurrentPageIndex;
                bindGrid();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("MenuDetail.aspx?pi={0}", gvList.PageIndex));
        }

        protected void gvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvList.PageIndex = e.NewPageIndex;
            bindGrid();
        }

        protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "MenuDelete":
                    {
                        int articleId = Convert.ToInt32(e.CommandArgument);
                        try
                        {
                            MenuManager.Delete(articleId);
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(this.Page, ex.ToString());
                        }

                        if (gvList.PageIndex != 0 && gvList.Rows.Count == 1)
                        {
                            gvList.PageIndex--;
                        }
                        bindGrid();
                        break;
                    }
                case "MenuEdit":
                    {
                        int articleId = Convert.ToInt32(e.CommandArgument);
                        Response.Redirect(String.Format("MenuDetail.aspx?mid={0}&pi={1}", articleId, gvList.PageIndex));
                        break;
                    }
                default:
                    {
                        break;
                    }
            }
        }
        #endregion

        #region
        private void bindGrid()
        {
            int sumCount = 0;
            int startIndex = gvList.PageIndex * gvList.PageSize;
            int pageSize = gvList.PageSize;

            var list = MenuManager.ListWithPage(startIndex, pageSize,out sumCount);

            //var articleList = from p in list
            //                  select new { p.ArticleId, p.Title, p.Source, p.Author, p.CreatedDate, TypeName = XEnum.GetDescription((ArticleTypeEnum)p.Type) };

            GridViewObjectDataSource vds = new GridViewObjectDataSource(list, sumCount);
            gvList.DataSource = vds;
            gvList.DataBind();
        }
        #endregion
    }
}