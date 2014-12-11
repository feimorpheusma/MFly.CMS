<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="BBSListAllPage.aspx.cs" Inherits="Mfly.CMS.Admin.BBS.BBSListAllPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphContent" runat="server">
    <asp:UpdatePanel ID="upEmployeeList" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlQueryCondition" runat="server" CssClass="search">
                <label>
                    发帖人：</label>
                <asp:TextBox ID="txtPostUserName" runat="server" MaxLength="50" CssClass="smallInput"></asp:TextBox>
                <label>
                    帖子标题：</label>
                <asp:TextBox ID="txtPostTitle" runat="server" MaxLength="50" CssClass="smallInput"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text=" 搜 索 " OnClick="btnSearch_Click"
                    CssClass="bt1" CausesValidation="false" />
            </asp:Panel>
            <div class="content">
                <asp:GridView ID="gvPostsList" runat="server" AutoGenerateColumns="False" OnRowCommand="gvPostsList_RowCommand" GridLines="None"
                    AllowPaging="true" PagerSettings-PageButtonCount="4" PagerSettings-Mode="NumericFirstLast"
                    OnPageIndexChanging="gvPostsList_PageIndexChanging" EmptyDataText="没有符合条件的数据">
                    <Columns>
                        <%--<asp:BoundField DataField="PostId" HeaderText="序号">
                            <ItemStyle Width="80px" HorizontalAlign="Center" />
                        </asp:BoundField>--%>
                        <asp:BoundField DataField="Title" HeaderText="帖子标题">
                            <ItemStyle Width="300px"/>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="发帖人">
                            <ItemTemplate>
                                <asp:Label ID="Label1" Text='<%#(Eval("RealName")==""||Eval("RealName")==null)?Eval("LoginName"):Eval("RealName") %>'
                                    runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="120px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Views" HeaderText="点击率">
                            <ItemStyle Width="80px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ReplyCount" HeaderText="回复次数">
                            <ItemStyle Width="80px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CreatedDate" HeaderText="发帖时间" DataFormatString="{0:yyyy-MM-dd hh:mm:ss}">
                            <ItemStyle Width="200px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LastReplyDateTime" HeaderText="最后回复时间" DataFormatString="{0:yyyy-MM-dd hh:mm:ss}">
                            <ItemStyle Width="200px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="操作" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgDelete" ImageUrl="~/images/del.png" CommandArgument='<%#String.Format("{0}",Eval("PostId")) %>'
                                    ToolTip="删除" CommandName="DeleUser" OnClientClick="return confirm('你确定要删除此帖子吗？');"
                                    runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
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
