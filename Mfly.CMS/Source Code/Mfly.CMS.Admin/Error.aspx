<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/Main.Master"
    CodeBehind="Error.aspx.cs" Inherits="Mfly.CMS.Admin.Error" %>

<asp:Content ID="Content" ContentPlaceHolderID="cphContent" runat="server">
    <div style="font-size: 20px; font-weight: bolder; color: Red; text-align: center;
        margin-top: 100px;">
        <img src="images/Error.png" style="margin-right: 10px;" /><br /><br />
        出错了，<asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>!
    </div>
</asp:Content>
