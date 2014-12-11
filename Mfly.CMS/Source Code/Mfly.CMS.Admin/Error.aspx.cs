using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.Utility;
using Mfly.CMS.Admin.UI;

namespace Mfly.CMS.Admin
{
    public partial class Error : BasePage
    {
        #region private variable

        private string ErrCode
        {
            get
            {
                return Request.QueryString["code"];
            }
        }
        #endregion

        #region protected methods
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initData();
            }
        }

        #endregion

        #region private methods

        private void initData()
        {
            int code = 0;
            int.TryParse(ErrCode, out code);
            switch (code)
            {
                case (int)ErrorCodeEnum.UnExistsRecord:
                    this.lblMessage.Text = XEnum.GetDescription(ErrorCodeEnum.UnExistsRecord);
                    break;
                case (int)ErrorCodeEnum.UnLegal:
                    this.lblMessage.Text = XEnum.GetDescription(ErrorCodeEnum.UnLegal);
                    break;
                case (int)ErrorCodeEnum.UnAuthorization:
                    this.lblMessage.Text = XEnum.GetDescription(ErrorCodeEnum.UnAuthorization);
                    break;
                default:
                    this.lblMessage.Text = XEnum.GetDescription(ErrorCodeEnum.UnLegal);
                    break;
            }
        }
        #endregion
    }
}