using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.Web.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                initData();
                initMenu();
            }
        }

        private void initData()
        {
            var articleList = ArticleManager.List(0);

            var topNews = articleList.Where(obj => obj.AttachmentId != 0 && obj.MenuId == 9).Take(3);
            rptTopNews.DataSource = topNews;
            rptTopNews.DataBind();

            var firstNews = articleList.Where(obj => obj.AttachmentId != 0 && obj.MenuId == 9).Take(1).ToList()[0];
            litFirstNewsTitle.Text = firstNews.Title;
            litFirstNewsContent.Text = FormartHelper.RemoveHTMLTag(firstNews.Content, 150);

            var painterList = articleList.Where(obj => obj.AttachmentId != 0 && obj.MenuId == 12).Take(12);

            rptPainter.DataSource = painterList;
            rptPainter.DataBind();

        }
        private void initMenu()
        {
            var list = MenuManager.MenuList.Where(obj => obj.Level == MenuLevelEnum.First);
            rptMenu.DataSource = list;
            rptMenu.DataBind();
        }
          
        protected void articleImage_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var model = e.Item.DataItem as ArticleInfoExt;
                var imgPic = e.Item.FindControl("imgPic") as Image;

                if (model.AttachmentId != 0)
                {
                    imgPic.Visible = true;
                    ControlHelper.SetImageUrl(model.AttachmentId, model.AttachmentName, imgPic);
                }
            }
        }
        protected void rptMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var model = e.Item.DataItem as MenuInfo;
                var hlMenu = e.Item.FindControl("hlMenu") as HyperLink;
                hlMenu.Text = model.Name;
                hlMenu.NavigateUrl =CommonHelper. getURL(model);
            }
        }
    }
}