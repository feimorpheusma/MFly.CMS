<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" MasterPageFile="~/Master/Main.Master"
    Inherits="Mfly.CMS.Admin.SystemManage.User.UserList" %>

<%@ Register Src="../../Modules/PassWordEdit.ascx" TagName="PassWordEdit" TagPrefix="uc1" %>
<asp:Content ID="Content" ContentPlaceHolderID="cphContent" runat="server">
    <asp:UpdatePanel ID="upEmployeeList" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlQueryCondition" runat="server" CssClass="search">
                <label>
                    用户名：
                </label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="smallInput"></asp:TextBox>
                <label>
                    真实姓名：
                    <asp:TextBox ID="txtRealName" runat="server" CssClass="smallInput"></asp:TextBox>
                </label>
                <label>
                    状态：
                </label>
                <asp:DropDownList ID="ddlistStatus" runat="server" CssClass="BigSelect">
                    <asp:ListItem Value="0">请选择</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click" CausesValidation="false"
                    CssClass="bt1" />
                <asp:Button ID="btnAdd" runat="server" CssClass="btnCommon" OnClick="btnAdd_Click"
                    CausesValidation="false" Text="添加" />
            </asp:Panel>
            <div class="content">
                <asp:GridView runat="server" ID="gvUserList" AllowPaging="True" AutoGenerateColumns="False"
                    EmptyDataText="没有符合条件的数据" OnRowCommand="gvUserList_RowCommand" GridLines="None"
                    PagerSettings-PageButtonCount="4" PagerSettings-Mode="NumericFirstLast" Width="100%"
                    OnRowDataBound="gvUserList_RowDataBound" OnPageIndexChanging="gvUserList_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="用户名">
                            <ItemStyle Font-Underline="true" Width="15%" CssClass="autoWrap" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkLoginName" runat="server" Text='<%#Eval("LoginName") %>' CommandName="EditEmployee"
                                    CommandArgument='<%#Eval("UserId")%>' CausesValidation="false">
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="RealName" HeaderText="真实姓名" HeaderStyle-Width="15%" />
                        <%--<asp:TemplateField HeaderText="用户类型" HeaderStyle-Width="10%">
                            <ItemTemplate>
                                <asp:Label ID="lblUserType" runat="server" Text="Label"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="状态" HeaderStyle-Width="10%">
                            <ItemTemplate>
                                <asp:Label ID="lblUserStatus" runat="server" Text="Label"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作" HeaderStyle-Width="15%">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgEdit" ImageUrl="~/images/mody.png" runat="server" ToolTip="修改"
                                    CausesValidation="false" CommandName="EditEmployee" CommandArgument='<%#Eval("UserId")%>' />
                                <asp:ImageButton ID="imgDelete" ImageUrl="~/images/del.png" CommandArgument='<%#String.Format("{0}|{1}",Eval("UserId"),Eval("UserType")) %>'
                                    ToolTip="删除" CommandName="DeleUser" OnClientClick="return confirm('你确定要删除此用户吗？');"
                                    CausesValidation="false" runat="server" />
                                <asp:ImageButton ID="imgEditPass" ImageUrl="~/images/set.png" CommandArgument='<%#Eval("UserId") %>'
                                    ToolTip="重置密码" CommandName="ResetPwd" runat="server" CausesValidation="false">
                                </asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="trtit" />
                    <PagerStyle CssClass="flickr" BorderStyle="None" />
                    <AlternatingRowStyle BackColor="#f1f1f1" />
                    <RowStyle BackColor="#ffffff" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
            <asp:LinkButton ID="lnkTarget" runat="server"></asp:LinkButton>
            <asp:Panel ID="pnlPasswordChange" runat="server" CssClass="modalpopup" Style="display: none;">
                <table width="100%">
                    <tr>
                        <td class="headerleft">
                            &nbsp;
                        </td>
                        <td class="headercenter">
                            <p>
                                <span>重置密码</span>
                                <label>
                                    <asp:ImageButton ID="imgClose" runat="server" ImageUrl="../../images/dialog_closebtn.gif"
                                        Style="cursor: pointer" CausesValidation="False" />
                                </label>
                            </p>
                        </td>
                        <td class="headerright">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="contentleft">
                        </td>
                        <td class="contentcenter">
                            <uc1:PassWordEdit ID="PassWordEditControl" runat="server" />
                            <br />
                            <div class="buttongroup">
                                <asp:Button ID="btnSave" runat="server" Text="保存" Enabled="true" OnClick="btnSave_Click"
                                    CssClass="btnCommon" />
                                <asp:Button ID="btnCancel" runat="server" Text="关闭" Enabled="true" CausesValidation="False"
                                    CssClass="btnCommon" />
                            </div>
                        </td>
                        <td class="contentright">
                        </td>
                    </tr>
                    <tr>
                        <td class="footerleft">
                        </td>
                        <td class="footercenter">
                        </td>
                        <td class="footerright">
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <ajax:ModalPopupExtender ID="mpePasswordChange" runat="server" BackgroundCssClass="modalBackground"
                TargetControlID="lnkTarget" PopupControlID="pnlPasswordChange" CancelControlID="imgClose">
            </ajax:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
