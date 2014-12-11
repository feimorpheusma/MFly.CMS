<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="ArticleList.aspx.cs" Inherits="Mfly.CMS.Admin.Article.ArticleList" %>

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
                        <asp:TemplateField HeaderText="文章标题" HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnTitle" runat="server" Text='<%#Eval("Title") %>' CommandName="ArticleEdit"
                                    CommandArgument='<%#Eval("ArticleId")%>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MenuName" HeaderText="所属菜单" HeaderStyle-Width="10%" />
                        <asp:BoundField DataField="Source" HeaderText="文章来源" HeaderStyle-Width="10%" />
                        <asp:BoundField DataField="Author" HeaderText="文章作者" HeaderStyle-Width="10%" />
                        <asp:BoundField DataField="TypeName" HeaderText="文章类型" HeaderStyle-Width="15%" />
                        <asp:BoundField DataField="CreatedDate" DataFormatString="{0:d}" HeaderText="发布时间"
                            HeaderStyle-Width="15%" />
                        <asp:TemplateField HeaderText="操作" HeaderStyle-Width="15%">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgEdit" CommandArgument='<%#Eval("ArticleId")%>' ImageUrl="~/Images/mody.png"
                                    ToolTip="修改" CommandName="ArticleEdit" CausesValidation="false" runat="server" />
                                <asp:ImageButton ID="imgEditAttachment" CommandArgument='<%#Eval("ArticleId")%>' ImageUrl="~/Images/set.png"
                                    ToolTip="附件" CommandName="ArticleEditAttachment" CausesValidation="false" runat="server" />
                                <asp:ImageButton ID="imgDelete" ImageUrl="~/Images/del.png" CommandArgument='<%#Eval("ArticleId")%>'
                                    ToolTip="删除" CommandName="DeleArticle" OnClientClick="return confirm('你确定要删除此文章吗？');"
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
