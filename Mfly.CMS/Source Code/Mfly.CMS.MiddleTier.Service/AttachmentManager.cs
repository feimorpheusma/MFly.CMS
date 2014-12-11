using System;
using System.Collections.Generic;
using System.Text;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.MiddleTier.Service
{
    public class AttachmentManager
    {
        #region public methods

        public static void Save(AttachmentInfo model)
        {
            AttachmentDAL.save(model);
        }

        public static AttachmentInfo LoadById(int id)
        {
            return AttachmentDAL.loadById(id);
        }

        public static List<AttachmentInfo> List()
        {
            return AttachmentDAL.list();
        }

        public static void Delete(int id)
        {
            AttachmentDAL.delete(id);
        }

        public static List<AttachmentInfo> ListWithPage(int startIndex, int pageSizes, out int sumCount)
        {
            return AttachmentDAL.listWithPage(startIndex, pageSizes, out sumCount);
        }
        #endregion
    }
}
