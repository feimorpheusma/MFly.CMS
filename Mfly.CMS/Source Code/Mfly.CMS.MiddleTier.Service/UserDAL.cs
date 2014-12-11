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
    internal class UserDAL
    {
        #region private methods

        private static UserInfo assembleModel(DataRow row)
        {
            UserInfo model = new UserInfo()
            {
                UserId = DataUtility.GetInt(row, UserInfo.Column_UserId),
                LoginName = DataUtility.GetString(row, UserInfo.Column_LoginName),
                RealName = DataUtility.GetString(row, UserInfo.Column_RealName),
                Password = DataUtility.GetString(row, UserInfo.Column_Password),
                PasswordSalt = DataUtility.GetString(row, UserInfo.Column_PasswordSalt),
                Gender = (GendTypeEnum)DataUtility.GetInt(row, UserInfo.Column_Gender),
                Birthday = DataUtility.GetDateTime(row, UserInfo.Column_Birthday),
                QQ = DataUtility.GetString(row, UserInfo.Column_QQ),
                MSN = DataUtility.GetString(row, UserInfo.Column_MSN),
                Phone = DataUtility.GetString(row, UserInfo.Column_Phone),
                Email = DataUtility.GetString(row, UserInfo.Column_Email),
                CompanyName = DataUtility.GetString(row, UserInfo.Column_CompanyName),
                Position = DataUtility.GetString(row, UserInfo.Column_Position),
                IsDeleted = DataUtility.GetBoolean(row, UserInfo.Column_IsDeleted),
                UserType = (UserTypeEnum)DataUtility.GetInt(row, UserInfo.Column_UserType),
                CreatedDate = DataUtility.GetDateTime(row, UserInfo.Column_CreatedDate),
                PhotoAttachmentId = DataUtility.GetInt(row, UserInfo.Column_PhotoAttachmentId),
                CompanyProfile = DataUtility.GetString(row, UserInfo.Column_CompanyProfile),
                CompanyTel = DataUtility.GetString(row, UserInfo.Column_CompanyTel),
                CompanyHomepage = DataUtility.GetString(row, UserInfo.Column_CompanyHomepage),
                CompanyEmail = DataUtility.GetString(row, UserInfo.Column_CompanyEmail),
                CompanyIndustry = DataUtility.GetString(row, UserInfo.Column_CompanyIndustry),
                UserStatus = (UserStatusEnum)DataUtility.GetInt(row, UserInfo.Column_UserStatus),
                Hobby = DataUtility.GetString(row, UserInfo.Column_Hobby),
                Signature = DataUtility.GetString(row, UserInfo.Column_Signature),
                IsAudit = DataUtility.GetBoolean(row, UserInfo.Column_IsAudit),
            };
            return model;
        }

        private static List<UserInfo> assembleModelList(DataTable table)
        {
            List<UserInfo> list = new List<UserInfo>();
            foreach (DataRow row in table.Rows)
            {
                UserInfo model = assembleModel(row);
                list.Add(model);
            }
            return list;
        }

        private static UserInfoExt assembleModelExt(DataRow row)
        {
            UserInfoExt model = new UserInfoExt()
            {
                UserId = DataUtility.GetInt(row, UserInfo.Column_UserId),
                LoginName = DataUtility.GetString(row, UserInfo.Column_LoginName),
                RealName = DataUtility.GetString(row, UserInfo.Column_RealName),
                Password = DataUtility.GetString(row, UserInfo.Column_Password),
                PasswordSalt = DataUtility.GetString(row, UserInfo.Column_PasswordSalt),
                Gender = (GendTypeEnum)DataUtility.GetInt(row, UserInfo.Column_Gender),
                Birthday = DataUtility.GetDateTime(row, UserInfo.Column_Birthday),
                QQ = DataUtility.GetString(row, UserInfo.Column_QQ),
                MSN = DataUtility.GetString(row, UserInfo.Column_MSN),
                Phone = DataUtility.GetString(row, UserInfo.Column_Phone),
                Email = DataUtility.GetString(row, UserInfo.Column_Email),
                CompanyName = DataUtility.GetString(row, UserInfo.Column_CompanyName),
                Position = DataUtility.GetString(row, UserInfo.Column_Position),
                IsDeleted = DataUtility.GetBoolean(row, UserInfo.Column_IsDeleted),
                UserType = (UserTypeEnum)DataUtility.GetInt(row, UserInfo.Column_UserType),
                CreatedDate = DataUtility.GetDateTime(row, UserInfo.Column_CreatedDate),
                PhotoAttachmentId = DataUtility.GetInt(row, UserInfo.Column_PhotoAttachmentId),
                CompanyProfile = DataUtility.GetString(row, UserInfo.Column_CompanyProfile),
                CompanyTel = DataUtility.GetString(row, UserInfo.Column_CompanyTel),
                CompanyHomepage = DataUtility.GetString(row, UserInfo.Column_CompanyHomepage),
                CompanyEmail = DataUtility.GetString(row, UserInfo.Column_CompanyEmail),
                CompanyIndustry = DataUtility.GetString(row, UserInfo.Column_CompanyIndustry),
                UserStatus = (UserStatusEnum)DataUtility.GetInt(row, UserInfo.Column_UserStatus),
                Hobby = DataUtility.GetString(row, UserInfo.Column_Hobby),
                Signature = DataUtility.GetString(row, UserInfo.Column_Signature),
                PhotoAttachmentName = DataUtility.GetString(row, UserInfoExt.Column_PhotoAttachmentName),
                IsAudit = DataUtility.GetBoolean(row, UserInfo.Column_IsAudit),
            };
            return model;
        }

        private static List<UserInfoExt> assembleModelExtList(DataTable table)
        {
            List<UserInfoExt> list = new List<UserInfoExt>();
            foreach (DataRow row in table.Rows)
            {
                UserInfoExt model = assembleModelExt(row);
                list.Add(model);
            }
            return list;
        }

        #endregion

        #region internal methods

        internal static void save(UserInfo model)
        {
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("User_Save"))
            {
                euDatabase.AddParameter(cmd, "@UserId", SqlDbType.Int, ParameterDirection.InputOutput, string.Empty, DataRowVersion.Default, XTyper.PrepInt(model.UserId));
                euDatabase.AddInParameter(cmd, "@LoginName", SqlDbType.NVarChar, XTyper.PrepString(model.LoginName));
                euDatabase.AddInParameter(cmd, "@RealName", SqlDbType.NVarChar, XTyper.PrepString(model.RealName));
                euDatabase.AddInParameter(cmd, "@Password", SqlDbType.VarChar, XTyper.PrepString(model.Password));
                euDatabase.AddInParameter(cmd, "@PasswordSalt", SqlDbType.VarChar, XTyper.PrepString(model.PasswordSalt));
                euDatabase.AddInParameter(cmd, "@Gender", SqlDbType.Int, XTyper.PrepInt((int)model.Gender));
                euDatabase.AddInParameter(cmd, "@Birthday", SqlDbType.DateTime, XTyper.PrepDateTime(model.Birthday));
                euDatabase.AddInParameter(cmd, "@QQ", SqlDbType.VarChar, XTyper.PrepString(model.QQ));
                euDatabase.AddInParameter(cmd, "@MSN", SqlDbType.VarChar, XTyper.PrepString(model.MSN));
                euDatabase.AddInParameter(cmd, "@Phone", SqlDbType.VarChar, XTyper.PrepString(model.Phone));
                euDatabase.AddInParameter(cmd, "@Email", SqlDbType.VarChar, XTyper.PrepString(model.Email));
                euDatabase.AddInParameter(cmd, "@CompanyName", SqlDbType.NVarChar, XTyper.PrepString(model.CompanyName));
                euDatabase.AddInParameter(cmd, "@Position", SqlDbType.NVarChar, XTyper.PrepString(model.Position));
                euDatabase.AddInParameter(cmd, "@IsDeleted", SqlDbType.Bit, XTyper.PrepNullableBoolean(model.IsDeleted));
                euDatabase.AddInParameter(cmd, "@UserType", SqlDbType.Int, XTyper.PrepInt((int)model.UserType));
                euDatabase.AddInParameter(cmd, "@CreatedDate", SqlDbType.DateTime, XTyper.PrepDateTime(model.CreatedDate));
                euDatabase.AddInParameter(cmd, "@PhotoAttachmentId", SqlDbType.Int, XTyper.PrepInt(model.PhotoAttachmentId));
                euDatabase.AddInParameter(cmd, "@CompanyProfile", SqlDbType.Text, XTyper.PrepString(model.CompanyProfile));
                euDatabase.AddInParameter(cmd, "@CompanyTel", SqlDbType.VarChar, XTyper.PrepString(model.CompanyTel));
                euDatabase.AddInParameter(cmd, "@CompanyHomepage", SqlDbType.VarChar, XTyper.PrepString(model.CompanyHomepage));
                euDatabase.AddInParameter(cmd, "@CompanyEmail", SqlDbType.VarChar, XTyper.PrepString(model.CompanyEmail));
                euDatabase.AddInParameter(cmd, "@CompanyIndustry", SqlDbType.NVarChar, XTyper.PrepString(model.CompanyIndustry));
                euDatabase.AddInParameter(cmd, "@UserStatus", SqlDbType.Int, XTyper.PrepInt((int)model.UserStatus));
                euDatabase.AddInParameter(cmd, "@Hobby", SqlDbType.NVarChar, XTyper.PrepString(model.Hobby));
                euDatabase.AddInParameter(cmd, "@Signature", SqlDbType.NVarChar, XTyper.PrepString(model.Signature));
                euDatabase.AddInParameter(cmd, "@IsAudit", SqlDbType.Bit, XTyper.PrepNullableBoolean(model.IsAudit));
                euDatabase.AddParameter(cmd, "RETURN_VALUE", SqlDbType.Int, ParameterDirection.ReturnValue, string.Empty, DataRowVersion.Default, null);
                euDatabase.ExecuteNonQuery(cmd);
                OperationEnum returnValue = (OperationEnum)euDatabase.GetParameterValue(cmd, "RETURN_VALUE");

                switch (returnValue)
                {
                    case OperationEnum.RET_OK:
                    {
                        model.UserId = Convert.ToInt32(euDatabase.GetParameterValue(cmd, "UserId"));
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

        internal static UserInfoExt loadById(int id)
        {
            UserInfoExt model = new UserInfoExt();
            EUDatabase euDatabase = new EUDatabase();
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("User_LoadById"))
            {
                euDatabase.AddInParameter(cmd, "@UserId", SqlDbType.Int, XTyper.PrepInt(id));
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

        internal static UserInfo loadByLoginName(string loginName)
        {
            EUDatabase euDatabase = new EUDatabase();

            UserInfo userInfo = null;
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("User_LoadByLoginName"))
            {
                euDatabase.AddInParameter(cmd, "@LoginName", SqlDbType.NVarChar, XTyper.PrepString(loginName));
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
                                userInfo = assembleModel(table.Rows[0]);
                            }
                            break;
                        }
                        case OperationEnum.RET_ENTITYNOTFOUND:
                        {
                            return null;
                        }
                        default:
                        {
                            throw new DataException();
                        }
                    }
                }
            }
            return userInfo;
        }

        internal static void delete(int id)
        {
            EUDatabase euDataBase = new EUDatabase();
            using (DbCommand cmd = euDataBase.GetStoredProcCommand("User_Delete"))
            {
                euDataBase.AddInParameter(cmd, "@UserId", SqlDbType.Int, XTyper.PrepInt(id));
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

        internal static List<UserInfoExt> list()
        {
            List<UserInfoExt> list = new List<UserInfoExt>();
            EUDatabase euDatabase = new EUDatabase();

            using (DbCommand cmd = euDatabase.GetStoredProcCommand("UserList_Load"))
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

        internal static List<UserInfo> listWithPage(int startIndex, int pageSize, string loginName, string realName, int userStatus,bool IsAudit, out int sumCount)
        {
            EUDatabase euDatabase = new EUDatabase();

            List<UserInfo> list = null;
            using (DbCommand cmd = euDatabase.GetStoredProcCommand("UserList_LoadWithPage"))
            {
                sumCount = 0;
                euDatabase.AddInParameter(cmd, "@StartIndex", SqlDbType.Int, startIndex);
                euDatabase.AddInParameter(cmd, "@PageSize", SqlDbType.Int, pageSize);
                euDatabase.AddInParameter(cmd, "@LoginName", SqlDbType.NVarChar, loginName);
                euDatabase.AddInParameter(cmd, "@RealName", SqlDbType.NVarChar, realName);
                euDatabase.AddInParameter(cmd, "@UserStatus", SqlDbType.Int, userStatus);
                euDatabase.AddInParameter(cmd, "@IsAudit", SqlDbType.Bit, IsAudit);
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
