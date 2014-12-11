<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftMenu.ascx.cs" Inherits="Mfly.CMS.Admin.LeftMenu.LeftMenu" %>
<asp:Literal ID="MenuScript" runat="server"></asp:Literal>
<div class="menu">
    <h1 class="l1">
        <a href="javascript:function()">用户管理</a></h1>
    <div class="slist" style="display: block">
        <h2 class="l2">
            <a id="A1" href="../SystemManage/User/UserList.aspx" runat="server">用户管理</a></h2>
    </div>
    <h1 class="l1">
        <a href="javascript:function()">菜单管理</a></h1>
    <div class="slist" style="display: block">
        <h2 class="l2">
            <a id="A5" href="../Menu/MenuList.aspx" runat="server">菜单管理</a></h2>
    </div>
    <h1 class="l1">
        <a href="javascript:function()">文章管理</a></h1>
    <div class="slist" style="display: block">
        <h2 class="l2">
            <a id="A2" href="../Article/ArticleList.aspx" runat="server">文章列表</a></h2>
    </div>
    <h1 class="l1">
        <a href="javascript:function()">论坛管理</a></h1>
    <div class="slist" style="display: block">
        <h2 class="l2">
            <a id="A3" href="../BBS/BBSModuleEdit.aspx" runat="server">版块设置</a></h2>
        <h2 class="l2">
            <a id="A4" href="../BBS/BBSListAllPage.aspx" runat="server">论坛管理</a></h2>
    </div>
</div>
