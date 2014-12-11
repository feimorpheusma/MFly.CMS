using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.Utility;
using Mfly.CMS.MiddleTier.Service.CustomizedException;

namespace Mfly.CMS.Admin
{
    public partial class login : Page
    {
        #region private variables

        private string ReturnURL
        {
            get
            {
                string URL = Request["returnUrl"];
                if (string.IsNullOrEmpty(URL) == false)
                {
                    return URL;
                }
                else
                {
                    return "Default.aspx";
                }
            }
        }

        #endregion
        #region protecd methods

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                HttpCookie Cookie = CookiesHelper.GetCookie("UserInfo");
                if (Cookie != null)
                {
                    txtUserName.Text = Cookie.Values["UserName"];
                }
                UserSessionManager.BuildSessionUserLogout();
            }
            txtPassword.Text = "1";
            txtUserName.Text = "admin";
            //btnLogin_Click(null, null);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserInfo model;
            if (check(out model) == false)
            {
                return;
            }
            UserSessionManager.BuildSessionUserLogin(model);

            if (cbxSaveUser.Checked == true)
            {
                setCookie();
            }

            Response.Redirect(ReturnURL);
        }
        #endregion

        #region private methods

        private bool check(out UserInfo model)
        {
            var loginName = txtUserName.Text;
            var password = txtPassword.Text;

            model = null;
            var flag = true;
            if (string.IsNullOrEmpty(loginName) == true)
            {
                lblUserNameError.Text = "请输入用户名";
                flag = false;
            }
            if (string.IsNullOrEmpty(password) == true)
            {
                lblUserNameError.Text = "请输入密码";
                flag = false;
            }
            if (flag == false)
            {
                return flag;
            }

            model = UserManager.LoadByLoginName(loginName);

            if (model == null)
            {
                lblUserNameError.Text = "该用户名不存在";
                flag = false;
            }
            else if (model.UserStatus == UserStatusEnum.Locked)
            {
                lblUserNameError.Text = "该用户被禁止";
                flag = false;
            }
            else if (model.UserType != UserTypeEnum.Admin)
            {
                lblUserNameError.Text = "该用户没有权限";
                flag = false;
            }
            else if (DES.Encrypt(password, model.PasswordSalt) != model.Password)
            {
                lblUserNameError.Text = "用户密码不正确";
                flag = false;
            }
            return flag;
        }

        private void setCookie()
        {
            string userName = txtUserName.Text.Trim();
            HttpCookie Cookie = CookiesHelper.GetCookie("UserInfo");
            if (Cookie == null)
            {
                Cookie = new HttpCookie("UserInfo");
                Cookie.Values.Add("UserName", userName);
                //设置Cookie过期时间
                Cookie.Expires = DateTime.Now.AddDays(365);
                CookiesHelper.AddCookie(Cookie);
            }
            else if (!Cookie.Values["UserName"].Equals(userName))
                CookiesHelper.SetCookie("UserInfo", "UserName", userName);
        }

        #endregion
    }
}