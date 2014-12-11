using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.Utility.WebControls;
using Mfly.CMS.Web.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class List1 : System.Web.UI.Page
    {
        private int _menuId = 0;
        public int MenuId
        {
            get
            {
                if (_menuId == 0 && Request["mid"] != null)
                {
                    _menuId = Convert.ToInt32(Request["mid"]);
                }
                return _menuId;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                initData();
            }
        }

        private void initData()
        {
            if (MenuId != 0)
            {
                bindGrid();
            }
        }

        private void bindGrid()
        {
            var articleList = ArticleManager.List(MenuId);
            var list = from p in articleList
                       select new { p.ArticleId, p.Title, Content = FormartHelper.RemoveHTMLTag(p.Content,100) };
            rptList.DataSource = list;
            rptList.DataBind();
            //int sumCount = 0;
            //int startIndex = gvList.PageIndex * gvList.PageSize;
            //int pageSize = gvList.PageSize;

            //var list = ArticleManager.ListWithPage(startIndex, pageSize, 0, 0, out sumCount);

            //var articleList = from p in list
            //                  select new { p.ArticleId, p.Title, p.Source, p.Author, p.CreatedDate, p.MenuName, TypeName = XEnum.GetDescription((ArticleTypeEnum)p.Type) };

            //GridViewObjectDataSource vds = new GridViewObjectDataSource(articleList, sumCount);
            //gvList.DataSource = vds;
            //gvList.DataBind();
        }
    }
}