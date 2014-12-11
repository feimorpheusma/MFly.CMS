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
    internal class PostModuleDAL
    {
        #region private methods
        
        private static PostModuleInfo assembleModel(DataRow row)
        {
            PostModuleInfo model = new PostModuleInfo()
            {
                PostModuleId = DataUtility.GetInt(row, PostModuleInfo.Column_PostModuleId),
                Name = DataUtility.GetString(row, PostModuleInfo.Column_Name),
                Description = DataUtility.GetString(row, PostModuleInfo.Column_Description),
            };
            return model;
        }

        private static List<PostModuleInfo> assembleModelList(DataTable table)
        {
            List<PostModuleInfo> list = new List<PostModuleInfo>();
            foreach (DataRow row in table.Rows)
            {
                PostModuleInfo model = assembleModel(row);
                list.Add(model);
            }
            return list;
        }
        
        #endregion
        
        #region internal methods

        internal static int save(PostModuleInfo model)
        {
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostModule_Save"))
            {
                euDatabase.AddParameter(cmd, "@PostModuleId", SqlDbType.Int, ParameterDirection.InputOutput, string.Empty, DataRowVersion.Default, XTyper.PrepInt(model.PostModuleId));
                euDatabase.AddInParameter(cmd, "@Name", SqlDbType.NVarChar, XTyper.PrepString(model.Name));
                euDatabase.AddInParameter(cmd, "@Description", SqlDbType.NVarChar, XTyper.PrepString(model.Description));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                euDatabase.ExecuteNonQuery(cmd);
                OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");

                switch (returnValue)
                {
                    case OperationEnum.RET_OK:
                    {
                        model.PostModuleId = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "PostModuleId"));
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
            return model.PostModuleId;
        }

        internal static  PostModuleInfo loadById(int id)
        {
            PostModuleInfo model = new  PostModuleInfo();
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostModule_LoadById"))
            {
                euDatabase.AddInParameter(cmd, "@PostModuleId", SqlDbType.Int, XTyper.PrepInt(id));
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
            using (DbCommand cmd = euDataBase.GetStoredProcCommand("PostModule_Delete"))
            {
                euDataBase.AddInParameter(cmd, "@PostModuleId", SqlDbType.Int, XTyper.PrepInt(id));
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

        internal static List<PostModuleInfo> list()
        {
            List<PostModuleInfo> list = new List<PostModuleInfo>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostModuleList_Load"))
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
        
        internal static List<PostModuleInfo> listWithPage(int startIndex, int pageSize, out int sumCount)
        {
            EUDatabase euDatabase = new EUDatabase();

            List<PostModuleInfo> list = null;
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("PostModuleList_LoadWithPage"))
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
