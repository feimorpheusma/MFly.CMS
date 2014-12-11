using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mfly.CMS.Admin.UI;

namespace Mfly.CMS.Admin.SystemManage.User
{
    public partial class UserDetail :System.Web.UI.Page
    {
        public enum ControlMode : int
        {
            Add = 1,
            UserEdit = 2,
            SelfEdit = 3
        }

        #region private variables
        private int? _userId = null;
        private int? _teacherId = null;
        #endregion

        #region private member

        private int? TeacherId
        {
            get
            {
                if (_teacherId.HasValue == false)
                {
                    string teahcerId = Request.QueryString["tid"];
                    if (string.IsNullOrEmpty(teahcerId) == false)
                    {
                        _teacherId = Convert.ToInt32(teahcerId);
                    }
                }
                return _teacherId;
            }
        }
        private int? UserId
        {
            get
            {
                if (_userId.HasValue == false)
                {
                    string userId = Request.QueryString["uid"];
                    if (string.IsNullOrEmpty(userId) == false)
                    {
                        _userId = Convert.ToInt32(userId);
                    }
                }
                return _userId;
            }
        }

        public ControlMode Mode
        {
            get
            {
                string mode = Request.QueryString["mode"];
                if (string.IsNullOrEmpty(mode) == false)
                {
                    return (ControlMode)Convert.ToInt32(mode);
                }
                return ControlMode.Add;
            }
            set
            {
                this.Mode = value;
            }
        }

        #endregion

        #region  protect Mehtods

        protected override void OnInit(EventArgs e)
        {

            
            base.OnInit(e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ucUserDetail.Transfer += new EventHandler(ucUserDetail_Transfer);
            if (!Page.IsPostBack)
            {
            }
            ucUserDetail.EmployeeId = TeacherId;
            ucUserDetail.UserId = UserId;
            ucUserDetail.Mode = Mode;
        }

        #endregion

        #region private methods

        private void ucUserDetail_Transfer(object sender, EventArgs e)
        {
            Response.Redirect("~/SystemManage/User/UserList.aspx");
        }

        #endregion
    }
}