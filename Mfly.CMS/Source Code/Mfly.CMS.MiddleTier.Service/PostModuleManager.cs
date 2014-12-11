using System;
using System.Collections.Generic;
using System.Text;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.MiddleTier.Service
{
    public class PostModuleManager
    {
        #region public methods

        public static int Save(PostModuleInfo model)
        {
            return PostModuleDAL.save(model);
        }

        public static PostModuleInfo LoadById(int id)
        {
            return PostModuleDAL.loadById(id);
        }

        public static List<PostModuleInfo> List()
        {
            return PostModuleDAL.list();
        }

        public static void Delete(int id)
        {
            PostModuleDAL.delete(id);
        }

        public static List<PostModuleInfo> ListWithPage(int startIndex, int pageSizes, out int sumCount)
        {
            return PostModuleDAL.listWithPage(startIndex, pageSizes, out sumCount);
        }
        #endregion
    }
}
