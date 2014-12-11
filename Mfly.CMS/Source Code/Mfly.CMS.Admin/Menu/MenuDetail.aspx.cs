using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mfly.CMS.Utility;
using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.Admin.UI;
using System.IO;
using System.Transactions;

namespace Mfly.CMS.Admin.Menu
{
    public partial class MenuDetail : BasePage
    {
        #region
        private int _menuId = 0;
        private int _pageIndex = 0;
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

        public int PageIndex
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

        #region protected methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                initDropdownList();
                if (MenuId != 0)
                {
                    initData();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == false)
            {
                return;
            }
            var model = new MenuInfo();
            if (MenuId != 0)
            {
                model = MenuManager.LoadById(MenuId);
            }
            model.Visable = cbxVisable.Checked;
            model.IsDeleted = false;
            model.Key = txtKey.Text;
            model.Level = (MenuLevelEnum)int.Parse(ddlLevel.SelectedValue);
            model.Name = txtName.Text;
            model.Page = string.Empty;
            model.ParentMenuId = int.Parse(ddlParentMenu.SelectedValue);
            model.Type = (MenuTypeEnum)int.Parse(ddlType.SelectedValue);
            model.URL = string.Empty;

            using (TransactionScope ts = new TransactionScope())
            {
                try
                {
                    MenuManager.Save(model);

                    if (model.Type == MenuTypeEnum.Detail && string.IsNullOrEmpty(htmlEditor.Text) == false)
                    {
                        var article = new ArticleInfo();
                        if (MenuId != 0)
                        {
                            var articleList = ArticleManager.List(MenuId);
                            if (articleList != null && articleList.Count > 0)
                            {
                                article = articleList[0];
                            }
                        }
                        article.MenuId = model.MenuId;
                        article.Content = htmlEditor.Text;
                        article.CreatedByUserId = UserId.Value;
                        article.CreatedDate = DateTime.Now;
                        article.Title = txtName.Text;
                        ArticleManager.Save(article);
                    }
                    ts.Complete();
                    MenuManager.MenuList = null;
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    ts.Dispose();
                }
            }
            Response.Redirect(String.Format("MenuList.aspx?pi={0}", PageIndex));
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("MenuList.aspx?pi={0}", PageIndex));
        }

        #endregion

        #region
        private void initDropdownList()
        {
            ddlLevel.Items.Add(new ListItem(XEnum.GetDescription(MenuLevelEnum.First), ((int)MenuLevelEnum.First).ToString()));
            ddlLevel.Items.Add(new ListItem(XEnum.GetDescription(MenuLevelEnum.Second), ((int)MenuLevelEnum.Second).ToString()));
            ddlType.Items.Add(new ListItem(XEnum.GetDescription(MenuTypeEnum.List), ((int)MenuTypeEnum.List).ToString()));
            ddlType.Items.Add(new ListItem(XEnum.GetDescription(MenuTypeEnum.Detail), ((int)MenuTypeEnum.Detail).ToString()));
            ddlType.Items.Add(new ListItem(XEnum.GetDescription(MenuTypeEnum.ImageList), ((int)MenuTypeEnum.ImageList).ToString()));
            var list = MenuManager.MenuList.Where(obj => obj.Level == MenuLevelEnum.First);
            ddlParentMenu.DataSource = list;
            ddlParentMenu.DataTextField = "Name";
            ddlParentMenu.DataValueField = "MenuId";
            ddlParentMenu.DataBind();
            ddlParentMenu.Items.Insert(0, new ListItem("请选择", "0"));
        }

        private void initData()
        {
            var model = MenuManager.LoadById(MenuId);
            txtKey.Text = model.Key;
            txtName.Text = model.Name;
            ddlLevel.SelectedValue = ((int)model.Level).ToString();
            ddlParentMenu.SelectedValue = model.ParentMenuId.ToString();
            ddlType.SelectedValue = ((int)model.Type).ToString();
            cbxVisable.Checked = model.Visable;

            var articleList = ArticleManager.List(MenuId);
            if (articleList != null && articleList.Count > 0)
            {
                var article = articleList[0];
                htmlEditor.Text = article.Content;
            }
        }

        #endregion

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            var type = (MenuTypeEnum)(int.Parse(ddlType.SelectedValue));
            if (type == MenuTypeEnum.Detail)
            {
                trContent.Visible = true;
            }
            else
            {
                trContent.Visible = false;
            }
        }
    }
}