using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Mfly.CMS.Utility
{
    public class DataUtility
    {
        /// <summary>
        /// Gets a column's string value
        /// </summary>
        /// <param name="row"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        public static string GetString(DataRow row, string colName)
        {
            string retValue = string.Empty;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    retValue = row[colName].ToString();
                }
            }

            return retValue;
        }

        /// <summary>
        /// Gets a column's int value
        /// </summary>
        /// <param name="row"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        public static int GetInt(DataRow row, string colName)
        {
            int retValue = 0;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    retValue = Convert.ToInt32(row[colName]);
                }
            }

            return retValue;
        }

        /// <summary>
        /// Gets a nullable column's int value
        /// </summary>
        /// <param name="row"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        public static int? GetNullableInt(DataRow row, string colName)
        {
            int? retValue = null;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    retValue = Convert.ToInt32(row[colName]);
                }
            }

            return retValue;
        }

        /// <summary>
        /// Gets a column's datetime value
        /// </summary>
        /// <param name="row"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        public static DateTime GetDateTime(DataRow row, string colName)
        {
            DateTime dt = DateTime.MinValue;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    dt = Convert.ToDateTime(row[colName]);
                }
            }

            return dt;
        }

        /// <summary>
        /// Gets a nullable column's datetime value
        /// </summary>
        /// <param name="row"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        public static DateTime? GetNullableDateTime(DataRow row, string colName)
        {
            DateTime? retValue = null;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    retValue = Convert.ToDateTime(row[colName]);
                }
            }

            return retValue;
        }


        /// <summary>
        /// 获取二进制类型
        /// </summary>
        /// <param name="row"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        public static byte[] GetBytes(DataRow row, string colName)
        {
            byte[] retValue = null;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    retValue = (byte[])(row[colName]);
                }
            }
            return retValue;
        }

        /// <summary>
        /// 获取float类型值
        /// </summary>
        /// <param name="row"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        public static float GetFloat(DataRow row, string colName)
        {
            float retValue = 0;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    retValue = Convert.ToSingle(row[colName]);
                }
            }
            return retValue;
        }

        /// <summary>
        /// 获取float类型值
        /// </summary>
        /// <param name="row"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        public static float? GetNullableFloat(DataRow row, string colName)
        {
            float? retValue = 0;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    retValue = Convert.ToSingle(row[colName]);
                }
            }
            return retValue;
        }

        /// <summary>
        /// 获取Decimal类型
        /// </summary>
        /// <param name="row"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        public static decimal GetDecimal(DataRow row, string colName)
        {
            decimal retValue = 0;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    retValue = Convert.ToDecimal(row[colName]);
                }
            }
            return retValue;
        }

        /// <summary>
        /// 获取Decimal类型
        /// </summary>
        /// <param name="row"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        public static decimal? GetNullableDecimal(DataRow row, string colName)
        {
            decimal? retValue = 0;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    retValue = Convert.ToDecimal(row[colName]);
                }
            }
            return retValue;
        }


        /// <summary>
        /// 获取Boolean类型值
        /// </summary>
        /// <param name="row"></param>
        /// <param name="colName"></param>
        /// <returns></returns>
        public static Boolean GetBoolean(DataRow row, string colName)
        {
            Boolean retValue = false;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    retValue = Convert.ToBoolean(row[colName]);
                }
            }
            return retValue;
        }

        public static Guid GetGuid(DataRow row, string colName)
        {
            Guid retValue = Guid.Empty;
            if (row.Table.Columns.Contains(colName))
            {
                if (row[colName] != null && row[colName] != DBNull.Value)
                {
                    retValue = (Guid)row[colName];
                }
            }
            return retValue;
        }

    }
}
