<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web.Default" %>

<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>泰安市美术馆</title>
    <link type="text/css" rel="stylesheet" href="/style/reset.css" />
    <link type="text/css" rel="stylesheet" href="/style/style.css" />
    <link type="text/css" rel="stylesheet" href="/style/datetime.css" />
    <link type="text/css" rel="stylesheet" href="/style/index.css" />
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
    </script>
</head>
<body>
    <form id="form2" runat="server">
        <div id="bigbg" style="position: relative; display: block;">
            <div class="mw1000 header">
                <a href="/chiefly.html?hcs=1" class="logo" title="泰安市美术馆"></a>
                <div class="banner banner_index"></div>
                <div class="nav">
                    <ul>
                        <li class=" wu"><a href="Default.aspx">首页</a></li>
                        <asp:Repeater ID="rptMenu" runat="server" OnItemDataBound="rptMenu_ItemDataBound">
                            <ItemTemplate>
                                <li class="current">
                                    <asp:HyperLink ID="hlMenu" runat="server" />
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                   <%-- <ul>
                        <li class="current wu"><a href="Default.aspx">首页</a></li>
                        <li class=""><a href="Detail.aspx?mid=7">画院概况</a></li>
                        <li class=""><a href="List.aspx?mid=9">新闻资讯</a></li>
                        <li class=""><a href="ImageList.aspx?mid=12">创作与研究</a></li>
                        <li class=""><a href="ImageList.aspx?mid=10">精品典藏</a></li>
                        <li class=""><a href="List.aspx?mid=5">培训动态</a></li>
                        <li class=""><a href="List.aspx?mid=6">学术成果</a></li>
                    </ul>--%>
                </div>
            </div>
            <script language="JavaScript" type="text/javascript">
                $(function () {

                    $('#slides').slides({

                        generateNextPrev: true,

                        play: 2500

                    });

                });
            </script>

            <div class="mw1000 main">

                <div class="hotpic" id="slides">

                    <div class="slides_container">

                        <asp:Repeater runat="server" ID="rptTopNews" OnItemDataBound="articleImage_ItemDataBound">
                            <ItemTemplate>
                                <div>

                                    <a href="#" target="_blank" title="<%#Eval("Title") %>">
                                        <asp:Image ID="imgPic" Width="460" Height="330" runat="server" />

                                    </a>

                                    <div class="caption">
                                        <p><%#Eval("Title") %></p>
                                    </div>

                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>

                </div>

                <!--最新新闻-->


                <div class="news">

                    <h2>最新新闻</h2>

                    <h3><a href="#" target="_blank">
                        <asp:Literal Text="" ID="litFirstNewsTitle" runat="server" /></a></h3>

                    <p>
                        <asp:Literal Text="" ID="litFirstNewsContent" runat="server" />
                        ...
                    </p>

                    <ul class="news_list">


                        <li><a href="#news.html?hcs=1&clg=122&news=812" target="_blank">[培训动态]2014级泰安市美术馆研修生名单</a></li>


                        <li><a href="#news.html?hcs=11&clg=171&news=808" target="_blank">[讲座预告]万新华谈傅抱石的人生和艺术</a></li>


                        <li><a href="#news.html?hcs=1&clg=9&news=806" target="_blank">[新闻]“葩华秀茂”泰安市美术馆花鸟画作品展...</a></li>


                        <li><a href="#news.html?hcs=1&clg=9&news=802" target="_blank">[新闻]大型文献纪录片《齐白石》于7月...</a></li>


                        <li><a href="#news.html?hcs=1&clg=9&news=752" target="_blank">[交流]“白石造化—泰安市美术馆藏齐白石</a></li>


                    </ul>

                </div>



                <div class="clear"></div>

                <!--展览讯息-->

                <div class="exhibition">


                    <h2 class="h2"><a class="tit" href="/exhibit.html?hcs=11&clg=152" target="_blank">泰安市美术馆美术馆展讯</a></h2>

                    <div class="exhibition_tab"><span class="current">展览预告</span><span>正在展出</span><span>展览回顾</span></div>

                    <div class="exhibition_wen">

                        <div class="exhibition_a">

                            <dl style="border-bottom: 1px dashed #666; margin-bottom: 24px; height: 133px;">

                                <dt><a href="#exhibit.html?hcs=11&clg=162&exhibit=195" target="_blank">
                                    <img src="http://img12.artimg.net/bjhy/images/2014/beijingmeishuguang/zhanlan/blg150x150.jpg" width="107" height="106" /></a></dt>

                                <dd>

                                    <p><em>名称：</em><a href="#exhibit.html?hcs=11&clg=162&exhibit=195" target="_blank">踪迹大化——傅抱石艺术回顾展</a></p>

                                    <p><em>时间：</em>2014.8.15-9.17</p>

                                    <p><em>地点：</em>泰安市美术馆美术馆</p>

                                    <p><em>主办：</em>泰安市美术馆、南京博物院</p>

                                </dd>

                            </dl>

                            <ul class="news_list">


                                <li><a href="#exhibit.html?hcs=11&clg=162&exhibit=183" target="_blank">[展出]人生若寄——齐白石的手札情思展</a></li>


                                <li><a href="#exhibit.html?hcs=11&clg=163&exhibit=194" target="_blank">[回顾]南风北采——关山月北京写生专题展</a></li>


                                <li><a href="#exhibit.html?hcs=11&clg=163&exhibit=193" target="_blank">[回顾]香港当代水墨艺术展</a></li>


                                <li><a href="#exhibit.html?hcs=11&clg=163&exhibit=192" target="_blank">[回顾]翰墨凝采——夏风绘画艺术回顾展</a></li>


                            </ul>

                        </div>

                        <div class="exhibition_a">

                            <dl>

                                <dt><a href="http://bjaa2013.artron.net/exhibit.html?hcs=11&clg=162&exhibit=178" target="_blank">
                                    <img src="http://img12.artimg.net/bjhy/images/bjhyshouyetu/hongyaodanxianhaibaoslt.jpg
          "
                                        width="107" height="106" /></a></dt>

                                <dd>

                                    <p><em>名称：</em><a href="http://bjaa2013.artron.net/exhibit.html?hcs=11&clg=162&exhibit=178" target="_blank">洪耀弹线—2013北京展</a></p>

                                    <p><em>时间：</em>2013.11.22-11.29</p>

                                    <p><em>地点：</em>泰安市美术馆美术馆一二层</p>

                                    <p><em>主办：</em>泰安市美术馆美术馆</p>

                                </dd>

                            </dl>

                            <ul class="news_list">


                                <li><a href="" target="_blank"></a></li>


                                <li><a href="" target="_blank"></a></li>


                                <li><a href="" target="_blank"></a></li>


                                <li><a href="http://bjaa2013.artron.net/exhibit.html?hcs=11&clg=162&exhibit=180" target="_blank">三百石印富翁——齐白石的金石心迹</a></li>


                            </ul>

                        </div>

                        <div class="exhibition_a">

                            <dl>

                                <dt><a href="http://bjaa2013.artron.net/exhibit.html?hcs=11&clg=163&exhibit=30" target="_blank">
                                    <img src="http://img14.artimg.net/bjhy/images/bjhyshouyetu/66_12461_1382068215859slt.jpg
          "
                                        width="107" height="106" /></a></dt>

                                <dd>

                                    <p><em>名称：</em><a href="http://bjaa2013.artron.net/exhibit.html?hcs=11&clg=163&exhibit=30" target="_blank">松窗采薇—溥心畬绘画作品展</a></p>

                                    <p><em>时间：</em>2013.10.25-11.20</p>

                                    <p><em>地点：</em>泰安市美术馆美术馆一二层</p>

                                    <p><em>主办：</em>中国美术家协会等</p>

                                </dd>

                            </dl>

                            <ul class="news_list">


                                <li><a href="http://bjaa2013.artron.net/exhibit.html?hcs=11&clg=163&exhibit=34" target="_blank">和美净土—巴玛扎西水墨画展</a></li>


                                <li><a href="http://bjaa2013.artron.net/exhibit.html?hcs=11&clg=163&exhibit=35" target="_blank">寻找东莊—肖谷作品展</a></li>


                                <li><a href="http://bjaa2013.artron.net/exhibit.html?hcs=11&clg=163&exhibit=145" target="_blank">杨燕屏画展</a></li>


                                <li><a href="http://bjaa2013.artron.net/exhibit.html?hcs=11&clg=163&exhibit=146" target="_blank">清音赋流水 泼墨写云山—杨秀明音乐•绘画展</a></li>


                            </ul>

                        </div>

                    </div>

                </div>

                <!--画家资料-->

                <div class="painter">

                    <h2 class="h2"><a href="/artist.html?hcs=1&clg=5" target="_blank" class="tit">创作与研究</a>

                        <div class="arrow"><a href="javascript:;" class="up wu"></a><a href="javascript:;" class="down"></a></div>

                    </h2>

                    <div class="painter_a">

                        <ul class="painter_list">
                            <asp:Repeater runat="server" ID="rptPainter" OnItemDataBound="articleImage_ItemDataBound">
                                <ItemTemplate>

                                    <li><a href="Detail.aspx?aid=<%#Eval("ArticleId") %>">
                                        <asp:Image Width="86" Height="86" ID="imgPic" runat="server" />
                                        <span><%#Eval("Title") %></span><em class="alpha"></em></a></li>
                                </ItemTemplate>
                            </asp:Repeater>


                            <li><a href="#">
                                <img width="86" height="86" /><span>某画家</span><em class="alpha"></em></a></li>
                            <li><a href="#">
                                <img width="86" height="86" /><span>某画家</span><em class="alpha"></em></a></li>
                            <li><a href="#">
                                <img width="86" height="86" /><span>某画家</span><em class="alpha"></em></a></li>
                            <li><a href="#">
                                <img width="86" height="86" /><span>某画家</span><em class="alpha"></em></a></li>
                            <li><a href="#">
                                <img width="86" height="86" /><span>某画家</span><em class="alpha"></em></a></li>
                            <li><a href="#">
                                <img width="86" height="86" /><span>某画家</span><em class="alpha"></em></a></li>
                            <li><a href="#">
                                <img width="86" height="86" /><span>某画家</span><em class="alpha"></em></a></li>
                            <li><a href="#">
                                <img width="86" height="86" /><span>某画家</span><em class="alpha"></em></a></li>
                            <li><a href="#">
                                <img width="86" height="86" /><span>某画家</span><em class="alpha"></em></a></li>
                            <li><a href="#">
                                <img width="86" height="86" /><span>某画家</span><em class="alpha"></em></a></li>
                            <li><a href="#">
                                <img width="86" height="86" /><span>某画家</span><em class="alpha"></em></a></li>



                        </ul>

                    </div>

                </div>

                <!--公共教育-->


                <div class="public">

                    <h2 class="h2"><a href="/news.html?hcs=11&clg=155" target="_blank" class="tit">公共教育</a></h2>

                    <dl class="public_js">

                        <dt><a href="#news.html?hcs=11&clg=171&news=808" target="_blank">【讲座】万新华谈傅抱石人生和艺术</a></dt>

                        <dd>傅抱石是20世纪中国最为杰出的美术理论家与画家之一。早年，他钩沉古籍，考证文物，探索求证，析义解疑，以精深的中国美术史论研究驰誉学术界，成为现代中国美术史学当之无愧的先行者和实践家...
                        </dd>

                    </dl>

                    <ul class="news_list">


                        <li><a href="#news.html?hcs=11&clg=171&news=800" target="_blank">【讲座】吴洪亮馆长谈周思聪的荷花主题...</a></li>


                        <li><a href="#news.html?hcs=11&clg=171&news=783" target="_blank">【讲座】陈坚先生谈“中国水彩画的现状及未来”</a></li>


                        <li><a href="#news.html?hcs=11&clg=170&news=763" target="_blank">【活动】“童笔生花—母亲节水墨体验工作坊”小记</a></li>


                        <li><a href="#news.html?hcs=11&clg=170&news=759" target="_blank">【活动】对话策展团队活动小记</a></li>


                    </ul>

                </div>

                <div class="clear"></div>

                <!--学术研究-->


                <div class="scholarship">

                    <h2 class="h2"><a href="/news.html?hcs=1&clg=8" target="_blank" class="tit">学术成果</a></h2>

                    <div class="scholarship_list">


                        <a href="#news.html?hcs=1&clg=90" target="_blank">
                            <img src="http://img12.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/fengmian89(1).jpg" /></a>


                        <a href="#news.html?hcs=1&clg=90" target="_blank">
                            <img src="http://img11.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/qbs120.jpg" /></a>


                        <a href="#news.html?hcs=1&clg=90" target="_blank">
                            <img src="http://img10.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/f12345.jpg" /></a>


                    </div>

                    <div class="clear"></div>

                    <ul class="news_list">


                        <li><a href="#news.html?hcs=73&clg=179&news=294" target="_blank">“传统绘画研究中心”的研究成果</a></li>


                        <li><a href="#news.html?hcs=11&clg=204&news=185" target="_blank">崇其性 爱其形—李可染画牛</a></li>


                        <li><a href="#news.html?hcs=11&clg=204&news=183" target="_blank">蒋兆和作品中的传统与创新</a></li>


                        <li><a href="#news.html?hcs=125&clg=186&news=303" target="_blank">齐白石研究三题</a></li>


                    </ul>

                </div>

                <!--典藏信息  -->


                <div class="collection">

                    <h2 class="h2"><a href="ImageList.aspx?mid=10" target="_blank" class="tit">精品典藏</a></h2>

                    <div class="collection_js">

                        <a href="ImageList.aspx?mid=10" target="_blank" title="">

                            <img src="images/common/jpdc.jpg" />
                        </a>

                    </div>

                </div>

                <!--培训动态    -->


                <div class="train">

                    <h2 class="h2"><a href="/news.html?hcs=1&clg=7" target="_blank" class="tit">培训动态</a></h2>

                    <div class="train_js">

                        <a href="#news.html?hcs=1&clg=122" class="train_img" target="_blank">
                            <img src="http://img11.artimg.net/bjhy/images/bjhyshouyetu/wen.jpg" /></a>

                        <ul class="news_list">


                            <li><a href="#news.html?hcs=1&clg=122&news=812" target="_blank">2014级泰安市美术馆研修生名单</a></li>


                            <li><a href="#news.html?hcs=1&clg=122&news=754" target="_blank">2014年泰安市美术馆招生简章</a></li>


                            <li><a href="#news.html?hcs=1&clg=122&news=81" target="_blank">2013年泰安市美术馆招生简章</a></li>


                            <li><a href="#news.html?hcs=1&clg=122&news=80" target="_blank">2012全国画院专业人员高级研</a></li>


                            <li><a href="#news.html?hcs=1&clg=122&news=78" target="_blank">2012年泰安市美术馆招生简章</a></li>


                        </ul>

                    </div>

                    <!--联系我们-->


                    <dl class="contact">

                        <dt>联系我们</dt>

                        <dd>Tel: 010-65025171<br />
                            Mail:</dd>

                    </dl>

                </div>

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

                技术支持由XXX网提供
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
