<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="Web.Default1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpDefaultContent" runat="server">
    <div class="hotpic" id="slides">
        <div class="slides_container">
            <div>
                <a href="#news.html?hcs=1&clg=9&news=806" target="_blank" title="“葩华秀茂”泰安市美术馆花鸟画作品展于8月2日在山东馆开幕">
                    <img src="http://img10.artimg.net/bjhy/images/2014/beijinghuayuan/2xinwenzixun/lunbt.jpg" width="460" height="330" />
                </a>
                <div class="caption">
                    <p>“葩华秀茂”泰安市美术馆花鸟画作品展于8月2日在山东馆开幕</p>
                </div>
            </div>
            <div>
                <a href="#exhibit.html?hcs=11&clg=162&exhibit=195" target="_blank" title="[当前展览]踪迹大化——傅抱石艺术回顾展">
                    <img src="http://img13.artimg.net/bjhy/images/2014/beijingmeishuguang/zhanlan/blgg600.jpg" width="460" height="330" />
                </a>
                <div class="caption">
                    <p>[当前展览]踪迹大化——傅抱石艺术回顾展</p>
                </div>
            </div>
            <div>
                <a href="#news.html?hcs=1&clg=90&news=810" target="_blank" title="踪迹大化——傅抱石的艺术世界">
                    <img src="http://img11.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/fbshclbt(1).jpg" width="460" height="330" />
                </a>
                <div class="caption">
                    <p>踪迹大化——傅抱石的艺术世界</p>
                </div>
            </div>
        </div>
    </div>
    <!--最新新闻-->
    <div class="news">
        <h2>最新新闻</h2>
        <h3><a href="#exhibit.html?hcs=11&clg=162&exhibit=195" target="_blank">“踪迹大化-傅抱石艺术回顾展”于8月15日开展</a></h3>
        <p>
            今年，是我国著名国画大师傅抱石先生诞辰110周年，为纪念这位在二十世纪中国美术发展史上做出卓越贡献的大家，泰安市美术馆联手南京博物院共同推出&ldquo;踪迹大化&mdash;&mdash;傅抱石艺术回顾展&rdquo;
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
    <!--展厅-->
    <!--  <div class="showroom"><img src="http://img10.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/xunzt123.jpg" /> <a href="http://bjaa.artron.net/" class="act" target="_blank"><img border="0" src="images/3d.jpg"/></a></div>-->
    <div class="showroom">
        <div class="flashbox">
            <div class="focusNew_out flashlist">
                <div style="display: block;" class="f_out">
                    <a href="http://bjaa.artron.net/">
                        <img width="242" height="330" alt="" src="http://img10.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/xunzt123.jpg" /></a>
                </div>
                <div class="f_out">
                    <a href="http://lys.artron.net/">
                        <img width="242" height="330" alt="" src="http://img14.artimg.net/bjhy/images/20131109/soum.jpg" /></a>
                </div>
            </div>
            <div class="f_tabs">
                <span class="hover"></span>
                <span></span>
            </div>
        </div>
        <script type="text/javascript">
            FeatureList(".flashbox", {
                "onclass": "hover",
                "offclass": "",
                "pause_on_act": "click",
                "interval": 5000,
                "speed": 5
            });
        </script>
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
                <li><a href="#artist.html?hcs=1&clg=81&artist=71" target="_blank">
                    <img src="http://img14.artimg.net/bjhy/images/xianrenhuajia/wmm.jpg" width="86" height="86" /><span>王明明</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=72" target="_blank">
                    <img src="http://img14.artimg.net/bjhy/images/xianrenhuajia/yw.jpg" width="86" height="86" /><span>袁武</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=100" target="_blank">
                    <img src="http://img13.artimg.net/bjhy/images/xianrenhuajia/lb(2).jpg" width="86" height="86" /><span>雷波</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=93" target="_blank">
                    <img src="http://img12.artimg.net/bjhy/images/xianrenhuajia/wyd.jpg" width="86" height="86" /><span>王沂东</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=98" target="_blank">
                    <img src="http://img10.artimg.net/bjhy/images/xianrenhuajia/lp(1).jpg" width="86" height="86" /><span>卢平</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=96" target="_blank">
                    <img src="http://img14.artimg.net/bjhy/images/bjhyshouyetu/6zxysy.jpg" width="86" height="86" /><span>张晓勇</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=92" target="_blank">
                    <img src="http://img10.artimg.net/bjhy/images/xianrenhuajia/wjw(1).jpg" width="86" height="86" /><span>汪建伟</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=82" target="_blank">
                    <img src="http://img14.artimg.net/bjhy/images/xianrenhuajia/byp(1).jpg" width="86" height="86" /><span>白羽平</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=94" target="_blank">
                    <img src="http://img13.artimg.net/bjhy/images/xianrenhuajia/xyz(1).jpg" width="86" height="86" /><span>谢永增</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=89" target="_blank">
                    <img src="http://img11.artimg.net/bjhy/images/xianrenhuajia/nhy(1).jpg" width="86" height="86" /><span>南海岩</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=95" target="_blank">
                    <img src="http://img14.artimg.net/bjhy/images/xianrenhuajia/ydw(1).jpg" width="86" height="86" /><span>姚大伍</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=83" target="_blank">
                    <img src="http://img14.artimg.net/bjhy/images/xianrenhuajia/cys(1).jpg" width="86" height="86" /><span>蔡玉水</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=85" target="_blank">
                    <img src="http://img11.artimg.net/bjhy/images/xianrenhuajia/ml(1).jpg" width="86" height="86" /><span>马琳</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=88" target="_blank">
                    <img src="http://img11.artimg.net/bjhy/images/xianrenhuajia/mxs(1).jpg" width="86" height="86" /><span>莫晓松</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=84" target="_blank">
                    <img src="http://img12.artimg.net/bjhy/images/xianrenhuajia/gbj(1).jpg" width="86" height="86" /><span>郭宝君</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=75" target="_blank">
                    <img src="http://img11.artimg.net/bjhy/images/xianrenhuajia/lm(1).jpg" width="86" height="86" /><span>罗敏</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=86" target="_blank">
                    <img src="http://img10.artimg.net/bjhy/images/xianrenhuajia/mhj(1).jpg" width="86" height="86" /><span>买鸿钧</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=81" target="_blank">
                    <img src="http://img10.artimg.net/bjhy/images/xianrenhuajia/ljf(1).jpg" width="86" height="86" /><span>李江峰</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=79" target="_blank">
                    <img src="http://img13.artimg.net/bjhy/images/xianrenhuajia/fzh(1).jpg" width="86" height="86" /><span>方政和</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=78" target="_blank">
                    <img src="http://img12.artimg.net/bjhy/images/xianrenhuajia/lfl(1).jpg" width="86" height="86" /><span>李凤龙</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=80" target="_blank">
                    <img src="http://img10.artimg.net/bjhy/images/xianrenhuajia/zz(1).jpg" width="86" height="86" /><span>庄重</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=74" target="_blank">
                    <img src="http://img13.artimg.net/bjhy/images/xianrenhuajia/lx.jpg" width="86" height="86" /><span>刘旭</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=90" target="_blank">
                    <img src="http://img12.artimg.net/bjhy/images/xianrenhuajia/pw(1).jpg" width="86" height="86" /><span>彭薇</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=77" target="_blank">
                    <img src="http://img13.artimg.net/bjhy/images/xianrenhuajia/lxs(1).jpg" width="86" height="86" /><span>李雪松</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=91" target="_blank">
                    <img src="http://img10.artimg.net/bjhy/images/xianrenhuajia/wgj(1).jpg" width="86" height="86" /><span>王冠军</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=81&artist=76" target="_blank">
                    <img src="http://img10.artimg.net/bjhy/images/xianrenhuajia/szs(1).jpg" width="86" height="86" /><span>孙震生</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=208&artist=335" target="_blank">
                    <img src="http://img11.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/wangzhichun.jpg" width="86" height="86" /><span>王志纯</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=208&artist=332" target="_blank">
                    <img src="http://img10.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/wuhuaiyi.jpg" width="86" height="86" /><span>武怀义</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=208&artist=330" target="_blank">
                    <img src="http://img13.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/yaozhenxi123.jpg" width="86" height="86" /><span>姚震西</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=208&artist=334" target="_blank">
                    <img src="http://img14.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/lexianghai.jpg" width="86" height="86" /><span>乐祥海</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=208&artist=357" target="_blank">
                    <img src="http://img10.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/whl.jpg" width="86" height="86" /><span>吴洪亮</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=208&artist=328" target="_blank">
                    <img src="http://img14.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/lvxiao.jpg" width="86" height="86" /><span>吕晓</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=208&artist=333" target="_blank">
                    <img src="http://img11.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/qiuchunxia.jpg" width="86" height="86" /><span>仇春霞</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=208&artist=329" target="_blank">
                    <img src="http://img11.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/mamingchen.jpg" width="86" height="86" /><span>马明宸</span><em class="alpha"></em></a></li>
                <li><a href="#artist.html?hcs=1&clg=208&artist=331" target="_blank">
                    <img src="http://img14.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/zhaojiuzhe(1).jpg" width="86" height="86" /><span>赵琰哲</span><em class="alpha"></em></a></li>
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
        <h2 class="h2"><a href="/catalog.html?hcs=1&clg=6" target="_blank" class="tit">精品典藏</a></h2>
        <div class="collection_js">
            <a href="#artist.html?hcs=1&clg=6" target="_blank" title="">
                <img src="http://img13.artimg.net/bjhy/images/2014/beijinghuayuan/1shouye/4.jpg" />
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
</asp:Content>
