<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true"
    CodeBehind="ArticleDetail.aspx.cs" Inherits="Mfly.CMS.Admin.Article.ArticleDetail" %>

<%@ Register Src="~/Modules/HTMLEditor/HTMLEditor.ascx" TagName="HTMLEditor" TagPrefix="uc1" %>
<asp:Content ID="Content" ContentPlaceHolderID="cphContent" runat="server">
    <%--   <asp:UpdatePanel ID="upArticle" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
    <div class="content">
        <div class="tags_content">
            <table width="98%" border="1">
                <tr>
                    <td class="mtitle">
                        所属菜单：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:DropDownList ID="ddlMenu" runat="server">
                        </asp:DropDownList>
                        <font color="red">*</font>
                        <asp:CompareValidator ID="cvMenu" runat="server" ErrorMessage="请选择菜单" ForeColor="Red"
                            Display="Dynamic" ControlToValidate="ddlMenu" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle">
                        文章类型：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:DropDownList ID="ddlNewsType" runat="server">
                        </asp:DropDownList>
                        <font color="red">*</font>
                        <asp:CompareValidator ID="cvNewsType" runat="server" ErrorMessage="请选择文章类型" ForeColor="Red"
                            Display="Dynamic" ControlToValidate="ddlNewsType" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle">
                        文章标题：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:TextBox ID="txtTitle" runat="server" MaxLength="50"></asp:TextBox>
                        <font color="red">*</font>
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
                            ForeColor="Red" Display="Dynamic" ErrorMessage="标题不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle">
                        文章来源：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:TextBox ID="txtSource" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle" valign="top">
                        文章作者：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle" valign="top">
                        首页显示图片：
                    </td>
                    <td style="padding-left: 10px">
                        <asp:FileUpload ID="ImageFile" runat="server" />
                        <asp:CustomValidator ID="CValidatorImage" EnableClientScript="false" runat="server"
                             ErrorMessage="" ForeColor="Red" OnServerValidate="CValidatorImage_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="mtitle" valign="top">
                        文章内容：
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
    <%--     </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
