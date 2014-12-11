<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageList1.aspx.cs" Inherits="Web.ImageList" %>

<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
    <form id="form1" runat="server">
        <div id="bigbg" style="position: relative; display: block;">
            <div class="mw1000 header">
                <a href="/chiefly.html?hcs=1" class="logo" title="泰安市美术馆"></a>
                <div class="banner banner_collection"></div>
                <div class="nav">
                    <ul>
                        <li class=" wu"><a href="/chiefly.html?hcs=1&clg=2">首页</a></li>
                        <li class=""><a href="/block.html?hcs=1&clg=4">画院概况</a></li>
                        <li class=""><a href="/news.html?hcs=1&clg=3">新闻资讯</a></li>
                        <li class=""><a href="/artist.html?hcs=1&clg=5">创作与研究</a></li>
                        <li class="current"><a href="/artist.html?hcs=1&clg=6">精品典藏</a></li>
                        <li class=""><a href="/block.html?hcs=1&clg=7">培训动态</a></li>
                        <li class=""><a href="/news.html?hcs=1&clg=8">学术成果</a></li>
                    </ul>
                </div>
            </div>
            <div class="mw1000 main">
                <!--左侧导航-->

                <div class="sidebar">

                    <ul>


                        <li class="current"><a href="/artist.html?hcs=1&clg=83">中国画</a></li>


                        <li class=" wu"><a href="/opus.html?hcs=1&clg=89">齐白石精品</a></li>


                    </ul>

                </div>
                <!--右侧内容-->
                <div class="rightcontent">
                    <div class="address"><a href="index.html">首页</a> &gt; <a href="/artist.html?hcs=1&clg=6">精品典藏</a> &gt; 中国画</div>
                    <!--搜索框-->
                    <div class="search search_collection">
                        <form name="search" action="/opus.html" method="get">
                            <input type="hidden" name="is_all" id="is_all" value="0">
                            <input type="hidden" name="hcs" value="1">
                            <input type="text" name="search" class="ipt_text current change_bg" value="关键词" place="关键词" />
                            <input type="text" name="author" class="ipt_text ipt_zz change_bg" value="作者" place="作者" />
                            <div class="sel_pl xiala change_bg">
                                <select name="clg" id="sel_pl" class="change_bg">
                                    <option value="0">品类</option>
                                    <option value="83" selected>中国画</option>
                                    <option value="89">齐白石精品</option>
                                </select>
                            </div>
                            <input name="start" value="开始时间" id="inputDatestart" class="datetime timestart change_bg">
                            <input name="end" value="结束时间" id="inputDateend" class="datetime timesover change_bg">
                            <a href="javascript:;" class="btn_search" title="搜索" init="check"></a>
                            <script>
                                document.getElementById('inputDatestart').onclick = function () { WdatePicker() }
                                document.getElementById('inputDateend').onclick = function () { WdatePicker() }
                            </script>
                        </form>
                    </div>
                    <div class="scholarship tcollection_a">
                        <!--h2 class="h2"><strong>中国画</strong></h2-->
                        <ul class="pho_list">
                            <li><a href="/artist.html?hcs=1&clg=83&artist=336">
                                <img src="http://img13.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/05049g111.jpg" /><span>黄宾虹</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=347">
                                <img src="http://img12.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/chenbanding/cbdfm.jpg" /><span>陈半丁</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=337">
                                <img src="http://img14.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/05142g111.jpg" /><span>金城（金北楼）</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=348">
                                <img src="http://img13.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/chenbanding/yfafm.jpg" /><span>于非闇</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=281">
                                <img src="http://img12.artimg.net/bjhy/images/diancagxinxi/zhongguohua/20131122141339.jpg" /><span>郭沫若</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=339">
                                <img src="http://img13.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/xubeihong/06070.jpg" /><span>徐悲鸿</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=349">
                                <img src="http://img10.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/fengziyu/fzyfm.jpg" /><span>丰子恺</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=350">
                                <img src="http://img11.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/likuchan/lkcfm.jpg" /><span>李苦禅</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=340">
                                <img src="http://img10.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/zhangdaqian/06515(1).jpg" /><span>张大千</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=352">
                                <img src="http://img11.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/wangxuetao/wxtfm.jpg" /><span>王雪涛</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=35">
                                <img src="http://img13.artimg.net/bjhy/images/diancagxinxi/zhongguohua/1wjtslt.jpg" /><span>吴镜汀</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=353">
                                <img src="http://img13.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/fubaoshi/fbsfm.jpg" /><span>傅抱石</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=20">
                                <img src="http://img14.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/1jzh.jpg" /><span>蒋兆和</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=21">
                                <img src="http://img14.artimg.net/bjhy/images/diancagxinxi/zhongguohua/1lkrslt.jpg" /><span>李可染</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=354">
                                <img src="http://img14.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/yeqianyu/yqyfm.jpg" /><span>叶浅予</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=235">
                                <img src="http://img13.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/csmzp333.jpg" /><span>陈少梅</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=11">
                                <img src="http://img11.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/1czf.jpg" /><span>崔子范</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=338">
                                <img src="http://img13.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/tianshiguang/05531g111.jpg" /><span>田世光</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=284">
                                <img src="http://img14.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/47_7398_1259934960421.jpg" /><span>李斛</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=341">
                                <img src="http://img10.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/yaoyouduo/yaoyouduofengmian.jpg" /><span>姚有多</span></a></li>
                            <li><a href="/artist.html?hcs=1&clg=83&artist=355">
                                <img src="http://img13.artimg.net/bjhy/images/2014/beijinghuayuan/5diancangxinxi/zhongguohua/zhousicong/zscfm155.jpg" /><span>周思聪</span></a></li>

                        </ul>
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
