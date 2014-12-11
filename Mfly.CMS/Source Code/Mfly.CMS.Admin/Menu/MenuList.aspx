<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="MenuList.aspx.cs" Inherits="Mfly.CMS.Admin.Menu.MenuList" %>

<asp:Content ID="Content" ContentPlaceHolderID="cphContent" runat="server">
    <div class="search">
        <asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="btnAdd_Click" CssClass="btnCommon" />
    </div>
    <asp:UpdatePanel ID="upNewsList" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="content">
                <asp:GridView runat="server" ID="gvList" AllowPaging="True" AutoGenerateColumns="False"
                    PageSize="10" EmptyDataText="没有符合条件的数据" GridLines="None" OnPageIndexChanging="gvList_PageIndexChanging"
                    PagerSettings-PageButtonCount="4" PagerSettings-Mode="NumericFirstLast" Width="100%"
                    OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="菜单名称" HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnName" runat="server" Text='<%#Eval("Name") %>' CommandName="MenuEdit"
                                    CommandArgument='<%#Eval("MenuId")%>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Level" HeaderText="级别" HeaderStyle-Width="15%" />
                        <asp:BoundField DataField="Key" HeaderText="关键字" HeaderStyle-Width="15%" />
                        <asp:BoundField DataField="Type" HeaderText="类型" HeaderStyle-Width="15%" />
                        <asp:TemplateField HeaderText="操作" HeaderStyle-Width="15%">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgEdit" CommandArgument='<%#Eval("MenuId")%>' ImageUrl="~/Images/mody.png"
                                    ToolTip="修改" CommandName="MenuEdit" CausesValidation="false" runat="server" />
                                <asp:ImageButton ID="imgDelete" ImageUrl="~/Images/del.png" CommandArgument='<%#Eval("MenuId")%>'
                                    ToolTip="删除" CommandName="MenuDelete" OnClientClick="return confirm('你确定要删除此菜单吗？');"
                                    CausesValidation="false" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="trtit" />
                    <PagerStyle CssClass="flickr" BorderStyle="None" />
                    <AlternatingRowStyle BackColor="#f1f1f1" />
                    <RowStyle BackColor="#ffffff" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
