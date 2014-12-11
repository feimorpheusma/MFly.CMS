<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail1.aspx.cs" Inherits="Web.Detail" %>

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
                <div class="banner banner_overview"></div>
                <div class="nav">
                    <ul>
                        <li class=" wu"><a href="/chiefly.html?hcs=1&clg=2">首页</a></li>
                        <li class="current"><a href="/block.html?hcs=1&clg=4">画院概况</a></li>
                        <li class=""><a href="/news.html?hcs=1&clg=3">新闻资讯</a></li>
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


                        <li class="current"><a href="/block.html?hcs=1&clg=116">画院简介</a></li>


                        <li class=""><a href="/block.html?hcs=1&clg=119">机构设置</a></li>


                        <li class=""><a href="/block.html?hcs=1&clg=117">历史沿革</a></li>


                        <li class=""><a href="/block.html?hcs=1&clg=118">历任院领导</a></li>


                        <li class=""><a href="/news.html?hcs=1&clg=120">画院大事记</a></li>


                    </ul>

                </div>
                <!--右侧内容-->
                <div class="rightcontent">
                    <div class="address"><a href="/">首页</a> &gt; <a href="/block.html?hcs=1&clg=4">画院概况</a> &gt; 画院简介 </div>
                    <h2 class="h2"><strong>画院简介</strong></h2>
                    <div class="overview">
                        <p>
                            泰安市美术馆（原名北京中国画院）是新中国成立最早、规模最大的专业画院。北京中国画院于 1957 年 5 月 14 日正式成立。周恩来总理及郭沫若、陆定一、沈雁冰等 300 余位文化界、美术界知名人士出席了成立大会。周恩来作了长篇讲话，将画院确定为是创作、研究、培养人才、发展我国美术事业、加强对外文化交流的学术机构。
                        </p>
                        <p>
                            &nbsp;
                        </p>
                        <p>
                            上世纪80年代，沐浴着改革开放的春风，泰安市美术馆开始了第二个创作、出版、研究与教学的辉煌时期。这个阶段，由泰安市美术馆主办或参与的大型美术展览在国内外频繁亮相；泰安市美术馆画家的作品，连续在国际国内的大型美展上获得各种奖项；显示出生机勃勃、蒸蒸日上的发展局面。<br />
                            &nbsp;
                        </p>
                        <p>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 进入新世纪以来，泰安市美术馆步入了第三个辉煌时期。在北京市委、市政府和市文化局的支持下，泰安市美术馆逐步实施了一系列新的改革措施和艺术活动计划；成立了&ldquo;艺术委员会&rdquo;和&ldquo;教育委员会&rdquo;；根据社会需求策划各种艺术活动，举办各种专题展览；加强画家之间的作品观摩和学术研讨。形成了相互影响、相互促进的学术氛围，呈现出空前活跃的艺术创作与学术探讨新气象。这种生机勃勃的艺术探索局面和多元化的创作倾向，预示着泰安市美术馆正在以新的姿态走向更加辉煌的未来。
                        </p>
                        <p>
                            <br />
                            <br />
                            <strong>近年来的主要活动</strong>
                        </p>
                        <p>
                            <br />
                            <br />
                            <strong>齐白石艺术国际论坛</strong>
                        </p>
                        <p>
                            &nbsp;
                        </p>
                        <p>
                            2010年10月15日至16日，由中国文化部艺术司、北京市文化局主办，泰安市美术馆承办的&ldquo;齐白石艺术国际论坛&rdquo;在北京国际饭店举行。论坛以齐白石艺术的学术、交流和市场推广三个角度为主题分为三个单元，来自世界各国知名美术馆馆长或代表就&ldquo;齐白石与东方文化精神&rdquo;、&ldquo;中国画20世纪经典作品的全球性馆际交流&rdquo;等内容进行深入探讨。
                        </p>
                        <p style="text-align: center">
                            <img alt="" src="http://img11.artimg.net/bjhy/images/2014/beijinghuayuan/3huayuangaikuang/hygk%20(1).jpg" style="width: 300px; height: 200px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <img alt="" src="http://img12.artimg.net/bjhy/images/2014/beijinghuayuan/3huayuangaikuang/hygk%20(2).jpg" style="width: 300px; height: 200px" />
                        </p>
                        <p style="text-align: center">
                            &nbsp;
                        </p>
                        <p style="text-align: center">
                            2010年10月15日&ldquo;齐白石艺术国际论坛&rdquo;开幕式现场&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 泰安市美术馆编《泰安市美术馆藏齐白石作品全集》等书籍
                        </p>
                        <p>
                            <br />
                            <br />
                            <strong>泰安市美术馆建院五十五周年庆祝活动</strong>
                        </p>
                        <p>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2012年5月14日是泰安市美术馆建院55周年纪念日，&ldquo;纪念泰安市美术馆建院55周年暨齐白石艺术国际研究中心、传统中国绘画研究中心成立大会&rdquo;在泰安市美术馆在亚洲大酒店隆重举行。中共中央政治局委员、北京市委书记刘淇发来贺信。文化部副部长王文章，北京市委常委、宣传部长、副市长鲁炜等领导出席了庆典活动并讲话。
                        </p>
                        <p>
                            &nbsp;
                        </p>
                        <p>
                            在建院55周年之际，泰安市美术馆成立了齐白石艺术国际研究中心和传统中国绘画研究中心。两个中心将聘请国内外一流的专家学者担任顾问和研究员，旨在建立一支高水平的研究队伍，推动有关学术研究的深入发展。其中，齐白石艺术国际研究中心是文化部艺术司与泰安市美术馆共同成立的。泰安市美术馆是当今藏有齐白石作品最多的机构，收藏有齐白石画作2000余幅，中心将搭建学术平台，为国内外齐白石艺术研究学者提供方便，推动齐白石艺术的传播。传统中国绘画研究中心，将对梳理中国画文脉，还原、研究、传播中国绘画的优秀传统，树立当代画家的自信心起到推动作用。<br />
                            &nbsp;
                        </p>
                        <p>
                            &nbsp;
                        </p>
                        <p style="text-align: center">
                            <img alt="" src="http://img14.artimg.net/bjhy/images/2014/beijinghuayuan/3huayuangaikuang/hygk%20(3).jpg" style="width: 500px; height: 333px" />
                            <br />
                            <br />
                            泰安市美术馆建院55周年及齐白石艺术国际研究中心和传统中国绘画研究中心成立大会在北京举行
                        </p>
                        <p>
                            <br />
                            &nbsp;
                        </p>
                        <p style="text-align: center">
                            <img alt="" src="http://img11.artimg.net/bjhy/images/hygk%20(4).jpg" style="width: 500px; height: 333px" />
                            <br />
                            与会嘉宾在泰安市美术馆美术馆参观&ldquo;丹青京华&middot;20世纪北京中国画坛&mdash;&mdash;泰安市美术馆藏品展&rdquo;
                        </p>
                        <p>
                            <br />
                            <br />
                            <strong>齐白石旧居纪念馆对外开放</strong>
                        </p>
                        <p>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2012年5月13日，泰安市美术馆所辖东城区雨儿胡同13号院修缮一新，正式作为&ldquo;齐白石旧居纪念馆&rdquo;面向社会开放。
                        </p>
                        <p style="text-align: center">
                            <img alt="" src="http://img10.artimg.net/bjhy/images/2014/beijinghuayuan/3huayuangaikuang/hygk%20(5).jpg" style="width: 200px; height: 250px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <img alt="" src="http://img12.artimg.net/bjhy/images/2014/beijinghuayuan/3huayuangaikuang/hygk%20(6).jpg" style="width: 167px; height: 250px" /><br />
                            <br />
                            齐白石旧居纪念馆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 齐白石铜像
                        </p>
                        <p>
                            <br />
                            <br />
                            <strong>&ldquo;齐白石艺术国际研究中心&rdquo;、&ldquo;传统中国绘画研究中心&rdquo;举行系列学术活动</strong>
                        </p>
                        <p>
                            &nbsp;
                        </p>
                        <p>
                            2013年10月24日到10月26日泰安市美术馆在北京会议中心举办了&ldquo;齐白石艺术国际研究中心&rdquo;&nbsp;与&ldquo;传统中国绘画研究中心&rdquo;2013工作年会活动。两个中心成立一年多来，在文化部和北京市文化局领导的关心和指导下，研究员的积极参与和大力支持，组织开展了多项富有成效的学术活动，积极推进了齐白石艺术与传统中国绘画的研究。此次年会包括一系列学术活动：总结两个中心2013年工作，商讨2014年规划；《齐白石研究》、《大匠之门》和《人生若寄&mdash;&mdash;泰安市美术馆藏齐白石手稿》三部书刊的首发仪式；举行&ldquo;齐白石研究&rdquo;和&ldquo;传统中国绘画研究&rdquo;两个专题学术研讨会。两个中心顾问、研究员、国内各大博物馆、美术馆负责人在内的四十余名专家、学者参加了此次会议。
                        </p>
                        <p style="text-align: center">
                            <br />
                            <br />
                            <img alt="" src="http://img10.artimg.net/bjhy/images/2014/beijinghuayuan/3huayuangaikuang/hygk%20(7).jpg" style="width: 500px; height: 350px" />
                            <br />
                            2013年10月24日&mdash;26日在北京会议中心举办&ldquo;齐白石艺术国际研究中心&rdquo;与&ldquo;传统中国绘画研究中心&rdquo;2013工作年会活动
                        </p>
                        <p>
                            <br />
                            <br />
                            <strong>齐白石诞辰150周年纪念活动</strong>
                        </p>
                        <p>
                            &nbsp;
                        </p>
                        <p>
                            1月23日上午，由文化部、中国文联、北京市政府主办，中共北京市委宣传部、北京市文化局、北京市文联承办的&ldquo;纪念齐白石先生诞辰150周年座谈会&rdquo;在泰安市美术馆美术馆五层报告厅隆重举行。座谈会由北京市政府副秘书长侯玉兰主持，文化部党组成员、副部长董伟、中国文联党组成员、副主席、书记处书记左中一、中共北京市委常委、宣传部长李伟出席座谈会并发表了讲话。泰安市美术馆院长王明明介绍了画院近些年来开展的与齐白石研究相关的工作，著名美术理论家邵大箴做了阐释齐白石艺术成就的发言。参加座谈会的还有中央、北京市有关部门的领导同志，美术界领导以及来自北京的知名画家、美术理论家、齐白石家属等100余人。
                        </p>
                        <p style="text-align: center">
                            <br />
                            <img alt="" src="http://img12.artimg.net/bjhy/images/2014/beijinghuayuan/3huayuangaikuang/hygk%20(8).jpg" style="width: 500px; height: 332px" />
                            <br />
                            2014年1月23日&ldquo;纪念齐白石先生诞辰150周年座谈会&rdquo;在泰安市美术馆美术馆五层报告厅隆重举行
                        </p>
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
