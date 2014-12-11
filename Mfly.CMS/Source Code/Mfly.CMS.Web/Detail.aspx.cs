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
    public partial class Detail1 : System.Web.UI.Page
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
                initData();
            }
        }

        private void initData()
        {
            ArticleInfoExt model = null;
            if (ArticleId != 0)
            {
                model = ArticleManager.LoadById(ArticleId);
            }
            else if (MenuId != 0)
            {
                var list = ArticleManager.List(MenuId);
                if (list != null && list.Count > 0)
                {
                    model = list[0];
                }
            }

            if (model != null)
            {
                ltlTitle.Text = model.Title;
                if (model.Type == ArticleTypeEnum.Author)
                {
                    ucAutor.InitData(model);
                    ucAutor.Visible = true;
                }
                else
                {
                    ltlContent.Text = model.Content;
                }

                if (model.AttachmentId != 0 && model.Type != ArticleTypeEnum.Author)
                {
                    imgPic.Visible = true;
                    ControlHelper.SetImageUrl(model.AttachmentId, model.AttachmentName, imgPic);
                }
            }
        }
    }
}