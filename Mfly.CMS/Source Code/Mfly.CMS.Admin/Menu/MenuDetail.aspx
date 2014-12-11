<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="MenuDetail.aspx.cs" Inherits="Mfly.CMS.Admin.Menu.MenuDetail" %>

<%@ Register Src="~/Modules/HTMLEditor/HTMLEditor.ascx" TagName="HTMLEditor" TagPrefix="uc1" %>
<asp:Content ID="Content" ContentPlaceHolderID="cphContent" runat="server">
    <%--   <asp:UpdatePanel ID="upArticle" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
    <div class="content">
        <div class="tags_content">
            <table width="98%" border="1">
                <tr>
                    <td class="mtitle">
                        菜单名称：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:TextBox ID="txtName" runat="server" MaxLength="50"></asp:TextBox>
                        <font color="red">*</font>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                            ForeColor="Red" Display="Dynamic" ErrorMessage="名称不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle">
                        菜单级别：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:DropDownList ID="ddlLevel" runat="server">
                        </asp:DropDownList>
                        <font color="red">*</font>
                        <asp:CompareValidator ID="cvLevel" runat="server" ErrorMessage="请选择菜单级别" ForeColor="Red"
                            Display="Dynamic" ControlToValidate="ddlLevel" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle">
                        父级菜单：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:DropDownList ID="ddlParentMenu" runat="server">
                        </asp:DropDownList>
                        <%--<font color="red">*</font>
                        <asp:CompareValidator ID="cvParentMenu" runat="server" ErrorMessage="请选择父级菜单" ForeColor="Red"
                            Display="Dynamic" ControlToValidate="ddlParentMenu" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle">
                        关键字：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:TextBox ID="txtKey" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle">
                        菜单类型：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:DropDownList ID="ddlType" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                        </asp:DropDownList>
                        <font color="red">*</font>
                        <asp:CompareValidator ID="cvType" runat="server" ErrorMessage="请选择文章类型" ForeColor="Red"
                            Display="Dynamic" ControlToValidate="ddlType" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle" valign="top">
                        是否可见：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:CheckBox Text="" ID="cbxVisable" runat="server" />
                    </td>
                </tr>
                <tr id="trContent" runat="server">
                    <td class="mtitle" valign="top">
                        内容：
                    </td>
                    <td style="padding-left: 10px">
                        <uc1:HTMLEditor ID="htmlEditor" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <p style="text-align: center;">
                <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" CssClass="btnCommon" CausesValidation="true" />
                <asp:Button ID="btnCancel" runat="server" Text="返回" OnClick="btnCancel_Click" CausesValidation="false"
                    CssClass="btnCommon" />
            </p>
        </div>
    </div>
    <%--     </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
