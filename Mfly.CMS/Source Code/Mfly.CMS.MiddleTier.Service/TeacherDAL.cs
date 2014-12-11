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
    internal class TeacherDAL
    {
        #region private methods

        private static TeacherInfo assembleModel(DataRow row)
        {
            TeacherInfo model = new TeacherInfo()
            {
                TeacherId = DataUtility.GetInt(row, TeacherInfo.Column_TeacherId),
                RealName = DataUtility.GetString(row, TeacherInfo.Column_RealName),
                Profile = DataUtility.GetString(row, TeacherInfo.Column_Profile),
                UserId = DataUtility.GetInt(row, TeacherInfo.Column_UserId),
                PhotoAttachmentId = DataUtility.GetInt(row, TeacherInfo.Column_PhotoAttachmentId),
            };
            return model;
        }

        private static List<TeacherInfo> assembleModelList(DataTable table)
        {
            List<TeacherInfo> list = new List<TeacherInfo>();
            foreach (DataRow row in table.Rows)
            {
                TeacherInfo model = assembleModel(row);
                list.Add(model);
            }
            return list;
        }

        private static TeacherInfoExt assembleModelExt(DataRow row)
        {
            TeacherInfoExt model = new TeacherInfoExt()
            {
                TeacherId = DataUtility.GetInt(row, TeacherInfo.Column_TeacherId),
                RealName = DataUtility.GetString(row, TeacherInfo.Column_RealName),
                Profile = DataUtility.GetString(row, TeacherInfo.Column_Profile),
                UserId = DataUtility.GetInt(row, TeacherInfo.Column_UserId),
                PhotoAttachmentId = DataUtility.GetInt(row, TeacherInfo.Column_PhotoAttachmentId),
                PhotoAttachmentName = DataUtility.GetString(row, TeacherInfoExt.Column_PhotoAttachmentName),
            };
            return model;
        }

        private static List<TeacherInfoExt> assembleModelExtList(DataTable table)
        {
            List<TeacherInfoExt> list = new List<TeacherInfoExt>();
            foreach (DataRow row in table.Rows)
            {
                TeacherInfoExt model = assembleModelExt(row);
                list.Add(model);
            }
            return list;
        }

        #endregion

        #region internal methods

        internal static void save(TeacherInfo model)
        {
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Teacher_Save"))
            {
                euDatabase.AddParameter(cmd, "@TeacherId", SqlDbType.Int, ParameterDirection.InputOutput, string.Empty, DataRowVersion.Default, XTyper.PrepInt(model.TeacherId));
                euDatabase.AddInParameter(cmd, "@RealName", SqlDbType.NVarChar, XTyper.PrepString(model.RealName));
                euDatabase.AddInParameter(cmd, "@Profile", SqlDbType.NVarChar, XTyper.PrepString(model.Profile));
                euDatabase.AddInParameter(cmd, "@PhotoAttachmentId", SqlDbType.Int, XTyper.PrepInt(model.PhotoAttachmentId));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                euDatabase.ExecuteNonQuery(cmd);
                OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");

                switch (returnValue)
                {
                    case OperationEnum.RET_OK:
                    {
                        model.TeacherId = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "TeacherId"));
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

        internal static TeacherInfoExt loadById(int id)
        {
            TeacherInfoExt model = new TeacherInfoExt();
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Teacher_LoadById"))
            {
                euDatabase.AddInParameter(cmd, "@TeacherId", SqlDbType.Int, XTyper.PrepInt(id));
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

        internal static TeacherInfoExt loadByUserId(int userId)
        {
            TeacherInfoExt model = new TeacherInfoExt();
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Teacher_LoadByUserId"))
            {
                euDatabase.AddInParameter(cmd, "@UserId", SqlDbType.Int, XTyper.PrepInt(userId));
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
            using (DbCommand cmd = euDataBase.GetStoredProcCommand("Teacher_Delete"))
            {
                euDataBase.AddInParameter(cmd, "@TeacherId", SqlDbType.Int, XTyper.PrepInt(id));
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

        internal static List<TeacherInfoExt> list()
        {
            List<TeacherInfoExt> list = new List<TeacherInfoExt>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("TeacherList_Load"))
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

        internal static List<TeacherInfo> listWithPage(int startIndex, int pageSize, out int sumCount)
        {
            EUDatabase euDatabase = new EUDatabase();

            List<TeacherInfo> list = null;
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("TeacherList_LoadWithPage"))
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
