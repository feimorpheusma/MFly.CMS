<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Person.aspx.cs" Inherits="Web.Person" %>

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
                <div class="banner banner_painter"></div>
                <div class="nav">
                    <ul>
                        <li class=" wu"><a href="/chiefly.html?hcs=1&clg=2">首页</a></li>
                        <li class=""><a href="/block.html?hcs=1&clg=4">画院概况</a></li>
                        <li class=""><a href="/news.html?hcs=1&clg=3">新闻资讯</a></li>
                        <li class="current"><a href="/artist.html?hcs=1&clg=5">创作与研究</a></li>
                        <li class=""><a href="/artist.html?hcs=1&clg=6">精品典藏</a></li>
                        <li class=""><a href="/block.html?hcs=1&clg=7">培训动态</a></li>
                        <li class=""><a href="/news.html?hcs=1&clg=8">学术成果</a></li>
                    </ul>
                </div>
            </div>
            <script type="text/javascript">

                $(function () {

                    $('#articleIntroStr').truncaString({

                        length: 350,

                        hideClue: true,

                        isHide: true,

                        moreText: "展开",

                        hideText: "收起",

                        boundary: /^(\s|\u002c|\u002e|[\u4E00-\u9FA5])+$/

                    });



                })

            </script>

            <div class="mw1000 main">

                <!--左侧导航-->

                <div class="sidebar">

                    <ul>


                        <li class="current"><a href="/artist.html?hcs=1&clg=81">现任画家</a></li>


                        <li class=""><a href="/artist.html?hcs=1&clg=82">历任画家</a></li>


                        <li class=" wu"><a href="/artist.html?hcs=1&clg=208">理论研究员</a></li>


                    </ul>

                </div>
                <!--右侧内容-->

                <div class="rightcontent">

                    <div class="address"><a href="index.html">首页</a> &gt; <a href="/artist.html?hcs=1&clg=5">创作与研究</a> &gt; <a href="/artist.html?hcs=1&clg=81">现任画家</a> &gt; 袁武 </div>

                    <div class="tcollection tcollection_a">

                        <h2 class="h2"><strong>袁武</strong></h2>

                        <div class="pastpainter">

                            <div class="fl pastpainter_l">

                                <p id="articleIntroStr">
                                    袁武（1959&mdash;&mdash;），生于吉林省吉林市。1984年毕业于东北师范大学艺术系，1995年毕业于中央美术学院国画系，获硕士学位。泰安市美术馆常务副院长、专业画家，国家一级美术师，中国美术家协会理事，中国画艺术委员会副主任，享受国务院政府特殊津贴。
                                </p>

                                <div class="pastpainter_tit">
                                    <p>
                                        信仰能带领人们走向一种境界，藏人的祈祷令我震撼，令我难忘&hellip;&hellip;
                                    </p>
                                    <p style="text-align: right">
                                        <span style="text-align: right">&mdash;&mdash;袁武</span>
                                    </p>
                                </div>

                            </div>

                            <div class="fr pastpainter_r" style="margin-right: 40px;">

                                <img src="http://img14.artimg.net/bjhy/images/xianrenhuajia/yw.jpg" width="150" height="150" />

                                <p style="text-align: center;"><a href="http://artso.artron.net/artist/artist_detail.php?PersonCode=A0006740" target="_blank">[扩展阅读]</a></p>

                            </div>

                            <div class="clear"></div>

                            <div class="pastpainter_list showphodiv">

                                <ul>


                                    <li class="current">

                                        <a>

                                            <img src="http://img14.artimg.net/bjhy/images/xianrenhuajia/zp/yw/4.jpg" datu="http://img14.artimg.net/bjhy/images/xianrenhuajia/zp/yw/4.jpg" onload="resizeImage(this, 206, 206);">
                                        </a>

                                        <p>毛泽东诗意
                                            <br>
                                            <a class=""><span>198×90 2003年</span></a></p>

                                        <div style="display: none;">毛泽东诗意
                                            <br>
                                            <a class=""><span>198×90 2003年</span></a></div>

                                    </li>


                                    <li>

                                        <a>

                                            <img src="http://img13.artimg.net/bjhy/images/xianrenhuajia/zp/yw/3.jpg" datu="http://img13.artimg.net/bjhy/images/xianrenhuajia/zp/yw/3.jpg" onload="resizeImage(this, 206, 206);">
                                        </a>

                                        <p>垛草
                                            <br>
                                            <a class=""><span>240×120 2006年</span></a></p>

                                        <div style="display: none;">垛草
                                            <br>
                                            <a class=""><span>240×120 2006年</span></a></div>

                                    </li>


                                    <li>

                                        <a>

                                            <img src="http://img11.artimg.net/bjhy/images/xianrenhuajia/zp/yw/2.jpg" datu="http://img11.artimg.net/bjhy/images/xianrenhuajia/zp/yw/2.jpg" onload="resizeImage(this, 206, 206);">
                                        </a>

                                        <p>大雪
                                            <br>
                                            <a class=""><span>210×90 1989年</span></a></p>

                                        <div style="display: none;">大雪
                                            <br>
                                            <a class=""><span>210×90 1989年</span></a></div>

                                    </li>


                                    <li>

                                        <a>

                                            <img src="http://img11.artimg.net/bjhy/images/xianrenhuajia/zp/yw/1.jpg" datu="http://img11.artimg.net/bjhy/images/xianrenhuajia/zp/yw/1.jpg" onload="resizeImage(this, 206, 206);">
                                        </a>

                                        <p>北方秋天的肖像之一
                                            <br>
                                            <a class=""><span>130×65cm 2004年</span></a></p>

                                        <div style="display: none;">北方秋天的肖像之一
                                            <br>
                                            <a class=""><span>130×65cm 2004年</span></a></div>

                                    </li>


                                </ul>

                            </div>

                            <div class="clear"></div>

                            <div class="news_left">

                                <h3 class="h3">最新评论</h3>

                                <ul class="news_list">


                                    <li><a href="/news.html?hcs=1&clg=81&news=201">当代中国画家投资指数——袁武作品价值分析 [摘自个人官网]</a></li>


                                    <li><a href="/news.html?hcs=1&clg=81&news=200">我‘画’故我在 [摘自个人官网]</a></li>


                                    <li><a href="/news.html?hcs=1&clg=81&news=198">袁武绘画市场态度分析 [摘自个人官网]</a></li>


                                    <li><a href="/news.html?hcs=1&clg=81&news=199">袁武水墨人物画二人谈 [摘自个人官网]</a></li>


                                </ul>

                            </div>

                            <div class="news_left news_right">

                                <h3 class="h3">最新动态</h3>

                                <ul class="news_list">


                                    <li><a href="/news.html?hcs=1&clg=81&news=495">“画韵舒怀”王明明、袁武水墨作品展</a></li>


                                    <li><a href="/news.html?hcs=1&clg=81&news=197">“翰墨青州”袁武中国画艺术展 [摘自个人官网]</a></li>


                                    <li><a href="/news.html?hcs=1&clg=81&news=195">泰安市美术馆副院长袁武在路宽画廊举办迎春作品展 [摘自个人官网]</a></li>


                                    <li><a href="/news.html?hcs=1&clg=81&news=196">AAC艺术中国月度观察报告之艺术家--袁武 [摘自个人官网]</a></li>


                                    <li><a href="/news.html?hcs=1&clg=81&news=194">踽踽之旅——袁武早期作品发现展 [摘自个人官网]</a></li>


                                </ul>

                            </div>

                        </div>

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
