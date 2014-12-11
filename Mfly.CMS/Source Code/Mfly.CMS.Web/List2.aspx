<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List2.aspx.cs" Inherits="Web.List" %>

<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>泰安市美术馆</title>
    <link type="text/css" rel="stylesheet" href="/style/reset.css" />
    <link type="text/css" rel="stylesheet" href="/style/style.css" />
    <link type="text/css" rel="stylesheet" href="/style/datetime.css" />
    <link type="text/css" rel="stylesheet" href="/style/two.css" />
    <script type="text/javascript" src="/js/jquery1.7.2.js"></script>
    <script src="/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/js/slides.min.jquery.js"></script>
    <script type="text/javascript" src="/js/jquery.select.js"></script>
    <script type="text/javascript" src="/js/tab.js"></script>
    <script type="text/javascript" src="/js/swfobject.js"></script>
    <script type="text/javascript" src="/js/hotpic.js"></script>
    <script type="text/javascript" src="/js/jquery.truncatable.js"></script>
    <script language="javascript" type="text/javascript" src="/js/cal/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="/js/fangdajing/subpage.style.css">
    <link rel="stylesheet" type="text/css" href="/js/fangdajing/auction.style.css">
    <link rel="stylesheet" type="text/css" href="/js/fangdajing/mglass.css" />
    <script type="text/javascript" src="/js/fangdajing/InzoneNavi.js"></script>
    <script type="text/javascript" src="/js/fangdajing/mglass.js"></script>
    <script type="text/javascript" src="/js/Images.js"></script>
    <!--20140806添加-->
    <script type="text/javascript" src="/js/bigpicroll.js"></script>
    <style>
        .backToTop {
            width: 54px;
            height: 85px;
            line-height: 1.2;
            color: #333;
            font-size: 12px;
            text-align: center;
            position: fixed;
            _position: absolute;
            left: 50%;
            margin-left: 505px;
            top: 162px;
            cursor: pointer;
            z-index: 2;
        }

            .backToTop img {
                width: 53px;
                height: 33px;
            }

            .backToTop div {
                height: 18px;
                border: 1px solid #d4d4d4;
                padding-top: 5px;
                margin-top: 2px;
                background-color: #fff;
                color: #333;
                display: block;
                zoom: 1;
            }

            .backToTop span div {
                width: 23px;
                height: 157px;
                float: left;
                margin: 1px;
                zoom: 1;
            }

            .backToTop a {
                color: #333;
                zoom: 1;
            }
    </style>
    <script>
        $(document).ready(function () {
            $('.sel_zz').imgFlash({
                selectBox: '.sel_zz',//定义要包含的主体区域
                selectIDmain: '#sel_zz',//定义要获取的下拉框ID
                selectMain: '<div id="Select11"></div>'//定义下拉主题
            });
            $('.sel_pl').imgFlash({
                selectBox: '.sel_pl',//定义要包含的主体区域
                selectIDmain: '#sel_pl',//定义要获取的下拉框ID
                selectMain: '<div id="Select22"></div>'//定义下拉主题
            });
            $('.sel_strat').imgFlash({
                selectBox: '.sel_strat',//定义要包含的主体区域
                selectIDmain: '#sel_strat',//定义要获取的下拉框ID
                selectMain: '<div id="Select33"></div>'//定义下拉主题
            });
            $('.sel_end').imgFlash({
                selectBox: '.sel_end',//定义要包含的主体区域
                selectIDmain: '#sel_end',//定义要获取的下拉框ID
                selectMain: '<div id="Select44"></div>'//定义下拉主题
            });
        });

        // 回到顶部
        (function () {
            var $backToTopTxt = "",
            $backToTopEle = $('<div class="backToTop"><img src="images/gotop.jpg" /><div><a href="/chiefly.html">中文</a></div><div style="display:none;"><a href="http://enbjaa2013.artron.net/" style="color:#333;">English</a></div><span><div style="height:115px;"><a href="/chiefly.html?hcs=11" target="_blank">泰安市美术馆美术馆</a></div><div style="height:115px;"><a href="/chiefly.html?hcs=136" target="_blank">齐白石旧居纪念馆</a></div><div><a href="/chiefly.html?hcs=125" target="_blank">齐白石艺术国际研究中心</a></div><div><a href="/chiefly.html?hcs=73" target="_blank">传统中国绘画研究中心</a></div></span></div>').appendTo($("body")).attr("title", $backToTopTxt),
            $backToTopFun = function () {
                var st = $(document).scrollTop(),
                winh = $(window).height();
                //(st > 0)? $backToTopEle.show(): $backToTopEle.hide();             
                //IE6下的定位        
                if (!window.XMLHttpRequest) {
                    $backToTopEle.css("top", st + winh - 166);
                }
            };
            $('.backToTop img').click(function () {
                $("html, body").animate({ scrollTop: 0 }, 120);
            });
            //$(window).bind("scroll", $backToTopFun);    
            $(function () {
                $backToTopFun();
            });
        })();
    </script>
</head>
<body>

    <form id="form2" runat="server">
        <div id="bigbg" style="position: relative; display: block;">
            <div class="mw1000 header">
                <a href="/chiefly.html?hcs=1" class="logo" title="泰安市美术馆"></a>
                <div class="banner banner_news"></div>
                <div class="nav">
                    <ul>
                        <li class=" wu"><a href="/chiefly.html?hcs=1&clg=2">首页</a></li>
                        <li class=""><a href="/block.html?hcs=1&clg=4">画院概况</a></li>
                        <li class="current"><a href="/news.html?hcs=1&clg=3">新闻资讯</a></li>
                        <li class=""><a href="/artist.html?hcs=1&clg=5">创作与研究</a></li>
                        <li class=""><a href="/artist.html?hcs=1&clg=6">精品典藏</a></li>
                        <li class=""><a href="/block.html?hcs=1&clg=7">培训动态</a></li>
                        <li class=""><a href="/news.html?hcs=1&clg=8">学术成果</a></li>
                    </ul>
                </div>
            </div>
            <div class="mw1000 main">
                <!--左侧导航-->

                <div class="sidebar">

                    <ul>


                        <li class="current"><a href="/news.html?hcs=1&clg=9">新闻资讯</a></li>


                        <li class=" wu"><a href="/news.html?hcs=1&clg=10">新闻专题</a></li>


                    </ul>

                </div>
                <!--右侧内容-->
                <div class="rightcontent">
                    <div class="address"><a href="/">首页</a> &gt; <a href="/news.html?hcs=1&clg=3">新闻资讯</a> &gt; 新闻资讯</div>
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
                </div>
                <div class="clear"></div>
            </div>
            <!--友情连接-->
            <div class="mw1000 link">
                <ul>
                    <li class="wu"><a href="/chiefly.html?hcs=11" target="_blank">泰安市美术馆美术馆</a></li>
                    <li><a href="/chiefly.html?hcs=125" target="_blank">齐白石艺术国际研究中心</a></li>
                    <li><a href="/chiefly.html?hcs=73" target="_blank">传统中国绘画研究中心</a></li>
                    <li><a href="/chiefly.html?hcs=136" target="_blank">齐白石旧居纪念馆</a></li>
                </ul>
            </div>
            <!--线-->

            <div class="line"></div>

            <!--底部-->

            <div class="mw1000 footer">

                <div class="share">
                    <!-- JiaThis Button BEGIN -->

                    <div class="jiathis_style_24x24">

                        <a class="jiathis_button_tsina"></a>

                        <a class="jiathis_button_weixin"></a>

                        <a class="jiathis_button_cqq"></a>

                        <a class="jiathis_button_tqq"></a>

                    </div>

                    <script type="text/javascript" src="http://v3.jiathis.com/code_mini/jia.js" charset="utf-8"></script>

                    <!-- JiaThis Button END -->



                    <div><a style="opacity: 1; filter: alpha(opacity=1); margin: 5px 0px 0px 40px;" href="/block.html?hcs=1&clg=206" target="_blank">友情链接</a></div>

                </div>

                版权所有 泰安市美术馆 京ICP备11047018<br />

                技术支持由雅昌艺术网提供
            </div>

        </div>
        <script type="text/javascript">
            var _mvq = _mvq || [];
            _mvq.push(['$setAccount', 'm-28447-0']);


            _mvq.push(['$setGeneral', '', '', /*用户名*/ '', /*用户id*/ '']);//如果不传用户名、用户id，此句可以删掉
            _mvq.push(['$logConversion']);
            (function () {
                var mvl = document.createElement('script');
                mvl.type = 'text/javascript'; mvl.async = true;
                mvl.src = ('https:' == document.location.protocol ? 'https://static-ssl.mediav.com/mvl.js' : 'http://static.mediav.com/mvl.js');
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(mvl, s);
            })();

        </script>
        <script type="text/javascript">
            var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
            document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fa36536cd7a1197873eb11daa7d573883' type='text/javascript'%3E%3C/script%3E"));
        </script>

    </form>
</body>

</html>
