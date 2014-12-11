using System;
using System.Web.UI;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.Admin.UI
{
    public class BasePage : Page
    {
        #region private variables

        private int? _userId = null;
        private UserTypeEnum _userType = UserTypeEnum.Unspecified;

        #endregion

        #region public properites

        public int? UserId
        {
            get
            {
                if (Session["UserId"] != null)
                {
                    _userId = int.Parse(Session["UserId"].ToString());
                }
                return _userId;
            }
        }

        public UserTypeEnum UserType
        {
            get
            {
                if (Session["UserType"] != null)
                {
                    _userType = (UserTypeEnum)int.Parse(Session["UserType"].ToString());
                }
                return _userType;
            }
        }

        public string UserName
        {
            get
            {
                if (Session["UserName"] != null)
                {
                    Session["UserName"].ToString();
                }
                return string.Empty;
            }
        }
        #endregion

        #region proteced override methods

        protected override void OnInit(EventArgs e)
        {
            if (UserId == null || UserType != UserTypeEnum.Admin)
            {
                Response.Redirect("~/Login.aspx?returnUrl=" + Request.Url.AbsoluteUri);
            }

            base.OnInit(e);
        }

        #endregion
    }
}