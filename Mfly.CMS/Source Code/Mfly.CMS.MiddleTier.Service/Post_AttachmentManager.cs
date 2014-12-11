using System;
using System.Collections.Generic;
using System.Text;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.MiddleTier.Service
{
    public class Post_AttachmentManager
    {
        #region public methods

        public static void Save(Post_AttachmentInfo model)
        {
            Post_AttachmentDAL.save(model);
        }

        public static Post_AttachmentInfo LoadById(int id)
        {
            return Post_AttachmentDAL.loadById(id);
        }

        public static List<Post_AttachmentInfo> List()
        {
            return Post_AttachmentDAL.list();
        }

        public static void Delete(int id)
        {
            Post_AttachmentDAL.delete(id);
        }

        public static List<Post_AttachmentInfo> ListWithPage(int startIndex, int pageSizes, out int sumCount)
        {
            return Post_AttachmentDAL.listWithPage(startIndex, pageSizes, out sumCount);
        }
        #endregion
    }
}
