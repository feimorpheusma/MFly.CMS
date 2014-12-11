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
    internal class ArticleDAL
    {
        #region private methods

        private static ArticleInfo assembleModel(DataRow row)
        {
            ArticleInfo model = new ArticleInfo()
            {
                ArticleId = DataUtility.GetInt(row, ArticleInfo.Column_ArticleId),
                MenuId = DataUtility.GetInt(row, ArticleInfo.Column_MenuId),
                Title = DataUtility.GetString(row, ArticleInfo.Column_Title),
                Content = DataUtility.GetString(row, ArticleInfo.Column_Content),
                CreatedDate = DataUtility.GetDateTime(row, ArticleInfo.Column_CreatedDate),
                Source = DataUtility.GetString(row, ArticleInfo.Column_Source),
                Type = (ArticleTypeEnum)DataUtility.GetInt(row, ArticleInfo.Column_Type),
                Views = DataUtility.GetInt(row, ArticleInfo.Column_Views),
                CreatedByUserId = DataUtility.GetInt(row, ArticleInfo.Column_CreatedByUserId),
                Author = DataUtility.GetString(row, ArticleInfo.Column_Author),
            };
            return model;
        }

        private static ArticleInfoExt assembleModelExt(DataRow row)
        {
            ArticleInfoExt model = new ArticleInfoExt()
            {
                ArticleId = DataUtility.GetInt(row, ArticleInfoExt.Column_ArticleId),
                MenuId = DataUtility.GetInt(row, ArticleInfoExt.Column_MenuId),
                Title = DataUtility.GetString(row, ArticleInfoExt.Column_Title),
                Content = DataUtility.GetString(row, ArticleInfoExt.Column_Content),
                CreatedDate = DataUtility.GetDateTime(row, ArticleInfoExt.Column_CreatedDate),
                Source = DataUtility.GetString(row, ArticleInfoExt.Column_Source),
                Type = (ArticleTypeEnum)DataUtility.GetInt(row, ArticleInfoExt.Column_Type),
                Views = DataUtility.GetInt(row, ArticleInfoExt.Column_Views),
                CreatedByUserId = DataUtility.GetInt(row, ArticleInfoExt.Column_CreatedByUserId),
                Author = DataUtility.GetString(row, ArticleInfoExt.Column_Author),
                AttachmentId = DataUtility.GetInt(row, ArticleInfoExt.Column_AttachmentId),
                AttachmentName = DataUtility.GetString(row, ArticleInfoExt.Column_AttachmentName),
                AttachmentType = DataUtility.GetInt(row, ArticleInfoExt.Column_AttachmentType),
                RealName = DataUtility.GetString(row, ArticleInfoExt.Column_RealName),
                ArticleAttachmentId = DataUtility.GetInt(row, ArticleInfoExt.Column_ArticleAttachmentId),
                MenuName = DataUtility.GetString(row, ArticleInfoExt.Column_MenuName),
            };
            return model;
        }

        private static List<ArticleInfo> assembleModelList(DataTable table)
        {
            List<ArticleInfo> list = new List<ArticleInfo>();
            foreach (DataRow row in table.Rows)
            {
                ArticleInfo model = assembleModel(row);
                list.Add(model);
            }
            return list;
        }

        private static List<ArticleInfoExt> assembleModelExtList(DataTable table)
        {
            List<ArticleInfoExt> list = new List<ArticleInfoExt>();
            foreach (DataRow row in table.Rows)
            {
                ArticleInfoExt model = assembleModelExt(row);
                list.Add(model);
            }
            return list;
        }

        #endregion

        #region internal methods

        internal static void save(ArticleInfo model)
        {
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Article_Save"))
            {
                euDatabase.AddParameter(cmd, "@ArticleId", SqlDbType.Int, ParameterDirection.InputOutput, string.Empty, DataRowVersion.Default, XTyper.PrepInt(model.ArticleId));
                euDatabase.AddInParameter(cmd, "@MenuId", SqlDbType.Int, XTyper.PrepInt(model.MenuId));
                euDatabase.AddInParameter(cmd, "@Title", SqlDbType.NVarChar, XTyper.PrepString(model.Title));
                euDatabase.AddInParameter(cmd, "@Content", SqlDbType.Text, XTyper.PrepString(model.Content));
                euDatabase.AddInParameter(cmd, "@CreatedDate", SqlDbType.DateTime, XTyper.PrepDateTime(model.CreatedDate));
                euDatabase.AddInParameter(cmd, "@Source", SqlDbType.NVarChar, XTyper.PrepString(model.Source));
                euDatabase.AddInParameter(cmd, "@Type", SqlDbType.Int, XTyper.PrepInt((int)model.Type));
                euDatabase.AddInParameter(cmd, "@Views", SqlDbType.Int, XTyper.PrepInt(model.Views));
                euDatabase.AddInParameter(cmd, "@CreatedByUserId", SqlDbType.Int, XTyper.PrepInt(model.CreatedByUserId));
                euDatabase.AddInParameter(cmd, "@Author", SqlDbType.NVarChar, XTyper.PrepString(model.Author));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                euDatabase.ExecuteNonQuery(cmd);
                OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");

                switch (returnValue)
                {
                    case OperationEnum.RET_OK:
                    {
                        model.ArticleId = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "ArticleId"));
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

        internal static ArticleInfoExt loadById(int id)
        {
            ArticleInfoExt model = new ArticleInfoExt();
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Article_LoadById"))
            {
                euDatabase.AddInParameter(cmd, "@ArticleId", SqlDbType.Int, XTyper.PrepInt(id));
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
            using (DbCommand cmd = euDataBase.GetStoredProcCommand("Article_Delete"))
            {
                euDataBase.AddInParameter(cmd, "@ArticleId", SqlDbType.Int, XTyper.PrepInt(id));
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

        internal static List<ArticleInfoExt> list(int menuId)
        {
            List<ArticleInfoExt> list = new List<ArticleInfoExt>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("ArticleList_Load"))
            {
                euDatabase.AddInParameter(cmd, "@MenuId", SqlDbType.Int, XTyper.PrepInt(menuId));
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

        internal static List<ArticleInfoExt> listWithPage(int startIndex, int pageSize, int menuId, int userId, out int sumCount)
        {
            EUDatabase euDatabase = new EUDatabase();

            List<ArticleInfoExt> list = new List<ArticleInfoExt>();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("ArticleList_LoadWithPage"))
            {
                sumCount = 0;
                euDatabase.AddInParameter(cmd, "@StartIndex", SqlDbType.Int, startIndex);
                euDatabase.AddInParameter(cmd, "@PageSize", SqlDbType.Int, pageSize);
                euDatabase.AddInParameter(cmd, "@MenuId", SqlDbType.Int, menuId);
                euDatabase.AddInParameter(cmd, "@UserId", SqlDbType.Int, userId);
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
