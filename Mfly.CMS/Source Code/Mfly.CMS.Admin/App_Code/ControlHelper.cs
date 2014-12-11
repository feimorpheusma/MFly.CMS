using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using Mfly.CMS.MiddleTier.Service;

namespace Mfly.CMS.Admin.App_Code
{
    public class ControlHelper
    {
        public static void SetImageUrl(int attachmentId, string attachmentName, Image image)
        {
            if (attachmentId != 0)
            {
                string fileName = ConfigurationManager.AppSettings.Get("ImageUploadFolder") + attachmentName;
                string path = HttpContext.Current.Server.MapPath(fileName);
                if (File.Exists(path) == false)
                {
                    BinaryWriter bw = new BinaryWriter(File.Open(path, FileMode.OpenOrCreate));
                    bw.Write(AttachmentManager.LoadById(attachmentId).Content);
                    bw.Close();
                }
                image.ImageUrl = fileName;
            }
            else
            {
                image.ImageUrl = "/Resource/Images/noimage.jpg";
            }
        }

        public static void DeleteImage(string attachmentName)
        {
            string fileName = ConfigurationManager.AppSettings.Get("ImageUploadFolder") + attachmentName;
            string path = HttpContext.Current.Server.MapPath(fileName);
            if (File.Exists(path) == false)
            {
                File.Delete(path);
            }
        }
    }
}