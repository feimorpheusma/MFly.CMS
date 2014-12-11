using System;
using System.Collections.Generic;
using System.Text;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.MiddleTier.Service
{
    public class Article_AttachmentManager
    {
        #region public methods

        public static void Save(Article_AttachmentInfo model)
        {
            Article_AttachmentDAL.save(model);
        }

        public static Article_AttachmentInfoExt LoadById(int id)
        {
            return Article_AttachmentDAL.loadById(id);
        }

        public static List<Article_AttachmentInfoExt> List(int articleId)
        {
            return Article_AttachmentDAL.list(articleId);
        }

        public static void Delete(int id)
        {
            Article_AttachmentDAL.delete(id);
        }

        public static List<Article_AttachmentInfo> ListWithPage(int startIndex, int pageSizes, out int sumCount)
        {
            return Article_AttachmentDAL.listWithPage(startIndex, pageSizes, out sumCount);
        }
        #endregion
    }
}
