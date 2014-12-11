<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Mfly.CMS.Admin.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网站后台管理系统</title>
    <link href="css/common.css" rel="stylesheet" type="text/css" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
</head>
<body onload="document.getElementById('txtUserName').focus()">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="bg">
        <div id="login">
            <table>
                <tr>
                    <td>
                        <label>
                            用户名：</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserName" Width="144px" Height="23px" runat="server"></asp:TextBox>
                         <asp:Label ID="lblUserNameError" ForeColor="Red" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>
                            密 &nbsp;码：</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" Width="144px" Height="23px"></asp:TextBox>
                        <asp:Label ID="lblPasswordError" ForeColor="Red" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <label style="font-size: 12px; font-weight: normal; color: #666; margin-left: 10px;">
                            <input name="" id="cbxSaveUser" runat="server" type="checkbox" value="记下用户名" style="vertical-align: middle;
                                border: none;" />记住用户名</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnLogin" runat="server" Text="登&nbsp;&nbsp;录" CssClass="submit"
                            OnClick="btnLogin_Click" ValidationGroup="Login" />
                        <input type="reset" class="reset" value="重&nbsp;&nbsp;置" />
                    </td>
                </tr>
            </table>
           
        </div>
    </div>
    </form>
</body>
</html>
