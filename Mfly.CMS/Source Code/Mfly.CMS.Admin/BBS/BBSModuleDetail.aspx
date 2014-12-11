<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true" CodeBehind="BBSModuleDetail.aspx.cs" Inherits="Mfly.CMS.Admin.BBS.BBSModuleDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphContent" runat="server" >
<div class="content">
        <div class="tags_content">
            <table width="98%" border="1">
                <tr>
                    <td class="mtitle">
                        版块名称：
                    </td>
                    <td style="padding-left: 10px">
                       <asp:TextBox ID="txtModuleName" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                        <font color="red">*</font>
                        <asp:RequiredFieldValidator ID="valModuleName" runat="server" ControlToValidate="txtModuleName"
                        Display="Dynamic" ErrorMessage="此项必填" ValidationGroup="Save" ForeColor="Red"
                        EnableClientScript="False"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle">
                        版块说明:
                    </td>
                    <td style="padding-left: 10px">
                        <asp:TextBox ID="txtModuleMemo" runat="server" Width="200px" MaxLength="200" Rows="5" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <p style="text-align: center;">
                <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" CssClass="btnCommon" ValidationGroup="Save"/>
                <asp:Button ID="btnCancel" runat="server" Text="返回" OnClick="btnCancel_Click" CausesValidation="false"
                    CssClass="btnCommon" />
            </p>
        </div>
    </div>
</asp:Content>
