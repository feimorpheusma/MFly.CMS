using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.MiddleTier.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class Site : System.Web.UI.MasterPage
    {
        private int _menuId = 0;
        private int _articleId = 0;
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
        public int ArticleId
        {
            get
            {
                if (_articleId == 0 && Request["aid"] != null)
                {
                    _articleId = Convert.ToInt32(Request["aid"]);
                }
                return _articleId;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                ArticleInfo article = null;
                if (ArticleId != 0)
                {
                    article = ArticleManager.LoadById(ArticleId);
                }
                initMenu();
                initSecondMenu(article);
                initSiteMap(article);
            }
        }

        private void initMenu()
        {
            var list = MenuManager.MenuList.Where(obj => obj.Level == MenuLevelEnum.First);
            rptMenu.DataSource = list;
            rptMenu.DataBind();
        }
        private void initSecondMenu(ArticleInfo article)
        {
            var menuId = MenuId;
            if (MenuId == 0 && article != null)
            {
                menuId = article.MenuId;
            }
            if (menuId != 0)
            {
                List<MenuInfo> list = null;
                var currentMenu = MenuManager.MenuList.FirstOrDefault(obj => obj.MenuId == menuId);
                if (currentMenu.Level == MenuLevelEnum.First)
                {
                    list = MenuManager.MenuList.Where(obj => obj.ParentMenuId == currentMenu.MenuId).ToList();
                }
                else if (currentMenu.Level == MenuLevelEnum.Second)
                {
                    list = MenuManager.MenuList.Where(obj => obj.ParentMenuId == currentMenu.ParentMenuId).ToList();
                }

                rptSecondMenu.DataSource = list;
                rptSecondMenu.DataBind();
            }
        }

        private void initSiteMap(ArticleInfo article)
        {
            var menuId = MenuId;
            if (MenuId == 0 && article != null)
            {
                menuId = article.MenuId;
            }
            if (menuId != 0)
            {
                string siteMapStr = string.Empty;
                var currentMenu = MenuManager.MenuList.FirstOrDefault(obj => obj.MenuId == menuId);
                if (currentMenu.Level == MenuLevelEnum.First)
                {
                    siteMapStr += string.Format(" &gt; <a href=\"/news.html?hcs=1&clg=3\">{0}</a>", currentMenu.Name);
                }
                else if (currentMenu.Level == MenuLevelEnum.Second)
                {
                    var parentMenu = MenuManager.MenuList.FirstOrDefault(obj => obj.MenuId == currentMenu.ParentMenuId);
                    siteMapStr += string.Format(" &gt; <a href=\"/news.html?hcs=1&clg=3\">{0}</a>", parentMenu.Name);
                    siteMapStr += string.Format(" &gt; {0}", currentMenu.Name);
                }
                if (article != null)
                {
                    siteMapStr += string.Format(" &gt; {0}", article.Title);
                }
                ltlSiteMap.Text = siteMapStr;
            }
        }
        protected void rptMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var model = e.Item.DataItem as MenuInfo;
                var hlMenu = e.Item.FindControl("hlMenu") as HyperLink;
                hlMenu.Text = model.Name;
                hlMenu.NavigateUrl = getURL(model);
            }
        }
        protected void rptSecondMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var model = e.Item.DataItem as MenuInfo;
                var hlMenu = e.Item.FindControl("hlMenu") as HyperLink;
                hlMenu.Text = model.Name;
                hlMenu.NavigateUrl = getURL(model);
            }
        }

        private string getURL(MenuInfo model)
        {
            string URL = string.Empty;
            MenuInfo sonMenu = null;
            if (model.Level == MenuLevelEnum.First)
            {
                sonMenu = MenuManager.MenuList.FirstOrDefault(obj => obj.ParentMenuId == model.MenuId);
            }
            int menuId = model.MenuId;
            if (sonMenu != null)
            {
                menuId = sonMenu.MenuId;
                model = MenuManager.LoadById(menuId);
            }

            if (model.Type == MenuTypeEnum.List)
            {
                URL = string.Format("List.aspx?mid={0}", menuId);
            }
            else if (model.Type == MenuTypeEnum.Detail)
            {
                URL = string.Format("Detail.aspx?mid={0}", menuId);

            }
            else if (model.Type == MenuTypeEnum.ImageList)
            {
                URL = string.Format("ImageList.aspx?mid={0}", menuId);
            }
            return URL;
        }
    }
}