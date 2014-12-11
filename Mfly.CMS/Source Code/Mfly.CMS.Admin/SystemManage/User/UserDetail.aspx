<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" MasterPageFile="~/Master/Main.Master"
    Inherits="Mfly.CMS.Admin.SystemManage.User.UserDetail" %>

<%@ Register Src="../../Modules/UserDetail.ascx" TagName="UserDetail" TagPrefix="uc1" %>
<asp:Content ID="Content" ContentPlaceHolderID="cphContent" runat="server">
    <div>
        <uc1:UserDetail ID="ucUserDetail" runat="server"></uc1:UserDetail>
    </div>
</asp:Content>
