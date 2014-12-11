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
    internal class Post_AttachmentDAL
    {
        #region private methods
        
        private static Post_AttachmentInfo assembleModel(DataRow row)
        {
            Post_AttachmentInfo model = new Post_AttachmentInfo()
            {
                PostAttachmentId = DataUtility.GetInt(row, Post_AttachmentInfo.Column_PostAttachmentId),
                PostId = DataUtility.GetInt(row, Post_AttachmentInfo.Column_PostId),
                AttachmentId = DataUtility.GetInt(row, Post_AttachmentInfo.Column_AttachmentId),
                Type = DataUtility.GetInt(row, Post_AttachmentInfo.Column_Type),
            };
            return model;
        }

        private static List<Post_AttachmentInfo> assembleModelList(DataTable table)
        {
            List<Post_AttachmentInfo> list = new List<Post_AttachmentInfo>();
            foreach (DataRow row in table.Rows)
            {
                Post_AttachmentInfo model = assembleModel(row);
                list.Add(model);
            }
            return list;
        }
        
        #endregion
        
        #region internal methods

        internal static void save(Post_AttachmentInfo model)
        {
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Post_Attachment_Save"))
            {
                euDatabase.AddParameter(cmd, "@PostAttachmentId", SqlDbType.Int, ParameterDirection.InputOutput, string.Empty, DataRowVersion.Default, XTyper.PrepInt(model.PostAttachmentId));
                euDatabase.AddInParameter(cmd, "@PostId", SqlDbType.Int, XTyper.PrepInt(model.PostId));
                euDatabase.AddInParameter(cmd, "@AttachmentId", SqlDbType.Int, XTyper.PrepInt(model.AttachmentId));
                euDatabase.AddInParameter(cmd, "@Type", SqlDbType.Int, XTyper.PrepInt(model.Type));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                euDatabase.ExecuteNonQuery(cmd);
                OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");

                switch (returnValue)
                {
                    case OperationEnum.RET_OK:
                    {
                        model.PostAttachmentId = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "PostAttachmentId"));
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

        internal static  Post_AttachmentInfo loadById(int id)
        {
            Post_AttachmentInfo model = new  Post_AttachmentInfo();
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Post_Attachment_LoadById"))
            {
                euDatabase.AddInParameter(cmd, "@PostAttachmentId", SqlDbType.Int, XTyper.PrepInt(id));
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
            using (DbCommand cmd = euDataBase.GetStoredProcCommand("Post_Attachment_Delete"))
            {
                euDataBase.AddInParameter(cmd, "@PostAttachmentId", SqlDbType.Int, XTyper.PrepInt(id));
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

        internal static List<Post_AttachmentInfo> list()
        {
            List<Post_AttachmentInfo> list = new List<Post_AttachmentInfo>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Post_AttachmentList_Load"))
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
        
        internal static List<Post_AttachmentInfo> listWithPage(int startIndex, int pageSize, out int sumCount)
        {
            EUDatabase euDatabase = new EUDatabase();

            List<Post_AttachmentInfo> list = null;
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Post_AttachmentList_LoadWithPage"))
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
