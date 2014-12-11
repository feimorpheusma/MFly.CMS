using System;
using System.Collections.Generic;
using System.Text;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.MiddleTier.Service
{
    public class PostReplyManager
    {
        #region public methods

        public static void Save(PostReplyInfoExt model)
        {
             PostReplyDAL.save(model);
        }

        public static PostReplyInfoExt LoadById(int id)
        {
            return PostReplyDAL.loadById(id);
        }

        public static List<PostReplyInfoExt> List()
        {
            return PostReplyDAL.list();
        }

        public static List<PostReplyInfoExt> ListByPostId(int postId)
        {
            return PostReplyDAL.listByPostId(postId);
        }
        
        public static void Delete(int id)
        {
            PostReplyDAL.delete(id);
        }

        public static List<PostReplyInfoExt> ListWithPage(int startIndex, int pageSizes, out int sumCount)
        {
            return PostReplyDAL.listWithPage(startIndex, pageSizes, out sumCount);
        }
        #endregion
    }
}
