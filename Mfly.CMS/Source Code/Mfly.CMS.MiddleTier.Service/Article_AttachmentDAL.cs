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
    internal class Article_AttachmentDAL
    {
        #region private methods

        private static Article_AttachmentInfo assembleModel(DataRow row)
        {
            Article_AttachmentInfo model = new Article_AttachmentInfo()
            {
                ArticleAttachmentId = DataUtility.GetInt(row, Article_AttachmentInfo.Column_ArticleAttachmentId),
                ArticleId = DataUtility.GetInt(row, Article_AttachmentInfo.Column_ArticleId),
                AttachmentId = DataUtility.GetInt(row, Article_AttachmentInfo.Column_AttachmentId),
                Type = (ImageTypeEnum)DataUtility.GetInt(row, Article_AttachmentInfo.Column_Type),
                Description  = DataUtility.GetString(row, Article_AttachmentInfo.Column_Description),
            };
            return model;
        }
        private static Article_AttachmentInfoExt assembleModelExt(DataRow row)
        {
            Article_AttachmentInfoExt model = new Article_AttachmentInfoExt()
            {
                ArticleAttachmentId = DataUtility.GetInt(row, Article_AttachmentInfo.Column_ArticleAttachmentId),
                ArticleId = DataUtility.GetInt(row, Article_AttachmentInfo.Column_ArticleId),
                AttachmentId = DataUtility.GetInt(row, Article_AttachmentInfo.Column_AttachmentId),
                Type = (ImageTypeEnum)DataUtility.GetInt(row, Article_AttachmentInfo.Column_Type),
                AttachmentName = DataUtility.GetString(row, ArticleInfoExt.Column_AttachmentName),
                Description = DataUtility.GetString(row, Article_AttachmentInfo.Column_Description),
            };
            return model;
        }
        private static List<Article_AttachmentInfo> assembleModelList(DataTable table)
        {
            List<Article_AttachmentInfo> list = new List<Article_AttachmentInfo>();
            foreach (DataRow row in table.Rows)
            {
                Article_AttachmentInfo model = assembleModel(row);
                list.Add(model);
            }
            return list;
        }
        private static List<Article_AttachmentInfoExt> assembleModelListExt(DataTable table)
        {
            List<Article_AttachmentInfoExt> list = new List<Article_AttachmentInfoExt>();
            foreach (DataRow row in table.Rows)
            {
                Article_AttachmentInfoExt model = assembleModelExt(row);
                list.Add(model);
            }
            return list;
        }

        #endregion

        #region internal methods

        internal static void save(Article_AttachmentInfo model)
        {
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Article_Attachment_Save"))
            {
                euDatabase.AddParameter(cmd, "@ArticleAttachmentId", SqlDbType.Int, ParameterDirection.InputOutput, string.Empty, DataRowVersion.Default, XTyper.PrepInt(model.ArticleAttachmentId));
                euDatabase.AddInParameter(cmd, "@ArticleId", SqlDbType.Int, XTyper.PrepInt(model.ArticleId));
                euDatabase.AddInParameter(cmd, "@AttachmentId", SqlDbType.Int, XTyper.PrepInt(model.AttachmentId));
                euDatabase.AddInParameter(cmd, "@Type", SqlDbType.Int, XTyper.PrepInt((int)model.Type));
                euDatabase.AddInParameter(cmd, "@Description", SqlDbType.NVarChar, XTyper.PrepString(model.Description));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                euDatabase.ExecuteNonQuery(cmd);
                OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");

                switch (returnValue)
                {
                    case OperationEnum.RET_OK:
                        {
                            model.ArticleAttachmentId = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "ArticleAttachmentId"));
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

        internal static Article_AttachmentInfoExt loadById(int id)
        {
            Article_AttachmentInfoExt model = new Article_AttachmentInfoExt();
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Article_Attachment_LoadById"))
            {
                euDatabase.AddInParameter(cmd, "@ArticleAttachmentId", SqlDbType.Int, XTyper.PrepInt(id));
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
            using (DbCommand cmd = euDataBase.GetStoredProcCommand("Article_Attachment_Delete"))
            {
                euDataBase.AddInParameter(cmd, "@ArticleAttachmentId", SqlDbType.Int, XTyper.PrepInt(id));
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

        internal static List<Article_AttachmentInfoExt> list(int articleId)
        {
            List<Article_AttachmentInfoExt> list = new List<Article_AttachmentInfoExt>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Article_AttachmentList_Load"))
            {
                euDatabase.AddInParameter(cmd, "@ArticleId", SqlDbType.Int, articleId);
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
                                    list = assembleModelListExt(table);
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

        internal static List<Article_AttachmentInfo> listWithPage(int startIndex, int pageSize, out int sumCount)
        {
            EUDatabase euDatabase = new EUDatabase();

            List<Article_AttachmentInfo> list = null;
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Article_AttachmentList_LoadWithPage"))
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
