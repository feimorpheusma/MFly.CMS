<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Web.List1" %>

<%@ Register TagPrefix="uc" Src="~/UserControls/Search.ascx" TagName="Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpRightContent" runat="server">
    <!--搜索框-->

    <uc:Search runat="server" ID="ucSearch"></uc:Search>
    <div class="tnews">
        <ul class="tnews_list">
            <asp:Repeater ID="rptList" runat="server">
                <ItemTemplate>
                    <li>
                        <h3><a href="Detail.aspx?aid=<%#Eval("ArticleId") %>"><%#Eval("Title") %><span>2014-08-08</a></span></h3>
                        <p style="padding: 0 0 0 16px;">
                            <%#Eval("Content") %>
                        </p>
                        <a href="Detail.aspx?aid=<%#Eval("ArticleId") %>" class="more">+more</a>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <div class="page">
        <a href="#" class="current">1</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=5">2</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=10">3</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=15">4</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=20">5</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=25">6</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=30">7</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=5">下一页</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=45">尾页</a>
        <input type="text" class="ipt_page" name="srt" value="1" length="5" basic="/news.html?hcs=1&clg=9" />
        <a href="#" init="go">跳转</a>
    </div>
</asp:Content>
