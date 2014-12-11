<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Author.ascx.cs" Inherits="Web.UserControls.Author" %>
<div class="pastpainter">
    <div class="fl pastpainter_l">
        <p id="articleIntroStr">
            <asp:Literal Text="" ID="ltlContent" runat="server" />
        </p>
        <div class="pastpainter_tit">
            <p>
                <asp:Literal Text="" ID="ltlSource" runat="server" /><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <p style="text-align: right;">
                ———<asp:Literal Text="" ID="ltlAuthorName" runat="server" />
            </p>
        </div>
    </div>
    <div class="fr pastpainter_r" style="margin-right: 40px;">
        <asp:Image ImageUrl="" ID="imgPic" runat="server" Width="150" Height="150" />
        <%--<p style="text-align: center;"><a href="http://artso.artron.net/artist/artist_detail.php?PersonCode=A0000051" target="_blank">[扩展阅读]</a></p>--%>
    </div>
    <div class="clear"></div>
    <div class="pastpainter_list showphodiv">
        <ul>
            <asp:Repeater ID="rptList" runat="server" OnItemDataBound="rptList_ItemDataBound">
                <ItemTemplate>
                    <li class="">
                        <a>
                            <asp:Image ID="imgPic" runat="server" />
                            <%--<img src="http://img11.artimg.net/bjhy/images/xianrenhuajia/zp/cys/5.jpg" datu="http://img11.artimg.net/bjhy/images/xianrenhuajia/zp/cys/5.jpg" onload="resizeImage(this, 206, 206);" style="top: 76px; left: 0px;">--%>
                        </a>
                        <%#Eval("Description") %>
                        <%-- <p style="top: 154px;">
                            1937—南京大屠杀（中华百...
                    <br>
                            <a class=""><span>365x1350 1986年</span></a>
                        </p>

                        <div style="display: none;">
                            1937—南京大屠杀（中华百年祭之四）
                    <br>
                            <a class=""><span>365x1350 1986年</span></a>
                        </div>--%>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <div class="clear"></div>

</div>
