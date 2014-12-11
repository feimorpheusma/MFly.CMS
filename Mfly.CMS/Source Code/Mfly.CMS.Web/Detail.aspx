<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="Web.Detail1" %>

<%@ Register TagPrefix="uc" TagName="Author" Src="~/UserControls/Author.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpRightContent" runat="server">
    <h2 class="h2"><strong>
        <asp:Literal Text="" ID="ltlTitle" runat="server" /></strong></h2>
    <div class="overview">
        <asp:Image ID="imgPic" Height="400" runat="server" Visible="false" />
        <asp:Literal Text="" ID="ltlContent" runat="server" />
    </div>
    <uc:Author ID="ucAutor" runat="server" Visible="false" />
</asp:Content>
