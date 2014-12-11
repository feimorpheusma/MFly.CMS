<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImageList.aspx.cs" Inherits="Web.ImageList1" %>

<%@ Register TagPrefix="uc" Src="~/UserControls/Search.ascx" TagName="Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpRightContent" runat="server">
    <!--搜索框-->
    <uc:Search runat="server" ID="ucSearch" Visible="false"></uc:Search>
    <div class="scholarship tcollection_a">
        <h2 class="h2"><strong>
            <asp:Literal Text="" ID="litMenuName" runat="server" /></strong></h2>
        <ul class="pho_list">
            <asp:Repeater ID="rptList" runat="server" OnItemDataBound="rptList_ItemDataBound">
                <ItemTemplate>
                    <li><a href="Detail.aspx?aid=<%#Eval("ArticleId") %>">
                        <asp:Image ID="imgPic" runat="server" /><span><%#Eval("Title") %></span></a></li>
                </ItemTemplate>
            </asp:Repeater>

        </ul>
    </div>
</asp:Content>
