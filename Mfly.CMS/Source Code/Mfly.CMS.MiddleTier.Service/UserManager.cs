using System;
using System.Collections.Generic;
using System.Text;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.MiddleTier.Service
{
    public class UserManager
    {
        #region public methods

        public static void Save(UserInfo model)
        {
            UserDAL.save(model);
        }

        public static UserInfoExt LoadById(int id)
        {
            return UserDAL.loadById(id);
        }

        public static UserInfo LoadByLoginName(string loginName)
        {
            return UserDAL.loadByLoginName(loginName);
        }

        public static List<UserInfoExt> List()
        {
            return UserDAL.list();
        }

        public static void Delete(int id)
        {
            UserDAL.delete(id);
        }

        public static List<UserInfo> ListWithPage(int startIndex, int pageSizes,string loginName,string realName,int userStatus,bool IsAudit, out int sumCount)
        {
            return UserDAL.listWithPage(startIndex, pageSizes,loginName,realName,userStatus,IsAudit, out sumCount);
        }
        #endregion
    }
}
