using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mfly.CMS.Web.App_Code;

namespace Web
{
    public partial class ImageList1 : System.Web.UI.Page
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
                litMenuName.Text = MenuManager.LoadById(MenuId).Name;
                bindGrid();
            }
        }

        private void bindGrid()
        {
            var list = ArticleManager.List(MenuId);

            rptList.DataSource = list;
            rptList.DataBind();
        }

        protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
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
    }
}