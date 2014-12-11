using System;
using System.Collections.Generic;
using System.Text;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.MiddleTier.Service
{
    public class MenuManager
    {
        private static List<MenuInfo> _menuList;
        public static List<MenuInfo> MenuList
        {
            get
            {
                if (_menuList == null)
                {
                    _menuList = List();
                }
                return _menuList;
            }
            set
            {
                _menuList = value;
            }
        }

        #region public methods

        public static void Save(MenuInfo model)
        {
            MenuDAL.save(model);
        }

        public static MenuInfo LoadById(int id)
        {
            return MenuDAL.loadById(id);
        }

        public static List<MenuInfo> List()
        {
            return MenuDAL.list();
        }

        public static void Delete(int id)
        {
            MenuDAL.delete(id);
        }

        public static List<MenuInfo> ListWithPage(int startIndex, int pageSizes, out int sumCount)
        {
            return MenuDAL.listWithPage(startIndex, pageSizes, out sumCount);
        }
        #endregion
    }
}
