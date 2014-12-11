using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.MiddleTier.Service
{
    public class UserSessionManager
    {
        #region public methods

        public static void BuildSessionUserLogin(UserInfo model)
        {
            HttpContext.Current.Session.Add("UserId", model.UserId);
            HttpContext.Current.Session.Add("UserName", string.IsNullOrEmpty(model.RealName) == false ? model.RealName : model.LoginName);
            HttpContext.Current.Session.Add("UserType", (int)model.UserType);
        }

        public static void BuildSessionUserLogout()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.User = null;
        }

        public static bool IsUserLogin(out string userName, out UserTypeEnum userType)
        {
            bool flag = false;
            userName = string.Empty;
            userType = UserTypeEnum.Unspecified;
            if (HttpContext.Current.Session["UserId"] != null)
            {
                userName = HttpContext.Current.Session["UserName"].ToString();
                userType = (UserTypeEnum)(int.Parse(HttpContext.Current.Session["UserType"].ToString()));
                flag = true;
            }
            return flag;
        }

        public static UserInfoExt GetCurrentUser()
        {
            int userId = Convert.ToInt32(HttpContext.Current.Session["UserId"].ToString());
            return UserManager.LoadById(userId);
        }
        #endregion
    }
}
