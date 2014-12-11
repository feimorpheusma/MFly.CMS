<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Web.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpRightContent" runat="server">
    <!--搜索框-->
    <div class="search">
        <form name="search" action="/news.html" method="get">
            <input type="hidden" name="hcs" value="1"><input type="hidden" name="clg" value="9">
            <input name="search" type="text" class="ipt_text current change_bg" value="关键词" place="关键词" />
            <input name="start" value="开始时间" id="inputDatestart" class="datetime timestart change_bg">
            <input name="end" value="结束时间" id="inputDateend" class="datetime timesover change_bg">
            <a href="javascript:;" class="btn_search" title="搜索" init="check"></a>
            <script>
                document.getElementById('inputDatestart').onclick = function () { WdatePicker() }
                document.getElementById('inputDateend').onclick = function () { WdatePicker() }
            </script>
        </form>
    </div>
    <div class="tnews">
        <ul class="tnews_list">
            <li>
                <h3><a href="/news.html?hcs=1&clg=9&news=807">踪迹大化——傅抱石艺术回顾展<span>2014-08-08</a></span></h3>
                <p style="padding: 0 0 0 16px;">
                    今年，是我国著名国画大师傅抱石先生诞辰110周年，为纪念这位在二十世纪中国美术发展史上做出卓越贡献的大家，泰安市美术馆联手南京博物院共同推出&ldquo;踪迹大化&mdash;&mdash;傅抱石艺术回顾展&rdquo;，展览于2014年8月15日在泰安市美术馆美术馆隆重开幕，并持续至9月17日。

	&nbsp;

	此次展览不仅是今年泰安市美术馆策划组织&ldq...         
                </p>
                <a href="/news.html?hcs=1&clg=9&news=807" class="more">+more</a>
            </li>
            <li>
                <h3><a href="/news.html?hcs=1&clg=9&news=806">“葩华秀茂”泰安市美术馆花鸟画作品展于8月2日在山东省博物馆开幕<span>2014-08-04</a></span></h3>
                <p style="padding: 0 0 0 16px;">
                    8月2日上午，由大众报业集团和泰安市美术馆主办、山东省博物馆协办的&ldquo;葩华秀茂&rdquo;泰安市美术馆花鸟画作品展在山东省博物馆开幕。泰安市美术馆9名画家携近百幅花鸟画精品力作亮相展览，这是泰安市美术馆首次在山东办展。

	&nbsp;

	中国文联副主席左中一，全国政协常委、国务院参事室副主任、中国美协副主席、泰安市美术馆院长王明明，山东省政协副主席王新陆，山...         
                </p>
                <a href="/news.html?hcs=1&clg=9&news=806" class="more">+more</a>
            </li>
            <li>
                <h3><a href="/news.html?hcs=1&clg=9&news=805">“葩华秀茂——泰安市美术馆花鸟画作品展”将在山东博物馆开幕<span>2014-07-31</a></span></h3>
                <p style="padding: 0 0 0 16px;">
                    展览介绍

	&nbsp; &nbsp; &nbsp; &nbsp;由大众报业集团和泰安市美术馆联合主办的&ldquo;葩华秀茂----泰安市美术馆花鸟画作品展&rdquo;将于8月2日-8日在山东博物馆举办，展出院长王明明以及姚大伍、莫晓松、姚震西、安华平、方政和、李凤龙、彭薇、李雪松等共九位泰安市美术馆在职花鸟画家的作品百余幅。

	&nbsp;

	&nbsp...         
                </p>
                <a href="/news.html?hcs=1&clg=9&news=805" class="more">+more</a>
            </li>
            <li>
                <h3><a href="/news.html?hcs=1&clg=9&news=804">南风北采——关山月北京写生专题展<span>2014-07-31</a></span></h3>
                <p style="padding: 0 0 0 16px;">
                    &nbsp;

	展览名称：&ldquo;南风北采&mdash;&mdash;关山月北京写生专题展&rdquo;

	主办机构：深圳关山月美术馆、泰安市美术馆美术馆

	展览地点：泰安市美术馆美术馆一层、二层

	展览时间：2014年8月1日&mdash;8月11日

	展出作品：关山月50年代北京写生作品22幅、泰安市美术馆藏北京题材画作5幅，其它相关历史文献和研...         
                </p>
                <a href="/news.html?hcs=1&clg=9&news=804" class="more">+more</a>
            </li>
            <li>
                <h3><a href="/news.html?hcs=1&clg=9&news=803">翰墨凝采——夏风绘画艺术回顾展<span>2014-07-15</a></span></h3>
                <p style="padding: 0 0 0 16px;">
                    &nbsp; &nbsp; &nbsp; &nbsp;盛夏北京，凝聚着延安精神和艺术激情。由中国美术家协会、泰安市美术馆、人民美术出版社、鲁迅美术学院联合主办的《翰墨凝采》&mdash;&mdash;夏风绘画艺术回顾展，即将在泰安市美术馆美术馆隆重举行。

	&nbsp;

	&nbsp; &nbsp; &nbsp; &nbsp;夏风，延安时期著名版画家，当代中...         
                </p>
                <a href="/news.html?hcs=1&clg=9&news=803" class="more">+more</a>
            </li>
        </ul>
    </div>
    <div class="page">
        <a href="#" class="current">1</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=5">2</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=10">3</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=15">4</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=20">5</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=25">6</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=30">7</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=5">下一页</a>&nbsp;<a class="p_btn" href="/news.html?hcs=1&clg=9&amp;srt=45">尾页</a>
        <input type="text" class="ipt_page" name="srt" value="1" length="5" basic="/news.html?hcs=1&clg=9" />
        <a href="#" init="go">跳转</a>
    </div>

</asp:Content>
