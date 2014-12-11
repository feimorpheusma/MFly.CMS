<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="ArticleAttachment.aspx.cs" Inherits="Mfly.CMS.Admin.Article.ArticleAttachment" %>

<%@ Register Src="~/Modules/HTMLEditor/HTMLEditor.ascx" TagName="HTMLEditor" TagPrefix="uc1" %>
<asp:Content ID="Content" ContentPlaceHolderID="cphContent" runat="server">
    <div class="content">
        <asp:GridView runat="server" ID="gvList" AutoGenerateColumns="False"
            EmptyDataText="没有符合条件的数据" GridLines="None" Width="100%"
            OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="图片" HeaderStyle-Width="15%">
                    <ItemTemplate>
                        <asp:Image ID="imgPic" Width="100" Height="100" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="描述" DataField="Description" />
                <asp:TemplateField HeaderText="操作" HeaderStyle-Width="15%">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgDelete" ImageUrl="~/Images/del.png" CommandArgument='<%#Eval("ArticleAttachmentId")%>'
                            ToolTip="删除" CommandName="DeleteAttachment" OnClientClick="return confirm('你确定要删除此图片吗？');"
                            CausesValidation="false" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="trtit" />
            <AlternatingRowStyle BackColor="#f1f1f1" />
            <RowStyle BackColor="#ffffff" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    <div class="content">
        <div class="tags_content">
            <table width="98%" border="1">
                <tr>
                    <td class="mtitle" valign="top">图片：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:FileUpload ID="ImageFile" runat="server" />
                        <asp:CustomValidator ID="CValidatorImage" EnableClientScript="false" runat="server"
                            ErrorMessage="" ForeColor="Red" OnServerValidate="CValidatorImage_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle" valign="top">描述：
                    </td>
                    <td style="padding-left: 10px">
                        <uc1:HTMLEditor ID="htmlEditor" runat="server" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <p style="text-align: center;">
                <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" CssClass="btnCommon" CausesValidation="true" />
                <asp:Button ID="btnCancel" runat="server" Text="返回" OnClick="btnCancel_Click" CausesValidation="false"
                    CssClass="btnCommon" />
            </p>
        </div>
    </div>
</asp:Content>
