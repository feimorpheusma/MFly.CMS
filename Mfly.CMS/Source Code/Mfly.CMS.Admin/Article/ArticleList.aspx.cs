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

namespace Mfly.CMS.Admin.Article
{
    public partial class ArticleList : BasePage
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
            Response.Redirect(String.Format("ArticleDetail.aspx?pi={0}", gvList.PageIndex));
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
                case "DeleArticle":
                    {
                        int articleId = Convert.ToInt32(e.CommandArgument);
                        try
                        {
                            ArticleManager.Delete(articleId);
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
                case "ArticleEdit":
                    {
                        int articleId = Convert.ToInt32(e.CommandArgument);
                        Response.Redirect(String.Format("ArticleDetail.aspx?aid={0}&pi={1}", articleId, gvList.PageIndex));
                        break;
                    }
                case "ArticleEditAttachment":
                    {
                        int articleId = Convert.ToInt32(e.CommandArgument);
                        Response.Redirect(String.Format("ArticleAttachment.aspx?aid={0}&pi={1}", articleId, gvList.PageIndex));
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

            var list = ArticleManager.ListWithPage(startIndex, pageSize, 0,0,out sumCount);

            var articleList = from p in list
                              select new { p.ArticleId, p.Title, p.Source, p.Author, p.CreatedDate,p.MenuName, TypeName = XEnum.GetDescription((ArticleTypeEnum)p.Type) };

            GridViewObjectDataSource vds = new GridViewObjectDataSource(articleList, sumCount);
            gvList.DataSource = vds;
            gvList.DataBind();
        }
        #endregion
    }
}