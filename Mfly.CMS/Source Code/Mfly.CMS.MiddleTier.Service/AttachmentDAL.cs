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
    internal class AttachmentDAL
    {
        #region private methods
        
        private static AttachmentInfo assembleModel(DataRow row)
        {
            AttachmentInfo model = new AttachmentInfo()
            {
                AttachmentId = DataUtility.GetInt(row, AttachmentInfo.Column_AttachmentId),
                OriginalFileName = DataUtility.GetString(row, AttachmentInfo.Column_OriginalFileName),
                TargetFileName = DataUtility.GetGuid(row, AttachmentInfo.Column_TargetFileName),
                FileExtension = DataUtility.GetString(row, AttachmentInfo.Column_FileExtension),
                Content = DataUtility.GetBytes(row, AttachmentInfo.Column_Content),
            };
            return model;
        }

        private static List<AttachmentInfo> assembleModelList(DataTable table)
        {
            List<AttachmentInfo> list = new List<AttachmentInfo>();
            foreach (DataRow row in table.Rows)
            {
                AttachmentInfo model = assembleModel(row);
                list.Add(model);
            }
            return list;
        }
        
        #endregion
        
        #region internal methods

        internal static void save(AttachmentInfo model)
        {
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Attachment_Save"))
            {
                euDatabase.AddParameter(cmd, "@AttachmentId", SqlDbType.Int, ParameterDirection.InputOutput, string.Empty, DataRowVersion.Default, XTyper.PrepInt(model.AttachmentId));
                euDatabase.AddInParameter(cmd, "@OriginalFileName", SqlDbType.NVarChar, XTyper.PrepString(model.OriginalFileName));
                euDatabase.AddInParameter(cmd, "@FileExtension", SqlDbType.VarChar, XTyper.PrepString(model.FileExtension));
                euDatabase.AddInParameter(cmd, "@Content", SqlDbType.Binary, XTyper.PrepBytes(model.Content));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                euDatabase.ExecuteNonQuery(cmd);
                OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");

                switch (returnValue)
                {
                    case OperationEnum.RET_OK:
                    {
                        model.AttachmentId = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "AttachmentId"));
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

        internal static  AttachmentInfo loadById(int id)
        {
            AttachmentInfo model = new  AttachmentInfo();
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("Attachment_LoadById"))
            {
                euDatabase.AddInParameter(cmd, "@AttachmentId", SqlDbType.Int, XTyper.PrepInt(id));
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
            using (DbCommand cmd = euDataBase.GetStoredProcCommand("Attachment_Delete"))
            {
                euDataBase.AddInParameter(cmd, "@AttachmentId", SqlDbType.Int, XTyper.PrepInt(id));
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

        internal static List<AttachmentInfo> list()
        {
            List<AttachmentInfo> list = new List<AttachmentInfo>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("AttachmentList_Load"))
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
        
        internal static List<AttachmentInfo> listWithPage(int startIndex, int pageSize, out int sumCount)
        {
            EUDatabase euDatabase = new EUDatabase();

            List<AttachmentInfo> list = null;
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("AttachmentList_LoadWithPage"))
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
