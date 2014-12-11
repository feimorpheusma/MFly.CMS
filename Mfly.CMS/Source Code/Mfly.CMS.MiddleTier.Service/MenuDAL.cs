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
    internal class MenuDAL
    {
        #region private methods

        private static MenuInfo assembleModel(DataRow row)
        {
            MenuInfo model = new MenuInfo()
            {
                MenuId = DataUtility.GetInt(row, MenuInfo.Column_MenuId),
                ParentMenuId = DataUtility.GetInt(row, MenuInfo.Column_ParentMenuId),
                Name = DataUtility.GetString(row, MenuInfo.Column_Name),
                Level = (MenuLevelEnum)DataUtility.GetInt(row, MenuInfo.Column_Level),
                Key = DataUtility.GetString(row, MenuInfo.Column_Key),
                Type = (MenuTypeEnum)DataUtility.GetInt(row, MenuInfo.Column_Type),
                Page = DataUtility.GetString(row, MenuInfo.Column_Page),
                URL = DataUtility.GetString(row, MenuInfo.Column_URL),
                Visable = DataUtility.GetBoolean(row, MenuInfo.Column_Visable),
                IsDeleted = DataUtility.GetBoolean(row, MenuInfo.Column_IsDeleted),
            };
            return model;
        }

        private static List<MenuInfo> assembleModelList(DataTable table)
        {
            List<MenuInfo> list = new List<MenuInfo>();
            foreach (DataRow row in table.Rows)
            {
                MenuInfo model = assembleModel(row);
                list.Add(model);
            }
            return list;
        }

        #endregion

        #region internal methods

        internal static void save(MenuInfo model)
        {
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Menu_Save"))
            {
                euDatabase.AddParameter(cmd, "@MenuId", SqlDbType.Int, ParameterDirection.InputOutput, string.Empty, DataRowVersion.Default, XTyper.PrepInt(model.MenuId));
                euDatabase.AddInParameter(cmd, "@ParentMenuId", SqlDbType.Int, XTyper.PrepInt(model.ParentMenuId));
                euDatabase.AddInParameter(cmd, "@Name", SqlDbType.NVarChar, XTyper.PrepString(model.Name));
                euDatabase.AddInParameter(cmd, "@Level", SqlDbType.Int, XTyper.PrepInt((int)model.Level));
                euDatabase.AddInParameter(cmd, "@Key", SqlDbType.NVarChar, XTyper.PrepString(model.Key));
                euDatabase.AddInParameter(cmd, "@Type", SqlDbType.Int, XTyper.PrepInt((int)model.Type));
                euDatabase.AddInParameter(cmd, "@Page", SqlDbType.NVarChar, XTyper.PrepString(model.Page));
                euDatabase.AddInParameter(cmd, "@URL", SqlDbType.NVarChar, XTyper.PrepString(model.URL));
                euDatabase.AddInParameter(cmd, "@Visable", SqlDbType.Bit, XTyper.PrepNullableBoolean(model.Visable));
                euDatabase.AddInParameter(cmd, "@IsDeleted", SqlDbType.Bit, XTyper.PrepNullableBoolean(model.IsDeleted));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                euDatabase.ExecuteNonQuery(cmd);
                OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");

                switch (returnValue)
                {
                    case OperationEnum.RET_OK:
                        {
                            model.MenuId = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "MenuId"));
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

        internal static MenuInfo loadById(int id)
        {
            MenuInfo model = new MenuInfo();
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Menu_LoadById"))
            {
                euDatabase.AddInParameter(cmd, "@MenuId", SqlDbType.Int, XTyper.PrepInt(id));
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
            using (DbCommand cmd = euDataBase.GetStoredProcCommand("Menu_Delete"))
            {
                euDataBase.AddInParameter(cmd, "@MenuId", SqlDbType.Int, XTyper.PrepInt(id));
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

        internal static List<MenuInfo> list()
        {
            List<MenuInfo> list = new List<MenuInfo>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("MenuList_Load"))
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

        internal static List<MenuInfo> listWithPage(int startIndex, int pageSize, out int sumCount)
        {
            EUDatabase euDatabase = new EUDatabase();

            List<MenuInfo> list = null;
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("MenuList_LoadWithPage"))
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
