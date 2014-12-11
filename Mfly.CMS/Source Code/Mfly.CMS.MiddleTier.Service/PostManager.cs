using System;
using System.Collections.Generic;
using System.Text;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.MiddleTier.Service
{
    public class PostManager
    {
        #region public methods

        public static void Save(PostInfo model)
        {
            PostDAL.save(model);
        }

        public static PostInfoExt LoadById(int id)
        {
            return PostDAL.loadById(id);
        }

        /// <summary>
        /// ��ȡ�����б�
        /// </summary>
        /// <param name="postId">��ǰ��¼�û�ID</param>
        /// <param name="typeId">typeId ֵ��Ϊ0�����ѯ��ǰ��¼�û������������ӣ�
        /// ֵ��Ϊ1�����ѯ��ǰ��¼�û����ظ���������</param>
        /// <returns></returns>
        public static List<PostInfoExt> List(string postUserName, string postTitle)
        {
            return PostDAL.list(postUserName, postTitle);
        }
        /// <summary>
        /// ��ȡ�����б�
        /// </summary>
        /// <param name="postUserName">����������</param>
        /// <param name="postTitle">����</param>
        /// <returns></returns>
        public static List<PostInfoExt> List(int userId, int typeId)
        {
            return PostDAL.list(userId, typeId);
        }

        public static void Delete(int id)
        {
            PostDAL.delete(id);
        }

        public static List<PostInfoExt> ListWithPage(int startIndex, int pageSizes, int userId, int typeId, out int sumCount)
        {
            return PostDAL.listWithPage(startIndex, pageSizes, userId, typeId, out sumCount);
        }

        public static List<PostInfoExt> ListWithPage(int startIndex, int pageSizes, string postUserName, string postTitle, out int sumCount)
        {
            return PostDAL.listWithPage(startIndex, pageSizes, postUserName, postTitle, out sumCount);
        }
        #endregion
    }
}
