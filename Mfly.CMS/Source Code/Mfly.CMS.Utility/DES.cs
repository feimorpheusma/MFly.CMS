using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace Mfly.CMS.Utility
{
    public class DES
    {
        private static byte[] IV = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };

        public static string Encrypt(string strText, string encryptKey)
        {
            byte[] byKey = null;

            byKey = System.Text.Encoding.UTF8.GetBytes(encryptKey);

            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            byte[] inputByteArray = Encoding.UTF8.GetBytes(strText);

            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(byKey, IV), CryptoStreamMode.Write);

            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();

            return Convert.ToBase64String(ms.ToArray());
        }

        public static string Decrypt(string inputString, string encryptKey)
        {
            byte[] byKey = null;
            byte[] inputByteArray = new Byte[inputString.Length];
            byKey = System.Text.Encoding.UTF8.GetBytes(encryptKey);

            DESCryptoServiceProvider des = new DESCryptoServiceProvider();

            inputByteArray = Convert.FromBase64String(inputString);

            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(byKey, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            System.Text.Encoding encoding = new System.Text.UTF8Encoding();
            return encoding.GetString(ms.ToArray());
        }

        public static string GenerateSalt()
        {
            var number = new byte[8];
            var provider = new RNGCryptoServiceProvider();
            provider.GetNonZeroBytes(number);

            var result = new StringBuilder();
            for (int i = 0; i < number.Length; i++)
            {
                result.Append((char)(number[i] % 92 + 33));
            }
            return result.ToString();
        }
    }
}
