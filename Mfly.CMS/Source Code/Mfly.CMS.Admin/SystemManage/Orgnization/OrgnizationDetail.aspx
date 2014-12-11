<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="OrgnizationDetail.aspx.cs" Inherits="EMarket.Admin.SysManage.Orgnization.OrgnizationDetail" %>

<%@ Register Src="../../Modules/OrgnizationTree.ascx" TagName="OrgnizationTree" TagPrefix="uc" %>
<asp:Content ID="Content" ContentPlaceHolderID="cphContent" runat="server">
    <script language="javascript" type="text/javascript">
        function nodeSelectClose() {
            $("input[id$='imgClose']").click();
        }

        $(document).keypress(function (e) {
            if (e.keyCode == 13) {
                if (e.srcElement.type != 'textarea') {
                    $("input[id$='btnSave']").click();
                    return false;
                }
            }
        });
    </script>
    <table width="98%">
        <tr>
            <td valign="top">
                <div class="content">
                    <div class="tags_content">
                        <asp:UpdatePanel ID="upOrgnzationDetail" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td valign="top" class="mtitle">
                                            部门名称：
                                        </td>
                                        <td style="padding-left: 10px">
                                            <asp:TextBox ID="txtName" runat="server" MaxLength="200" CssClass="smallInput"></asp:TextBox>
                                            <font color="red">*</font>
                                            <asp:RequiredFieldValidator ID="RFVName" runat="server" ControlToValidate="txtName"
                                                EnableClientScript="False" ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="ORG"></asp:RequiredFieldValidator><asp:CustomValidator
                                                    ID="CValitor" runat="server" ErrorMessage="此部门名称已经存在" ForeColor="Red" ValidationGroup="ORG"
                                                    OnServerValidate="CValitor_ServerValidate"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mtitle">
                                            上级部门：
                                        </td>
                                        <td style="padding-left: 10px">
                                            <asp:UpdatePanel ID="upParentDep" UpdateMode="Conditional" runat="server">
                                                <ContentTemplate>
                                                    <div style="display: inline-block; margin-right: -3px; word-spacing: -3;">
                                                        <asp:TextBox ID="txtPraentOrgnizationName" runat="server" ReadOnly="True" CssClass="smallInput"
                                                            Enabled="false"></asp:TextBox><asp:Button ID="btnSelect" runat="server" CssClass="btnSelect"
                                                                OnClick="btnSelect_Click" Text="..." />
                                                        <font color="red">*</font>
                                                        <asp:RequiredFieldValidator ID="RFVParaOrgName" runat="server" ControlToValidate="txtPraentOrgnizationName"
                                                            ErrorMessage="此项必填" ForeColor="Red" ValidationGroup="ORG" EnableClientScript="False"></asp:RequiredFieldValidator>
                                                        <div style="display: none">
                                                            <asp:HiddenField ID="hidOrgId" runat="server" />
                                                            <asp:HiddenField ID="HFieldOrgId" runat="server" />
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mtitle">
                                            描述：
                                        </td>
                                        <td style="padding-left: 10px; padding-top: 5px; padding-bottom: 5px">
                                            <asp:TextBox ID="txtDescription" runat="server" Width="400" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <p style="text-align: center">
                                    <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" ValidationGroup="ORG"
                                        CssClass="btnCommon" />
                                    &nbsp;
                                    <asp:Button ID="btnBack" runat="server" EnableViewState="False" Text="返回" CssClass="btnCommon"
                                        OnClick="btnCancel_Click" CausesValidation="False" />
                                </p>
                                <div>
                                    <asp:Label ID="lblError" runat="server" Text="" ForeColor="red"></asp:Label>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <asp:LinkButton ID="lkbSelect" runat="server">
    </asp:LinkButton>
    <asp:Panel ID="pnlUserSourceDetail" runat="server" CssClass="modalpopup" Style="display: none">
        <table width="100%">
            <tr>
                <td class="headerleft">
                    &nbsp;
                </td>
                <td class="headercenter">
                    <p>
                        <span>选择上级部门</span>
                        <label>
                            <asp:ImageButton ID="imgClose" runat="server" ImageUrl="../../images/dialog_closebtn.gif"
                                Style="cursor: pointer" CausesValidation="False" />
                        </label>
                    </p>
                </td>
                <td class="headerright">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="contentleft">
                </td>
                <td class="contentcenter">
                    <div class="selectdiv">
                        <asp:UpdatePanel runat="server" ID="udpPatientSetupWizard" UpdateMode="Conditional">
                            <ContentTemplate>
                                <uc:OrgnizationTree ID="ucOrgnizationTree" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="buttongroup">
                        <asp:Button ID="btnClose" CssClass="btnCommon" Text="关闭" runat="server" CausesValidation="false" />
                    </div>
                </td>
                <td class="contentright">
                </td>
            </tr>
            <tr>
                <td class="footerleft">
                </td>
                <td class="footercenter">
                </td>
                <td class="footerright">
                </td>
            </tr>
        </table>
    </asp:Panel>
    <ajax:ModalPopupExtender ID="mpeUserSourceDetail" runat="server" TargetControlID="lkbSelect"
        PopupControlID="pnlUserSourceDetail" BackgroundCssClass="modalBackground" CancelControlID="btnClose"
        OkControlID="imgClose" />
</asp:Content>
