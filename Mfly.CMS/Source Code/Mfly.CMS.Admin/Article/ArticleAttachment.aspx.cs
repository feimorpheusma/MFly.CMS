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
    public partial class ArticleAttachment : BasePage
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
                if (ArticleId != 0)
                {
                    bindGrid();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == false)
            {
                return;
            }
            if (ImageFile.HasFile == true)
            {
                Article_AttachmentInfo model = new Article_AttachmentInfo();
                model.ArticleId = ArticleId;
                model.Type = ImageTypeEnum.AuthorPicture;
                model.Description = htmlEditor.Text;
                AttachmentInfo attachmentInfo = new AttachmentInfo();
                getAttachment(attachmentInfo);

                using (TransactionScope ts = new TransactionScope())
                {
                    try
                    {
                        AttachmentManager.Save(attachmentInfo);

                        model.AttachmentId = attachmentInfo.AttachmentId;
                        Article_AttachmentManager.Save(model);

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
                bindGrid();
                //Response.Redirect(String.Format("ArticleList.aspx?pi={0}", PageIndex));
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(String.Format("ArticleList.aspx?pi={0}", PageIndex));
        }

        protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "DeleteAttachment":
                    {
                        int articleAttachmentId = Convert.ToInt32(e.CommandArgument);
                        bool success = false;
                        try
                        {
                            var model = Article_AttachmentManager.LoadById(articleAttachmentId);
                            using (TransactionScope ts = new TransactionScope())
                            {
                                AttachmentManager.Delete(model.AttachmentId);
                                Article_AttachmentManager.Delete(model.ArticleAttachmentId);
                                success = true;
                            }
                            if (success == true)
                            {
                                ControlHelper.DeleteImage(model.AttachmentName);
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(this.Page, ex.ToString());
                        }
                        bindGrid();
                        break;
                    }
                default:
                    {
                        break;
                    }
            }
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
            else
            {
                args.IsValid = false;
                CValidatorImage.ErrorMessage = "请选择需要上传的图片";
            }
        }


        #endregion

        #region
        private void bindGrid()
        {
            var list = Article_AttachmentManager.List(ArticleId).Where(obj => obj.Type == ImageTypeEnum.AuthorPicture);
            gvList.DataSource = list;
            gvList.DataBind();
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

        protected void gvList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var model = e.Row.DataItem as Article_AttachmentInfoExt;
                var imgPic = e.Row.FindControl("imgPic") as Image;
                ControlHelper.SetImageUrl(model.AttachmentId, model.AttachmentName, imgPic);
            }
        }
    }
}