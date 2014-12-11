using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;

namespace Mfly.CMS.Web.App_Code
{
    public class CommonHelper
    {
        
        public static string getURL(MenuInfo model)
        {
            string URL = string.Empty;
            MenuInfo sonMenu = null;
            if (model.Level == MenuLevelEnum.First)
            {
                sonMenu = MenuManager.MenuList.FirstOrDefault(obj => obj.ParentMenuId == model.MenuId);
            }
            int menuId = model.MenuId;
            if (sonMenu != null)
            {
                menuId = sonMenu.MenuId;
                model = MenuManager.LoadById(menuId);
            }

            if (model.Type == MenuTypeEnum.List)
            {
                URL = string.Format("List.aspx?mid={0}", menuId);
            }
            else if (model.Type == MenuTypeEnum.Detail)
            {
                URL = string.Format("Detail.aspx?mid={0}", menuId);

            }
            else if (model.Type == MenuTypeEnum.ImageList)
            {
                URL = string.Format("ImageList.aspx?mid={0}", menuId);
            }
            return URL;
        }
    }
}