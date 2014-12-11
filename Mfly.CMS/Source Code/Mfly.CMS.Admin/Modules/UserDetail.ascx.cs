using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mfly.CMS.Utility;
using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.MiddleTier.Service;
using System.IO;
using System.Transactions;

namespace Mfly.CMS.Admin.Modules
{
    public partial class UserDetail : System.Web.UI.UserControl
    {
        #region public proterties

        public int? EmployeeId { get; set; }
        public int? UserId { get; set; }
        public CMS.Admin.SystemManage.User.UserDetail.ControlMode Mode;
        #endregion

        #region   public event
        public event EventHandler Transfer;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                initDropdownList();
                if (Mode != CMS.Admin.SystemManage.User.UserDetail.ControlMode.Add)
                {
                    initData();
                    trCalPassword.Visible = false;
                    trPassword.Visible = false;
                    cvalPassword.Enabled = false;
                }
            }
            txtPassword.Attributes.Add("value", txtPassword.Text);
            txtSurePassword.Attributes.Add("value", txtSurePassword.Text);
        }

        protected void CValidatorLoginName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = true;
            string loginName = txtLoginName.Text.Trim();
            if (string.IsNullOrEmpty(loginName) == true)
            {
                args.IsValid = false;
                valLoginName.ErrorMessage = "此项必填";
                return;
            }

            UserInfo userInfo = UserManager.LoadByLoginName(loginName);
            if (UserId == null)//新增
            {
                if (userInfo != null)
                {
                    args.IsValid = false;
                    valLoginName.ErrorMessage = "此用户名已经存在";
                    return;
                }
            }
            else
            {
                if (userInfo != null)
                {
                    if (userInfo.UserId != UserId)
                    {
                        args.IsValid = false;
                        valLoginName.ErrorMessage = "此用户名已经存在";
                        return;
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }
            UserInfoExt userInfo = new UserInfoExt();
            AttachmentInfo attachment = null;
            using (TransactionScope ts = new TransactionScope())
            {
                if (Mode == CMS.Admin.SystemManage.User.UserDetail.ControlMode.Add)//新增
                {
                    userInfo.PasswordSalt = CMS.Utility.DES.GenerateSalt();
                    userInfo.Password = CMS.Utility.DES.Encrypt(this.txtPassword.Text.Trim(), userInfo.PasswordSalt);
                    userInfo.CreatedDate = DateTime.Now;
                    userInfo.UserType = UserTypeEnum.Normal;
                    if (fuPhoto.HasFile == true)
                    {
                        attachment = getAttachment(fuPhoto);
                    }
                    if (attachment != null)
                    {
                        AttachmentManager.Save(attachment);
                        userInfo.PhotoAttachmentId = attachment.AttachmentId;
                    }
                }
                else
                {
                    userInfo = UserManager.LoadById(UserId.Value);
                    if (fuPhoto.HasFile == true)
                    {
                        attachment = getAttachment(fuPhoto);
                    }
                    if (attachment != null)
                    {
                        if (userInfo.PhotoAttachmentId == 0)
                        {
                            AttachmentManager.Save(attachment);
                            userInfo.PhotoAttachmentId = attachment.AttachmentId;
                        }
                        else
                        {
                            attachment.AttachmentId = userInfo.PhotoAttachmentId;
                            AttachmentManager.Save(attachment);
                        }
                    }
                }
                userInfo.LoginName = txtLoginName.Text.Trim();
                userInfo.RealName = txtRealName.Text.Trim();
                userInfo.Gender = (GendTypeEnum)Convert.ToInt32(rblGender.SelectedValue);
                userInfo.Birthday = txtBirthday.Text.Trim() == string.Empty ? Convert.ToDateTime("1900-01-01") : Convert.ToDateTime(txtBirthday.Text.Trim());
                userInfo.QQ = txtQQ.Text.Trim();
                userInfo.MSN = txtMSN.Text.Trim();
                userInfo.Phone = txtPhoneNumber.Text.Trim();
                userInfo.Email = txtEmail.Text.Trim();
                userInfo.Position = txtPosition.Text.Trim();
                userInfo.Hobby = txtHobby.Text.Trim();
                userInfo.Signature = txtSignature.Text.Trim();
                userInfo.CompanyEmail = txtCompanyEmail.Text.Trim();
                userInfo.CompanyHomepage = txtCompanyHomepage.Text.Trim();
                userInfo.CompanyIndustry = txtCompanyIndustry.Text.Trim();
                userInfo.CompanyName = txtCompanyName.Text.Trim();
                userInfo.CompanyProfile = txtCompanyProfile.Text.Trim();
                userInfo.CompanyTel = txtCompanyTel.Text.Trim();
                userInfo.UserStatus = (UserStatusEnum)Convert.ToInt32(ddlStatus.SelectedValue.ToString());
                userInfo.UserId = (UserId.HasValue == false) ? 0 : UserId.Value;
                UserManager.Save(userInfo);
                ts.Complete();
                if (Transfer != null)
                {
                    Transfer(this, e);
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (Transfer != null)
            {
                Transfer(this, e);
            }
        }

        private void initDropdownList()
        {
            ddlStatus.Items.Clear();
            this.ddlStatus.Items.Add(new ListItem(XEnum.GetDescription(UserStatusEnum.Active), ((int)UserStatusEnum.Active).ToString()));
            this.ddlStatus.Items.Add(new ListItem(XEnum.GetDescription(UserStatusEnum.Locked), ((int)UserStatusEnum.Locked).ToString()));
        }

        private AttachmentInfo getAttachment(FileUpload fileUpload)
        {
            AttachmentInfo model = new AttachmentInfo();
            try
            {
                Stream fs = fileUpload.FileContent;
                byte[] byData = new byte[fs.Length];
                fs.Read(byData, 0, byData.Length);
                fs.Close();
                string fileName = fileUpload.FileName;
                string fileType = Path.GetExtension(fileName);
                model.OriginalFileName = Path.GetFileNameWithoutExtension(fileName);
                model.FileExtension = fileType;
                model.Content = byData;
            }
            catch (Exception e)
            {
                throw e;
            }

            return model;
        }

        private void initData()
        {
            var model = UserManager.LoadById(UserId.Value);
            txtLoginName.Text = model.LoginName;
            txtRealName.Text = model.RealName;
            rblGender.SelectedValue = Convert.ToInt32(model.Gender).ToString();
            if (model.Birthday.ToString("yyyy-MM-dd") == "0001-01-01" || model.Birthday.ToString("yyyy-MM-dd") == "1900-01-01")
            {
                txtBirthday.Text = string.Empty;
            }
            else
            {
                txtBirthday.Text = model.Birthday.ToString("yyyy-MM-dd");
            }
            txtQQ.Text = model.QQ;
            txtMSN.Text = model.MSN;
            txtPhoneNumber.Text = model.Phone;
            txtEmail.Text = model.Email;
            txtPosition.Text = model.Position;
            txtHobby.Text = model.Hobby;
            txtSignature.Text = model.Signature;
            txtCompanyName.Text = model.CompanyName;
            txtCompanyIndustry.Text = model.CompanyIndustry;
            txtCompanyProfile.Text = model.CompanyProfile;
            txtCompanyTel.Text = model.CompanyTel;
            txtCompanyHomepage.Text = model.CompanyHomepage;
            txtCompanyEmail.Text = model.CompanyEmail;
        }

        protected void CValidatorBirthday_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dt = DateTime.Now;
            if (!string.IsNullOrEmpty(this.txtBirthday.Text.Trim()))
            {
                if (DateTime.TryParse(txtBirthday.Text.Trim(), out dt) == false || txtBirthday.Text.Contains("-") == false)
                {
                    CValidatorBirthday.ErrorMessage = "请输入正确的日期，格式为yyyy-mm-dd";
                    args.IsValid = false;
                    return;
                }
            }
            args.IsValid = true;
        }

        protected void CValidatorImage_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = true;
            if (fuPhoto.HasFile == true)
            {
                string fileType = Path.GetExtension(fuPhoto.FileName);

                string[] fileTypeList = new string[] { ".jpg", ".bmp", ".gif", ".png", ".jpeg" };
                if (fileTypeList.Contains(fileType.ToLower()) == false)
                {
                    args.IsValid = false;
                    CValidatorImage.ErrorMessage = "请选择.jpg, .jpeg, .gif, .png, .bmp格式的图片";
                    return;
                }

                if (fuPhoto.PostedFile.ContentLength > 1000000)
                {
                    args.IsValid = false;
                    CValidatorImage.ErrorMessage = "请上传1MB以内的图片";
                    return;
                }
            }
        }
    }
}