<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="BBSModuleEdit.aspx.cs" Inherits="Mfly.CMS.Admin.BBS.BBSModuleEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphContent" runat="server">
    <script src="../JS/jquery-1.7.2.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
//            $("input[id$=btnReset]").click(function () {
//                $("input[id$=txtModuleName]").val("");
//                $("input[id$=txtModuleMemo]").val("");
//            });
            $("#btnReset").click(function () {
                $("input[id$=txtModuleName]").val("");
                $("input[id$=txtModuleMemo]").val("");
            });
        });
    </script>
    <asp:UpdatePanel ID="upEmployeeList" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnlQueryCondition" runat="server" CssClass="search">
                <asp:Button ID="btnAdd" runat="server" Text="添 加" OnClick="btnAdd_Click" CssClass="btnCommon" />
            </asp:Panel>
            <div class="content">
                <asp:GridView ID="gvModuleList" runat="server" AllowPaging="True" AutoGenerateColumns="False" EmptyDataText="没有符合条件的数据"
                OnRowCommand="gvModuleList_RowCommand" GridLines="None"
                    PagerSettings-PageButtonCount="4" PagerSettings-Mode="NumericFirstLast" Width="100%"
                    OnPageIndexChanging="gvModuleList_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="版块名称" HeaderStyle-Width="15%">
                         <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Width="160px" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnTitle" runat="server" Text='<%#Eval("Name") %>' CommandName="EditModule"
                                    CommandArgument='<%#Eval("PostModuleId")%>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>                       
                        <asp:BoundField DataField="Description" HeaderText="版块说明">
                            <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="操作" ItemStyle-Width="80px">
                            <ItemTemplate>
                            <asp:ImageButton ID="imgEdit" ImageUrl="~/images/mody.png" runat="server" ToolTip="修改"
                                    CausesValidation="false" CommandName="EditModule" CommandArgument='<%#Eval("PostModuleId")%>' />
                                <asp:ImageButton ID="imgDelete" ImageUrl="~/images/del.png" CommandArgument='<%#String.Format("{0}",Eval("PostModuleId")) %>'
                                    ToolTip="删除" CommandName="DeleModule" OnClientClick="return confirm('你确定要删除此版块吗？');"
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
