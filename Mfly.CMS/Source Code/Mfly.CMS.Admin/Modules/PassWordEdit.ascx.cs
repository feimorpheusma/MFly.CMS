using System;
using System.Web.UI;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.Admin.Modules
{
    public partial class PassWordEdit : System.Web.UI.UserControl
    {
        #region  protect
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        #endregion

        private int _userId = 0;
        /// <summary>
        /// 记录用户ID
        /// </summary>
        public int UserId
        {
            get
            {
                if (_userId == 0 && ViewState["Uid"] != null)
                {
                    _userId = Convert.ToInt32(ViewState["Uid"]);
                }
                return _userId;
            }
            set
            {
                ViewState["Uid"] = value;
                _userId = value;
            }
        }
        #region public
        public void RestPwd()
        {
            string PasswordSalt = Mfly.CMS.Utility.DES.GenerateSalt();
            string password = string.Empty;
            password = Mfly.CMS.Utility.DES.Encrypt(this.txtNewWord.Text.Trim(), PasswordSalt);
            UserInfo user = new UserInfo();
            user = UserManager.LoadById(Convert.ToInt32(UserId));
            user.UserId = Convert.ToInt32(UserId);
            user.Password = password;
            user.PasswordSalt = PasswordSalt;
            UserManager.Save(user);
        }
        #endregion

    }
}