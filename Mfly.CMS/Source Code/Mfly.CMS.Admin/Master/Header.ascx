<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Mfly.CMS.Admin.LeftMenu.Header" %>
<div id="logo">
    <img id="Img1" src="../images/logo.png" runat="server" /></div>
<div id="headright">
    <li>
        <img id="Img3" src="../images/tc.png" runat="server" />
        <asp:LinkButton ID="lkbLogout" runat="server" OnClick="lkbLogout_Click" CausesValidation="false">退出系统</asp:LinkButton>
    </li>
    <li>
        <img id="Img4" src="../images/home.png" runat="server" /><a href="../Default.aspx"
            runat="server">首页</a></li>
    <li>
        <asp:Label ID="lblCurrentUser" runat="server" Text="admin"></asp:Label>欢迎您！
    </li>
</div>
<div style="clear: both;">
</div>
<div id="bar">
    <div id="barleft">
        <asp:Label ID="lblTime" runat="server" Text=""></asp:Label></div>
    <div id="barright">
        
    </div>
</div>
