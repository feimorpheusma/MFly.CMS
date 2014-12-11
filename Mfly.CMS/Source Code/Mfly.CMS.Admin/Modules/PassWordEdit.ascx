<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PassWordEdit.ascx.cs"
    Inherits="Mfly.CMS.Admin.Modules.PassWordEdit" %>
<div>
    <table width="300px" style="margin-left:50px;">
        <tr>
            <td width="60px" style="padding: 5px;">
                新密码：
            </td>
            <td style="padding: 5px;">
                <asp:TextBox ID="txtNewWord" runat="server" TextMode="Password" CssClass="smallInput"></asp:TextBox>
                <font color='red'>*</font>
                <asp:RequiredFieldValidator ID="valNewPassword" runat="server" ErrorMessage="此项必填"
                    ControlToValidate="txtNewWord" ForeColor="red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="padding: 5px;">
                确认密码：
            </td>
            <td style="padding: 5px;">
                <asp:TextBox ID="txtSureWord" runat="server" TextMode="Password" CssClass="smallInput"></asp:TextBox>
                <font color='red'>*</font>
                <asp:RequiredFieldValidator ID="valPasswordNull" runat="server" ErrorMessage="此项必填"
                    ControlToValidate="txtSureWord" ForeColor="red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:CompareValidator ID="valPassword" runat="server" ErrorMessage="新密码和确认密码必须一致"
                    ControlToCompare="txtNewWord" ControlToValidate="txtSureWord" ForeColor="red"></asp:CompareValidator>
            </td>
        </tr>
    </table>
</div>
