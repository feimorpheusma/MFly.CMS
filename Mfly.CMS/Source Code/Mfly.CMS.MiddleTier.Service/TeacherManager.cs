using System;
using System.Collections.Generic;
using System.Text;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.MiddleTier.Service
{
    public class TeacherManager
    {
        #region public methods

        public static void Save(TeacherInfo model)
        {
            TeacherDAL.save(model);
        }

        public static TeacherInfoExt LoadById(int id)
        {
            return TeacherDAL.loadById(id);
        }

        public static TeacherInfoExt LoadByUserId(int id)
        {
            return TeacherDAL.loadByUserId(id);
        }

        public static List<TeacherInfoExt> List()
        {
            return TeacherDAL.list();
        }

        public static void Delete(int id)
        {
            TeacherDAL.delete(id);
        }

        public static List<TeacherInfo> ListWithPage(int startIndex, int pageSizes, out int sumCount)
        {
            return TeacherDAL.listWithPage(startIndex, pageSizes, out sumCount);
        }
        #endregion
    }
}
