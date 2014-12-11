using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using EMarket.Admin.UI;
using EMarket.MiddleTier.Model;
using EMarket.MiddleTier.Service;
using EMarket.MiddleTier.Service.CustomizedException;

namespace EMarket.Admin.SysManage.Orgnization
{
    public partial class OrgnizationDetail : BasePage
    {
        #region private member
        private int OrgnizationId
        {
            get
            {
                return App_Code.CommonHelper.GetId(Request.QueryString["oid"], ErrorCodeEnum.UnExistsRecord);
            }
        }

        private int ParentId
        {
            get
            {
                return App_Code.CommonHelper.GetId(Request.QueryString["poid"], ErrorCodeEnum.UnExistsRecord);
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

        #region protected methods

        protected override void OnInit(EventArgs e)
        {
            ucOrgnizationTree.NodeSelected += new EventHandler(ucOrgnizationTree_NodeSelected);
            base.OnInit(e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {sadfa
                initData();

                var orgList = new OrgnizationManager().listOrgnization();
                initPageMsg();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            save();
            Response.Redirect(string.Format("OrgnizationList.aspx?poid={0}&pi={1}", Request.QueryString["poid"], CurrentPageIndex), true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("OrgnizationList.aspx?poid={0}&pi={1}", Request.QueryString["poid"], CurrentPageIndex), true);
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            ucOrgnizationTree.InitOrgnizationTree(string.Empty);
            TreeView tv = this.ucOrgnizationTree.FindControl("tvOrgnization") as TreeView;
            if (OrgnizationId != 0)
            {
                TreeNode node = null;
                foreach (TreeNode item in tv.Nodes)
                {
                    if (item.Value == OrgnizationId.ToString())
                    {
                        node = item;
                        break;
                    }
                    if (node == null && item.ChildNodes.Count != 0)
                    {
                        node = getNode(item, OrgnizationId.ToString());
                    }
                }
                node.Parent.ChildNodes.Remove(node);
            }
            mpeUserSourceDetail.Show();
            udpPatientSetupWizard.Update();
            upParentDep.Update();
        }

        protected void CValitor_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string loginName = txtName.Text.Trim();
            if (loginName.Trim() == "")
            {
                args.IsValid = true;
                return;
            }

            List<OrgnizationInfo> orgInfoList = new OrgnizationManager().LoadOrgnizationByParentOrgId(Convert.ToInt32(hidOrgId.Value));
            if (orgInfoList != null)
            {
                if (OrgnizationId == 0)//新增
                {
                    args.IsValid = !orgInfoList.AsEnumerable().Any(o => o.Name == loginName);
                    return;
                }
                else//修改
                {
                    if (orgInfoList.AsEnumerable().Any(o => o.Name == loginName && o.OrgnizationId != Convert.ToInt32(OrgnizationId)))
                    {
                        args.IsValid = false;
                        return;
                    }
                }
            }
            args.IsValid = true;
        }
        #endregion

        #region private methods

        private void save()
        {
            OrgnizationInfo orgInfo = new OrgnizationInfo();
            orgInfo.OrgnizationId = OrgnizationId;
            orgInfo.Name = txtName.Text.Trim();
            orgInfo.Description = txtDescription.Text.Trim();
            orgInfo.ParentOrgnizationId = string.IsNullOrWhiteSpace(hidOrgId.Value) ? null : (int?)Convert.ToInt32(hidOrgId.Value);
            orgInfo.OrgnizationId = OrgnizationId;
            orgInfo.Type = Convert.ToInt32(((int)OrgnizationTypeEnum.Compary));

            OrgnizationManager manager = new OrgnizationManager();
            manager.SaveOrgnization(orgInfo);
        }

        private void ucOrgnizationTree_NodeSelected(object sender, EventArgs e)
        {
            TreeNode node = (TreeNode)sender;
            txtPraentOrgnizationName.Text = node.Text;
            hidOrgId.Value = node.Value;
            upParentDep.Update();
            mpeUserSourceDetail.Hide();
        }

        /// <summary>
        /// 初始化页面信息
        /// </summary>
        /// <param name="id"></param>
        private void initPageMsg()
        {
            if (OrgnizationId != 0)
            {
                HFieldOrgId.Value = OrgnizationId.ToString();
                OrgnizationManager manager = new OrgnizationManager();
                OrgnizationInfo orgInfo = null;
                try
                {
                    orgInfo = manager.LoadOrgnizationById(OrgnizationId);
                }
                catch (EntityNotFoundException)
                {
                    App_Code.CommonHelper.ResponseUrl(ErrorCodeEnum.UnExistsRecord);
                }
                txtName.Text = orgInfo.Name;
                txtDescription.Text = orgInfo.Description;
                txtPraentOrgnizationName.Text = manager.LoadOrgnizationById(orgInfo.ParentOrgnizationId.Value).Name;
                hidOrgId.Value = orgInfo.ParentOrgnizationId.Value.ToString();
            }
            else
            {
                InitParentOrgnizationName();
            }
        }

        private void initData()
        {
            string permissionId = "Dawningsun.EMarket.System.Backstage.UserManage.Organization";
            this.PermissionId = permissionId;
            this.PermissionCheck = true;
            ((EMarket.Admin.Master.Main)Master).PermissionCode = permissionId;
        }

        private TreeNode getNode(TreeNode para, string key)
        {
            TreeNode node = null;
            foreach (TreeNode item in para.ChildNodes)
            {
                if (item.Value == key)
                {
                    node = item;
                    break;
                }
                if (node == null && item.ChildNodes.Count != 0)
                {
                    node = getNode(item, key);
                }
            }
            return node;
        }

        private void InitParentOrgnizationName()
        {
            OrgnizationInfo info = null;
            try
            {
                info = new OrgnizationManager().LoadOrgnizationById(Convert.ToInt32(ParentId));
            }
            catch (EntityNotFoundException)
            {
                App_Code.CommonHelper.ResponseUrl(ErrorCodeEnum.UnExistsRecord);
            }
            txtPraentOrgnizationName.Text = info.Name;
            hidOrgId.Value = info.OrgnizationId.ToString();
        }
        #endregion
    }
}