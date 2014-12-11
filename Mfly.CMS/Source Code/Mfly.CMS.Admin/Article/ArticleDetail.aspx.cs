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
using Mfly.CMS.Admin.App_Code;

namespace Mfly.CMS.Admin.Article
{
    public partial class ArticleDetail : BasePage
    {
        #region
        private int _articleId = 0;
        private int _pageIndex = 0;
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
                if (ArticleId != 0)
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
            ArticleInfoExt model = null;
            AttachmentInfo attachmentInfo = null;
            if (ArticleId != 0)
            {
                model = ArticleManager.LoadById(ArticleId);
                if (model.AttachmentId != 0)
                {
                    attachmentInfo = AttachmentManager.LoadById(model.AttachmentId);
                }
            }
            else
            {
                model = new ArticleInfoExt();
                model.CreatedByUserId = (int)UserId;//TODO：修改为当前登录用户
                model.CreatedDate = DateTime.Now;
                model.Views = 0;

            }
            model.MenuId = int.Parse(ddlMenu.SelectedValue);
            model.Title = txtTitle.Text.Trim();
            model.Type = (ArticleTypeEnum)Convert.ToInt32(ddlNewsType.SelectedValue.ToString());

            if (model.Type == ArticleTypeEnum.Author)
            {
                model.Source = txtSource.Text.Trim();
                model.Author = txtTitle.Text.Trim();
                model.Content = FormatHelper.RemoveHTMLTag(htmlEditor.Text);
            }
            else
            {
                model.Source = txtSource.Text.Trim();
                model.Author = txtAuthor.Text.Trim();
                model.Content = htmlEditor.Text;
            }
            if (ImageFile.HasFile == true)
            {
                if (ArticleId == 0 || model.AttachmentId == 0)
                {
                    attachmentInfo = new AttachmentInfo();
                }
                getAttachment(attachmentInfo);
            }
            using (TransactionScope ts = new TransactionScope())
            {
                try
                {
                    ArticleManager.Save(model);
                    if (attachmentInfo != null)
                    {
                        AttachmentManager.Save(attachmentInfo);
                        if (ArticleId == 0 || model.AttachmentId == 0)
                        {
                            Article_AttachmentInfo articleAttachmentInfo = new Article_AttachmentInfo();
                            articleAttachmentInfo.ArticleId = model.ArticleId;
                            articleAttachmentInfo.AttachmentId = attachmentInfo.AttachmentId;
                            articleAttachmentInfo.Type = ImageTypeEnum.DefaultPicture;
                            Article_AttachmentManager.Save(articleAttachmentInfo);
                        }
                    }

                    ts.Complete();
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
            Response.Redirect(String.Format("ArticleList.aspx?pi={0}", PageIndex));
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("ArticleList.aspx?pi={0}", PageIndex));
        }


        protected void CValidatorImage_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = true;
            if (ImageFile.HasFile == true)
            {
                string fileType = Path.GetExtension(ImageFile.FileName);

                string[] fileTypeList = new string[] { ".jpg", ".bmp", ".gif", ".png", ".jpeg" };
                if (fileTypeList.Contains(fileType.ToLower()) == false)
                {
                    args.IsValid = false;
                    CValidatorImage.ErrorMessage = "请选择.jpg, .jpeg, .gif, .png, .bmp格式的图片";
                    return;
                }

                if (ImageFile.PostedFile.ContentLength > 1000000)
                {
                    args.IsValid = false;
                    CValidatorImage.ErrorMessage = "请上传1MB以内的图片";
                    return;
                }
            }
        }


        #endregion

        #region
        private void initDropdownList()
        {
            ddlNewsType.Items.Add(new ListItem(XEnum.GetDescription(ArticleTypeEnum.Unspecified), ((int)ArticleTypeEnum.Unspecified).ToString()));
            ddlNewsType.Items.Add(new ListItem(XEnum.GetDescription(ArticleTypeEnum.Author), ((int)ArticleTypeEnum.Author).ToString()));
            ddlNewsType.Items.Add(new ListItem(XEnum.GetDescription(ArticleTypeEnum.Collections), ((int)ArticleTypeEnum.Collections).ToString()));
            ddlNewsType.Items.Add(new ListItem(XEnum.GetDescription(ArticleTypeEnum.Article), ((int)ArticleTypeEnum.Article).ToString()));

            if (ArticleId == 0)
            {
                var list = MenuManager.MenuList.Where(obj => obj.Level == MenuLevelEnum.Second && obj.Type != MenuTypeEnum.Detail);
                ddlMenu.DataSource = list;
            }
            else
            {
                var list = MenuManager.MenuList.Where(obj => obj.Level == MenuLevelEnum.Second);
                ddlMenu.DataSource = list;
            }
            ddlMenu.DataTextField = "Name";
            ddlMenu.DataValueField = "MenuId";
            ddlMenu.DataBind();
            ddlMenu.Items.Insert(0, new ListItem("请选择", "0"));
        }

        private void initData()
        {
            var articleInfo = ArticleManager.LoadById(ArticleId);

            txtAuthor.Text = articleInfo.Author;
            txtSource.Text = articleInfo.Source;
            txtTitle.Text = articleInfo.Title;
            htmlEditor.Text = articleInfo.Content;
            ddlNewsType.SelectedValue = ((int)articleInfo.Type).ToString();
            ddlMenu.SelectedValue = articleInfo.MenuId.ToString();
            ddlMenu.Enabled = false;
        }

        private void clearText()
        {
            txtTitle.Text = "";
            txtAuthor.Text = "";
            txtSource.Text = "";
            ddlNewsType.SelectedIndex = 0;
            htmlEditor.Text = string.Empty;
        }

        private void getAttachment(AttachmentInfo model)
        {
            try
            {
                Stream fs = ImageFile.FileContent;
                byte[] byData = new byte[fs.Length];
                fs.Read(byData, 0, byData.Length);
                fs.Close();
                string fileName = ImageFile.FileName;
                string fileType = Path.GetExtension(fileName);
                model.OriginalFileName = Path.GetFileNameWithoutExtension(fileName);
                model.FileExtension = fileType;
                model.Content = byData;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        #endregion
    }
}