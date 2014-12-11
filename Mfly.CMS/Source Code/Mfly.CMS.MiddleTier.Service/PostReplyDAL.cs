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
    internal class PostReplyDAL
    {
        #region private methods

        private static PostReplyInfoExt assembleModel(DataRow row)
        {
            PostReplyInfoExt model = new PostReplyInfoExt()
            {
                PostReplyId = DataUtility.GetInt(row, PostReplyInfoExt.Column_PostReplyId),
                PostId = DataUtility.GetInt(row, PostReplyInfoExt.Column_PostId),
                Content = DataUtility.GetString(row, PostReplyInfoExt.Column_Content),
                CreatedDate = DataUtility.GetDateTime(row, PostReplyInfoExt.Column_CreatedDate),
                Status = (PostReplyStatusEnum)DataUtility.GetInt(row, PostReplyInfoExt.Column_Status),
                CreatedByUserId = DataUtility.GetInt(row, PostReplyInfoExt.Column_CreatedByUserId),
                OrderNum = DataUtility.GetInt(row, PostReplyInfoExt.Column_OrderNum),
                UserId = DataUtility.GetInt(row, PostInfoExt.Column_UserId),
                LoginName = DataUtility.GetString(row, PostInfoExt.Column_LoginName),
                RealName = DataUtility.GetString(row, PostInfoExt.Column_RealName),
                PhotoAttachmentId = DataUtility.GetInt(row, PostInfoExt.Column_PhotoAttachmentId),
                PhotoAttachmentName = DataUtility.GetString(row, PostInfoExt.Column_PhotoAttachmentName),
            };
            return model;
        }

        private static List<PostReplyInfoExt> assembleModelList(DataTable table)
        {
            List<PostReplyInfoExt> list = new List<PostReplyInfoExt>();
            foreach (DataRow row in table.Rows)
            {
                PostReplyInfoExt model = assembleModel(row);
                list.Add(model);
            }
            return list;
        }

        #endregion

        #region internal methods

        internal static void save(PostReplyInfoExt model)
        {
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostReply_Save"))
            {
                euDatabase.AddParameter(cmd, "@PostReplyId", SqlDbType.Int, ParameterDirection.InputOutput, string.Empty, DataRowVersion.Default, XTyper.PrepInt(model.PostReplyId));
                euDatabase.AddInParameter(cmd, "@PostId", SqlDbType.Int, XTyper.PrepNullableInt(model.PostId));
                euDatabase.AddInParameter(cmd, "@Content", SqlDbType.Text, XTyper.PrepString(model.Content));
                euDatabase.AddInParameter(cmd, "@CreatedDate", SqlDbType.DateTime, XTyper.PrepDateTime(model.CreatedDate));
                euDatabase.AddInParameter(cmd, "@Status", SqlDbType.Int, XTyper.PrepNullableInt((int)model.Status));
                euDatabase.AddInParameter(cmd, "@CreatedByUserId", SqlDbType.Int, XTyper.PrepNullableInt(model.CreatedByUserId));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                euDatabase.ExecuteNonQuery(cmd);
                OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");

                switch (returnValue)
                {
                    case OperationEnum.RET_OK:
                    {
                        model.PostReplyId = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "PostReplyId"));
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

        internal static PostReplyInfoExt loadById(int id)
        {
            PostReplyInfoExt model = new PostReplyInfoExt();
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostReply_LoadById"))
            {
                euDatabase.AddInParameter(cmd, "@PostReplyId", SqlDbType.Int, XTyper.PrepInt(id));
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
                                model = assembleModel(table.Rows[0]);
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
            using (DbCommand cmd = euDataBase.GetStoredProcCommand("PostReply_Delete"))
            {
                euDataBase.AddInParameter(cmd, "@PostReplyId", SqlDbType.Int, XTyper.PrepInt(id));
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

        internal static List<PostReplyInfoExt> list()
        {
            List<PostReplyInfoExt> list = new List<PostReplyInfoExt>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostReplyList_Load"))
            {
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
                                list = assembleModelList(table);
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

        internal static List<PostReplyInfoExt> listByPostId(int postId)
        {
            List<PostReplyInfoExt> list = new List<PostReplyInfoExt>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostReplyList_LoadByPostId"))
            {
                euDatabase.AddInParameter(cmd, "@postId", SqlDbType.Int, XTyper.PrepNullableInt(postId));
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
                                table.Columns.Add("OrderNum", typeof(int));

                                for (int i = 0; i < table.Rows.Count; i++)
                                {
                                    table.Rows[i]["OrderNum"] = i + 1;
                                }

                                list = assembleModelList(table);
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

        internal static List<PostReplyInfoExt> listWithPage(int startIndex, int pageSize, out int sumCount)
        {
            EUDatabase euDatabase = new EUDatabase();

            List<PostReplyInfoExt> list = null;
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostReplyList_LoadWithPage"))
            {
                sumCount = 0;
                euDatabase.AddInParameter(cmd, "@StartIndex", SqlDbType.Int, startIndex);
                euDatabase.AddInParameter(cmd, "@PageSize", SqlDbType.Int, pageSize);
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
                                list = assembleModelList(table);
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
