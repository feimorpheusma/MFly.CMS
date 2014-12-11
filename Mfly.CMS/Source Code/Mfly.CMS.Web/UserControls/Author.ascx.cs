using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.Web.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.UserControls
{
    public partial class Author : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void InitData(ArticleInfoExt model)
        {
            ltlContent.Text = model.Content;
            ltlAuthorName.Text = model.Author;
            ltlSource.Text = model.Source;
            if (model.AttachmentId != 0)
            {
                ControlHelper.SetImageUrl(model.AttachmentId, model.AttachmentName, imgPic);
            }
            var list = Article_AttachmentManager.List(model.ArticleId).Where(obj => obj.Type == ImageTypeEnum.AuthorPicture);
            rptList.DataSource = list;
            rptList.DataBind();
        }

        protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var model = e.Item.DataItem as Article_AttachmentInfoExt;
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