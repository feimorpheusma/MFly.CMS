using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mfly.CMS.Utility.WebControls;
using Mfly.CMS.MiddleTier.Service;
using Mfly.CMS.MiddleTier.Model;
using Mfly.CMS.Utility;
using Mfly.CMS.MiddleTier.Service.CustomizedException;

namespace Mfly.CMS.Admin.SystemManage.User
{
    public partial class UserList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initUserStatusList();
                bindGrid();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserDetail.aspx");
        }

        protected void gvUserList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Label lblUserType = e.Row.FindControl("lblUserType") as Label;
                Label lblUserStatus = e.Row.FindControl("lblUserStatus") as Label;
                //lblUserType.Text = XEnum.GetDescription((e.Row.DataItem as UserInfo).UserType);
                lblUserStatus.Text = (e.Row.DataItem as UserInfo).UserStatus == UserStatusEnum.Active ? XEnum.GetDescription(UserStatusEnum.Active) : XEnum.GetDescription(UserStatusEnum.Locked);
            }
        }

        protected void gvUserList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "EditEmployee":
                    {
                        string url = string.Format("UserDetail.aspx?uid={0}&mode=2", e.CommandArgument.ToString());
                        Response.Redirect(url);
                        break;
                    }
                case "DeleUser":
                    {
                        string[] strList = e.CommandArgument.ToString().Split('|');
                        if (strList[1]==UserTypeEnum.Admin.ToString())
                        {
                            MessageBox.Show(this.Page, "此用户为系统管理员，不能删除");
                            return;
                        }
                        int userId = Convert.ToInt32(strList[0]);
                        try
                        {
                            UserManager.Delete(userId);
                        }
                        catch (EntityInUseException)
                        {
                            MessageBox.Show(this, "此用户有关联信息，不能删除");
                            return;
                        }
                        if (gvUserList.PageIndex != 0 && gvUserList.Rows.Count == 1)
                        {
                            gvUserList.PageIndex--;
                        }
                        bindGrid();
                        break;
                    }
                case "ResetPwd":
                    {
                        mpePasswordChange.Show();
                        PassWordEditControl.UserId = Convert.ToInt32(e.CommandArgument.ToString());
                        break;
                    }
                
                default:
                    {
                        break;
                    }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            PassWordEditControl.RestPwd();
        }

        /// <summary>
        /// 绑定数据
        /// </summary>
        private void bindGrid()
        {
            int sumCount = 0;
            int startIndex = gvUserList.PageIndex * gvUserList.PageSize;
            int pageSize = gvUserList.PageSize;

            var list = new List<UserInfoExt>();//UserManager.ListWithPage(startIndex,pageSize,txtUserName.Text.Trim(),txtRealName.Text.Trim(),Convert.ToInt32(ddlistStatus.SelectedItem.Value),out sumCount);

            GridViewObjectDataSource vds = new GridViewObjectDataSource(list, sumCount);
            gvUserList.DataSource = vds;
            gvUserList.DataBind();
        }

        private void initUserStatusList()
        {
            ddlistStatus.Items.Clear();
            ddlistStatus.Items.Add(new ListItem("请选择", "0"));
            ddlistStatus.Items.Add(new ListItem(XEnum.GetDescription(UserStatusEnum.Active), ((int)UserStatusEnum.Active).ToString()));
            ddlistStatus.Items.Add(new ListItem(XEnum.GetDescription(UserStatusEnum.Locked), ((int)UserStatusEnum.Locked).ToString()));
        }

        protected void gvUserList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUserList.PageIndex = e.NewPageIndex;
            bindGrid();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvUserList.PageIndex = 0;
            bindGrid();
        }
    }
}