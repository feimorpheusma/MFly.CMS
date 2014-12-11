using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using EMarket.Admin.UI;
using EMarket.MiddleTier.Model;
using EMarket.MiddleTier.Service;
using EMarket.UI.WebControls;
using EMarket.Utility;

namespace EMarket.Admin.SysManage.Orgnization
{
    public partial class OrgnizationList : BasePage
    {

        #region private member
        private int ParentId
        {
            get
            {
                if (ViewState["ParentId"] == null)
                {
                    return App_Code.CommonHelper.getPageIndex(Request.QueryString["poid"]);
                }
                return Convert.ToInt32(ViewState["ParentId"]);
            }
            set
            {
                ViewState["ParentId"] = value;
            }
        }

        private int CurrentPageIndex
        {
            get
            {
                return App_Code.CommonHelper.getPageIndex(Request.QueryString["pi"]);
            }
        }
        #endregion

        #region protected method

        protected override void OnInit(EventArgs e)
        {
            string permissionId = "Dawningsun.EMarket.System.Backstage.UserManage.Organization";
            this.PermissionId = permissionId;
            this.PermissionCheck = true;

            var masterPage = (EMarket.Admin.Master.Main)Master;
            masterPage.PermissionCode = this.PermissionId;

            ucOrgnization.NodeSelected += new EventHandler(treeNodeSelectedChanged);
            base.OnInit(e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.lblError.Text = string.Empty;
            if (!IsPostBack)
            {
                gvOrgnizationList.PageSize = EMarket.Admin.App_Code.PageHelper.GetPageSize();
                initPage();
                bindGrid();
                btnAdd.Attributes["onclick"] = string.Format("window.location='OrgnizationDetail.aspx?poid={0}&pi={1}'", ParentId, gvOrgnizationList.PageIndex);
            }
        }

        protected void gvOrgnizationList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                OrgnizationInfoExt orgnization = (OrgnizationInfoExt)e.Row.DataItem;
                string url = string.Format("/SysManage/Orgnization/OrgnizationDetail.aspx?oid={0}&poid={1}&pi={2}", orgnization.OrgnizationId, ParentId, gvOrgnizationList.PageIndex);

                HyperLink hlkOrgnizationName = e.Row.FindControl("hlkOrgnizationName") as HyperLink;
                hlkOrgnizationName.NavigateUrl = url;

                ImageButton imgEdit = e.Row.FindControl("imgEdit") as ImageButton;
                imgEdit.PostBackUrl = url;
            }
        }

        protected void gvOrgnizationList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvOrgnizationList.PageIndex = e.NewPageIndex;
            bindGrid();
        }

        protected void gvOrgnizationList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "DeleteOrg":
                    {
                        int id = Convert.ToInt32(e.CommandArgument);
                        //获取该部门下的子部门
                        var orgList = new OrgnizationManager().listOrgnization().AsEnumerable<OrgnizationInfo>();
                        if (orgList != null && orgList.Where<OrgnizationInfo>(o => o.ParentOrgnizationId == id).Count() != 0)
                        {
                            MessageBox.Show(this, "此部门下存在子部门，不能删除");
                            return;
                        }

                        //获取部门下的用户
                        int sumCount = 0;
                        var empList = new EmployeeManager().ListByOrgnizationId(id, out sumCount).AsEnumerable<EmployeeInfo>();
                        if (empList != null && sumCount == 0)
                        {
                            MessageBox.Show(this, "此部门下有关联用户，不能删除");
                            return;
                        }

                        //移除树
                        ucOrgnization.RemoveTreeNode(id.ToString());

                        OrgnizationManager manager = new OrgnizationManager();
                        manager.DeleteOrgnization(id);
                        if (gvOrgnizationList.PageIndex != 0 && gvOrgnizationList.Rows.Count == 1)
                        {
                            gvOrgnizationList.PageIndex--;
                        }
                        bindGrid();
                        upOrgnizationList.Update();
                        break;
                    }
                default:
                    break;
            }
        }
        #endregion

        #region private method
        private void initPage()
        {
            ucOrgnization.InitOrgnizationTree(ParentId.ToString());
            if (ParentId == 0)
            {
                TreeView tv = (ucOrgnization.FindControl("tvOrgnization") as TreeView);
                tv.CollapseAll();
                if (tv.Nodes.Count > 0)
                {
                    tv.Nodes[0].Selected = true;
                    tv.Nodes[0].Expanded = true;
                    ParentId = Convert.ToInt32(tv.Nodes[0].Value);
                }
            }
            gvOrgnizationList.PageIndex = Convert.ToInt32(CurrentPageIndex);
        }

        private void bindGrid()
        {
            int sumCount = 0;
            int startIndex = gvOrgnizationList.PageIndex * gvOrgnizationList.PageSize;
            int pageSize = gvOrgnizationList.PageSize;

            OrgnizationManager man = new OrgnizationManager();
            var list = man.ListWithPage(startIndex, pageSize, ParentId, out sumCount);

            GridViewObjectDataSource vds = new GridViewObjectDataSource(list, sumCount);
            gvOrgnizationList.DataSource = vds;
            gvOrgnizationList.DataBind();
        }

        private void treeNodeSelectedChanged(object sender, EventArgs e)
        {
            TreeNode treeNode = (TreeNode)sender;
            ParentId = Convert.ToInt32(treeNode.Value);
            gvOrgnizationList.PageIndex = 0;
            bindGrid();
            btnAdd.Attributes["onclick"] = string.Format("window.location='OrgnizationDetail.aspx?poid={0}&pi={1}'", treeNode.Value, gvOrgnizationList.PageIndex);
        }
        #endregion
    }
}