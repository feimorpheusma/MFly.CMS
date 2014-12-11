<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="OrgnizationList.aspx.cs" Inherits="EMarket.Admin.SysManage.Orgnization.OrgnizationList" %>
<%@ OutputCache Location="None" %>
<%@ Register Src="../../Modules/OrgnizationTree.ascx" TagName="OrgnizationTree" TagPrefix="uc" %>
<asp:Content ID="Content" ContentPlaceHolderID="cphContent" runat="server">
    <asp:UpdatePanel ID="upOrgnizationList" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="contenttree">
                <div class="tags_content">
                    <table width="100%" border="0">
                        <tr>
                            <td class="zztree" style="border-right: none;" valign="top">
                                <div id="treekinds">
                                    <uc:OrgnizationTree ID="ucOrgnization" runat="server" />
                                </div>
                            </td>
                            <td class="zzxian" style="border-left: none;">
                                &nbsp;
                            </td>
                            <td style="border-left: none; border-right: none;" valign="top">
                                <div class="ltitle">                                
                                    <asp:Button ID="btnAdd" runat="server" Text="添加" CssClass="btnCommon" CausesValidation="false" />
                                </div>
                                <asp:UpdatePanel ID="uplQueryResult" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvOrgnizationList" runat="server" AutoGenerateColumns="False" AllowPaging="true"
                                            EmptyDataText="没有符合条件的数据" Width="100%" OnRowCommand="gvOrgnizationList_RowCommand"
                                            OnRowDataBound="gvOrgnizationList_RowDataBound" DataKeyNames="OrgnizationId"
                                            OnPageIndexChanging="gvOrgnizationList_PageIndexChanging" CssClass="zztable"
                                            GridLines="None" PagerSettings-PageButtonCount="4" PagerSettings-Mode="NumericFirstLast">
                                            <Columns>
                                                <asp:TemplateField HeaderText="部门名称" ItemStyle-Width="66%">
                                                    <ItemTemplate>
                                                        <asp:HyperLink Font-Underline="true" ID="hlkOrgnizationName" runat="server"><%#Eval("Name")%></asp:HyperLink>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="操作" ItemStyle-Width="33%">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgEdit" runat="server" ImageUrl="~/images/mody.png" ToolTip="修改"
                                                            BorderWidth="0" ImageAlign="Middle" />
                                                        <asp:ImageButton CommandArgument='<%#Eval("OrgnizationId") %>' CommandName="DeleteOrg"
                                                            CausesValidation="false" ID="imgDelete" runat="server" ImageUrl="~/images/del.png"
                                                            OnClientClick="return confirm('你确定要删除此部门吗？');" ToolTip="删除" BorderWidth="0" ImageAlign="Middle" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="40%" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="zztitle" Font-Bold="True" />
                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" />
                                            <PagerStyle CssClass="flickr" />
                                            <AlternatingRowStyle BackColor="#f1f1f1" />
                                            <RowStyle BackColor="#ffffff" HorizontalAlign="Center" />
                                        </asp:GridView>
                                        <div>
                                            <asp:Label ID="lblError" runat="server" CssClass="ErrLabel" Width="300" Style="color: #FF0000"></asp:Label>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
