using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Mfly.CMS.Utility
{
    public class XTyper
    {
        public static object PrepString(string input)
        {
            if (input == string.Empty || input == null)
            {
                return DBNull.Value;
            }
            else
            {
                return input;
            }
        }

        public static object PrepGuid(string input)
        {
            if (input == null || input == string.Empty)
            {
                return DBNull.Value;
            }
            else
            {
                return new Guid(input);
            }
        }

        public static object PrepGuid(Guid input)
        {
            if (input == Guid.Empty || input == null)
            {
                return DBNull.Value;
            }
            else
            {
                return input;
            }
        }

        public static object PrepInt(int input)
        {
            if (input == 0)
            {
                return DBNull.Value;
            }
            else
            {
                return input;
            }
        }

        public static object PrepNullableInt(int? input)
        {
            if (!input.HasValue)
            {
                return DBNull.Value;
            }
            else
            {
                return input;
            }
        }

        public static object PrepNullableDateTime(DateTime? input)
        {
            if (!input.HasValue)
            {
                return DBNull.Value;
            }
            else
            {
                return input;
            }
        }
        public static object PrepNullableBoolean(bool? input)
        {
            if (!input.HasValue)
            {
                return DBNull.Value;
            }

            return input;
        }

        public static object PrepDateTime(DateTime input)
        {
            if (input == DateTime.MinValue)
            {
                return DBNull.Value;
            }
            else
            {
                return input;
            }
        }

        public static object PrepFloat(float input)
        {
            if (input == 0)
            {
                return DBNull.Value;
            }
            else
            {
                return input;
            }
        }

        public static object PrepNullableFloat(float? input)
        {
            if (!input.HasValue)
            {
                return DBNull.Value;
            }
            else
            {
                return input;
            }
        }

        public static object PrepDecimal(decimal input)
        {
            if (input == 0)
            {
                return DBNull.Value;
            }
            else
            {
                return input;
            }
        }

        public static object PrepNullableDecimal(decimal? input)
        {
            if (!input.HasValue)
            {
                return DBNull.Value;
            }
            else
            {
                return input;
            }
        }
        public static object PrepBytes(byte[] input)
        {
            if (input==null ||input.Length == 0)
            {
                return DBNull.Value;
            }
            else
            {
                return input;
            }
        }

    }
}
