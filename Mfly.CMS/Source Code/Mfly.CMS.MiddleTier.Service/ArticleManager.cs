using System;
using System.Collections.Generic;
using System.Text;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.MiddleTier.Service
{
    public class ArticleManager
    {
        #region public methods

        public static void Save(ArticleInfo model)
        {
            ArticleDAL.save(model);
        }

        public static ArticleInfoExt LoadById(int id)
        {
            return ArticleDAL.loadById(id);
        }

        public static List<ArticleInfoExt> List(int menuId)
        {
            return ArticleDAL.list(menuId);
        }

        public static void Delete(int id)
        {
            ArticleDAL.delete(id);
        }

        public static List<ArticleInfoExt> ListWithPage(int startIndex, int pageSizes, int menuId, int userId, out int sumCount)
        {
            return ArticleDAL.listWithPage(startIndex, pageSizes, menuId, userId, out sumCount);
        }
        #endregion
    }
}
