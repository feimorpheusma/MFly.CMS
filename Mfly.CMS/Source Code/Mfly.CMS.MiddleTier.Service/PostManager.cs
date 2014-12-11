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
        /// 获取帖子列表
        /// </summary>
        /// <param name="postId">当前登录用户ID</param>
        /// <param name="typeId">typeId 值若为0，则查询当前登录用户所发布的帖子；
        /// 值若为1，则查询当前登录用户所回复过的帖子</param>
        /// <returns></returns>
        public static List<PostInfoExt> List(string postUserName, string postTitle)
        {
            return PostDAL.list(postUserName, postTitle);
        }
        /// <summary>
        /// 获取帖子列表
        /// </summary>
        /// <param name="postUserName">发帖人名称</param>
        /// <param name="postTitle">标题</param>
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
