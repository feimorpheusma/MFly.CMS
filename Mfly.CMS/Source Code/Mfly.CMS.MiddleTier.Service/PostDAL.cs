using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.Utility;
using Mfly.CMS.MiddleTier.Service.CustomizedException;

namespace Mfly.CMS.MiddleTier.Service
{
    internal class PostDAL
    {
        #region private methods

        private static PostInfoExt assembleModelExt(DataRow row)
        {
            PostInfoExt model = new PostInfoExt()
            {
                PostId = DataUtility.GetInt(row, PostInfoExt.Column_PostId),
                Title = DataUtility.GetString(row, PostInfoExt.Column_Title),
                Content = DataUtility.GetString(row, PostInfoExt.Column_Content),
                Status = (PostStatusEnum)DataUtility.GetInt(row, PostInfoExt.Column_Status),
                CreatedDate = DataUtility.GetDateTime(row, PostInfoExt.Column_CreatedDate),
                Views = DataUtility.GetInt(row, PostInfoExt.Column_Views),
                CreatedByUserId = DataUtility.GetInt(row, PostInfoExt.Column_CreatedByUserId),
                PostModuleId = DataUtility.GetInt(row, PostInfoExt.Column_PostModuleId),
                OrderStatus = (PostOrderStatusEnum)DataUtility.GetInt(row, PostInfoExt.Column_OrderStatus),
                UserId = DataUtility.GetInt(row, PostInfoExt.Column_UserId),
                LoginName = DataUtility.GetString(row, PostInfoExt.Column_LoginName),
                RealName = DataUtility.GetString(row, PostInfoExt.Column_RealName),
                PhotoAttachmentId = DataUtility.GetInt(row, PostInfoExt.Column_PhotoAttachmentId),
                PhotoAttachmentName = DataUtility.GetString(row, PostInfoExt.Column_PhotoAttachmentName),
                ReplyCount = DataUtility.GetInt(row, PostInfoExt.Column_ReplyCount),
                LastReplyDateTime = DataUtility.GetDateTime(row, PostInfoExt.Column_LastReplyDateTime),
                PostModuleName = DataUtility.GetString(row, PostInfoExt.Column_PostModuleName),
            };
            return model;
        }

        private static List<PostInfoExt> assembleModelExtList(DataTable table)
        {
            List<PostInfoExt> list = new List<PostInfoExt>();
            foreach (DataRow row in table.Rows)
            {
                PostInfoExt model = assembleModelExt(row);
                list.Add(model);
            }
            return list;
        }

        #endregion

        #region internal methods

        internal static void save(PostInfo model)
        {
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Post_Save"))
            {
                euDatabase.AddParameter(cmd, "@PostId", SqlDbType.Int, ParameterDirection.InputOutput, string.Empty, DataRowVersion.Default, XTyper.PrepInt(model.PostId));
                euDatabase.AddInParameter(cmd, "@Title", SqlDbType.NVarChar, XTyper.PrepString(model.Title));
                euDatabase.AddInParameter(cmd, "@Content", SqlDbType.Text, XTyper.PrepString(model.Content));
                euDatabase.AddInParameter(cmd, "@Status", SqlDbType.Int, XTyper.PrepNullableInt((int)model.Status));
                euDatabase.AddInParameter(cmd, "@CreatedDate", SqlDbType.DateTime, XTyper.PrepDateTime(model.CreatedDate));
                euDatabase.AddInParameter(cmd, "@Views", SqlDbType.Int, XTyper.PrepNullableInt(model.Views));
                euDatabase.AddInParameter(cmd, "@CreatedByUserId", SqlDbType.Int, XTyper.PrepNullableInt(model.CreatedByUserId));
                euDatabase.AddInParameter(cmd, "@PostModuleId", SqlDbType.Int, XTyper.PrepNullableInt(model.PostModuleId));
                euDatabase.AddInParameter(cmd, "@OrderStatus", SqlDbType.Int, XTyper.PrepNullableInt((int)model.OrderStatus));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                euDatabase.ExecuteNonQuery(cmd);
                OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");

                switch (returnValue)
                {
                    case OperationEnum.RET_OK:
                        {
                            model.PostId = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "PostId"));
                            break;
                        }
                    case OperationEnum.RET_ENTITYNOTFOUND:
                        {
                            throw new EntityNotFoundException();
                        }
                    default:
                        {
                            throw new DataException();
                        }
                }
            }
        }

        internal static PostInfoExt loadById(int id)
        {
            PostInfoExt model = new PostInfoExt();
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Post_LoadById"))
            {
                euDatabase.AddInParameter(cmd, "@PostId", SqlDbType.Int, XTyper.PrepInt(id));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                using (IDataReader reader = euDatabase.ExecuteReader(cmd))
                {
                    DataTable table = new DataTable();
                    table.Load(reader);

                    OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");
                    switch (returnValue)
                    {
                        case OperationEnum.RET_OK:
                            {
                                if (table.Rows.Count > 0)
                                {
                                    model = assembleModelExt(table.Rows[0]);
                                }
                                break;
                            }
                        case OperationEnum.RET_ENTITYNOTFOUND:
                            {
                                throw new EntityNotFoundException();
                            }
                        default:
                            {
                                throw new DataException();
                            }
                    }
                }
            }
            return model;
        }

        internal static void delete(int id)
        {
            EUDatabase euDataBase = new EUDatabase();
            using (DbCommand cmd = euDataBase.GetStoredProcCommand("Post_Delete"))
            {
                euDataBase.AddInParameter(cmd, "@PostId", SqlDbType.Int, XTyper.PrepInt(id));
                euDataBase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                euDataBase.ExecuteNonQuery(cmd);
                OperationEnum returnValue = (OperationEnum)euDataBase.GetParameterValue(cmd, "RETURN_VALUE");

                switch (returnValue)
                {
                    case OperationEnum.RET_OK:
                        {
                            break;
                        }
                    case OperationEnum.RET_ENTITYNOTFOUND:
                        {
                            throw new EntityNotFoundException();
                        }
                    case OperationEnum.RET_ENTITYINUSE:
                        {
                            throw new EntityInUseException();
                        }
                    default:
                        {
                            throw new DataException();
                        }
                }
            }
        }

        /// <summary>
        /// 获取帖子列表
        /// </summary>
        /// <param name="postId">当前登录用户ID</param>
        /// <param name="typeId">typeId 值若为0，则查询当前登录用户所发布的帖子；
        /// 值若为1，则查询当前登录用户所回复过的帖子</param>
        /// <returns></returns>
        internal static List<PostInfoExt> list(int userId, int typeId)
        {
            List<PostInfoExt> list = new List<PostInfoExt>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostList_Load"))
            {
                euDatabase.AddInParameter(cmd, "@userId", SqlDbType.Int, XTyper.PrepNullableInt(userId));
                euDatabase.AddInParameter(cmd, "@type", SqlDbType.Int, XTyper.PrepNullableInt(typeId));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                using (IDataReader reader = euDatabase.ExecuteReader(cmd))
                {
                    DataTable table = new DataTable();
                    table.Load(reader);

                    OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");
                    switch (returnValue)
                    {
                        case OperationEnum.RET_OK:
                            {
                                if (table.Rows.Count > 0)
                                {
                                    list = assembleModelExtList(table);
                                }
                                break;
                            }
                        default:
                            {
                                throw new DataException();
                            }
                    }
                }
            }
            return list;
        }

        /// <summary>
        /// 获取帖子列表
        /// </summary>
        /// <param name="postUserName">发帖人名称</param>
        /// <param name="postTitle">标题</param>
        /// <returns></returns>
        internal static List<PostInfoExt> list(string postUserName, string postTitle)
        {
            List<PostInfoExt> list = new List<PostInfoExt>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostListBy_Load"))
            {
                euDatabase.AddInParameter(cmd, "@UserName", SqlDbType.NVarChar, postUserName);
                euDatabase.AddInParameter(cmd, "@title", SqlDbType.NVarChar, postTitle);
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                using (IDataReader reader = euDatabase.ExecuteReader(cmd))
                {
                    DataTable table = new DataTable();
                    table.Load(reader);

                    OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");
                    switch (returnValue)
                    {
                        case OperationEnum.RET_OK:
                            {
                                if (table.Rows.Count > 0)
                                {
                                    list = assembleModelExtList(table);
                                }
                                break;
                            }
                        default:
                            {
                                throw new DataException();
                            }
                    }
                }
            }
            return list;
        }

        internal static List<PostInfoExt> listWithPage(int startIndex, int pageSize, int userId, int typeId, out int sumCount)
        {
            EUDatabase euDatabase = new EUDatabase();

            List<PostInfoExt> list = null;
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostList_LoadWithPage"))
            {
                sumCount = 0;
                euDatabase.AddInParameter(cmd, "@StartIndex", SqlDbType.Int, startIndex);
                euDatabase.AddInParameter(cmd, "@PageSize", SqlDbType.Int, pageSize);
                euDatabase.AddInParameter(cmd, "@userId", SqlDbType.Int, XTyper.PrepNullableInt(userId));
                euDatabase.AddInParameter(cmd, "@type", SqlDbType.Int, XTyper.PrepNullableInt(typeId));
                euDatabase.AddParameter(cmd, "@SumCount", SqlDbType.Int, ParameterDirection.Output, string.Empty, DataRowVersion.Default, XTyper.PrepInt(sumCount));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                using (IDataReader reader = euDatabase.ExecuteReader(cmd))
                {
                    DataTable table = new DataTable();
                    table.Load(reader);
                    OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");
                    switch (returnValue)
                    {
                        case OperationEnum.RET_OK:
                            {
                                if (table.Rows.Count > 0)
                                {
                                    sumCount = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "SumCount"));
                                    list = assembleModelExtList(table);
                                }
                                break;
                            }
                        default:
                            {
                                throw new DataException();
                            }
                    }
                }
            }
            return list;
        }

        internal static List<PostInfoExt> listWithPage(int startIndex, int pageSize, string postUserName, string postTitle, out int sumCount)
        {
            EUDatabase euDatabase = new EUDatabase();

            List<PostInfoExt> list = null;
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostListBy_LoadWithPage"))
            {
                sumCount = 0;
                euDatabase.AddInParameter(cmd, "@StartIndex", SqlDbType.Int, startIndex);
                euDatabase.AddInParameter(cmd, "@PageSize", SqlDbType.Int, pageSize);
                euDatabase.AddInParameter(cmd, "@UserName", SqlDbType.NVarChar, postUserName);
                euDatabase.AddInParameter(cmd, "@title", SqlDbType.NVarChar, postTitle);
                euDatabase.AddParameter(cmd, "@SumCount", SqlDbType.Int, ParameterDirection.Output, string.Empty, DataRowVersion.Default, XTyper.PrepInt(sumCount));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                using (IDataReader reader = euDatabase.ExecuteReader(cmd))
                {
                    DataTable table = new DataTable();
                    table.Load(reader);
                    OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");
                    switch (returnValue)
                    {
                        case OperationEnum.RET_OK:
                            {
                                if (table.Rows.Count > 0)
                                {
                                    sumCount = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "SumCount"));
                                    list = assembleModelExtList(table);
                                }
                                break;
                            }
                        default:
                            {
                                throw new DataException();
                            }
                    }
                }
            }
            return list;
        }
        #endregion
    }
}
