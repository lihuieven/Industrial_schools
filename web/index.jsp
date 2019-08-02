<%--
  Created by IntelliJ IDEA.
  User: lihuieven
  Date: 2019/7/16
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>河南省工业学校_郑州公办中专_河南郑州中专学校</title>
    <meta name="keywords" content="河南省工业学校,郑州公办中专,电子商务学校,电子商务专业,UI设计,淘宝美工,网络营销专业,新媒体营销与策划,大数据,移动端软件开发,河南中专学校">
    <meta name="description" content="郑州公办中专学校有哪些？首选河南省工业学校，河南省工业学校以教授学生先进技能为己任，实操为主充分保障学生实践能力，致力于打造一个全方位,多元化的新教育模式！">
    <link rel="icon" href="static/images/favicon.ico">
    <link rel="stylesheet" href="static/css/index.css">
    <link rel="stylesheet" href="static/js/swiper.min.css">
    <link href="static/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/jquery-3.4.1.min.js"></script>
    <script src="static/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script src="static/js/marqueue.js"></script>
    <script src="static/js/common.js"></script>
    <script src="static/js/swiper.min.js"></script>
    <script src="https://cdn.bootcss.com/vue/2.6.10/vue.min.js"></script>
    <!--<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">-->
    <!-- 百度统计-->
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?ee7ac43f2733e14f1a36b495e46ac403";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
    <!-- 百度统计-->
</head>
<body>
<!--header-->
<jsp:include page="header.jsp"/>
<!--设置轮播图，轮播效果使用swiper插件实现，轮播图设置的背景图-->
<jsp:include page="/html/ad.html"/>
<!--六个专业-->
<div class="main">

    <!--专业介绍 star-->
    <div class="zyjs">
        <!--题目-->
        <div class="school">
            <div class="title">
                <span></span>
                <h1>专业介绍</h1>
                <span></span>
            </div>
        </div>
        <!--专业介绍列表-->
        <ul class="zyjs_list">
            <li>
                <a href="online.jsp" target="_blank">
                    <img src="static/images/zyjs02.jpg" alt="">
                    <p>电商管理与运营专业</p>
                    <img class="jiahao" src="static/images/zyjs.png" alt="">
                </a>
            </li>
            <li>
                <a href="ui.jsp" target="_blank">
                    <img src="static/images/zyjs06.jpg" alt="">
                    <p>UI设计与美工</p>
                    <img class="jiahao" src="static/images/zyjs.png" alt="">
                </a>
            </li>
            <li>
                <a href="phone.jsp" target="_blank">
                    <img src="static/images/zyjs03.jpg" alt="">
                    <p>移动端软件开发</p>
                    <img class="jiahao" src="static/images/zyjs.png" alt="">
                </a>
            </li>
            <li>
                <a href="kefuzy.jsp" target="_blank">
                    <img src="static/images/zyjs04.jpg" alt="">
                    <p>商务客服</p>
                    <img class="jiahao" src="static/images/zyjs.png" alt="">
                </a>
            </li>
            <li>
                <a href="media.jsp" target="_blank">
                    <img src="static/images/zyjs05.jpg" alt="">
                    <p>新媒体营销与策划</p>
                    <img class="jiahao" src="static/images/zyjs.png" alt="">
                </a>
            </li>
            <li>
                <a href="big_data.jsp" target="_blank">
                    <img src="static/images/zyjs07.jpg" alt="">
                    <p>大数据</p>
                    <img class="jiahao" src="static/images/zyjs.png" alt="">
                </a>
            </li>
        </ul>
    </div>
    <!--专业介绍 end-->

    <!--学校简介 star-->
    <div class="xxjj">
        <!--蒙层效果-->
        <div class="xxjj_text mokuai">
            <img src="static/images/schooljj.jpg" alt="">
            <div class="text_righta">
                <h2>学校简介</h2>
                <p>committed to personnel</p>
                <br/>
                <p>
                    河南工业学校位于郑州市文化路78号，始建于1949年，省教育厅直属国家级重点普通中等专业学校，河南省职业教育品牌示范院校，河南省中等职业学校管理强校、数控专业“双师型”教师培训基地、省级文明单位、省级就业先进单位。
                </p>
            </div>
            <a href="school.jsp">了解更多</a>
        </div>
    </div>
    <!--学习简介 end-->

    <!--校园风光 star-->
    <div class="school">
        <div class="title">
            <span></span>
            <h1>校园风光</h1>
            <span></span>
        </div>
        <!--校园风光导航开始-->
        <div class="school_nav">
            <p class="p1">校园环境</p>
            <span>|</span>
            <p id="shenghuo">学生生活</p>
            <span>|</span>
            <p>就业明星</p>
        </div>
        <div class="school_img">
            <img src="static/images/hj1.jpg" alt="" title="河南工业学校大门">
            <img class="img_002" src="static/images/hj2.jpg" alt="" title="学校操场">
            <img src="static/images/hj3.jpg" alt="" title="京东实训室">
            <img class="img_004" src="static/images/hj4.jpg" alt="" title="教学楼">
            <img src="static/images/hj5.jpg" alt="" title="教室">

        </div>
        <!--第二个页面 开始-->
        <div class="school_img" style="display: none;">
            <img src="static/images/shenghuo1.jpg" alt="" title="课间操留念">
            <img class="img_002" src="static/images/shenghuo2.jpg" alt="" title="疯狂的军训">
            <img src="static/images/shenghuo3.jpg" alt="" title="操场的健儿">
            <img class="img_004" src="static/images/shenghuo4.jpg" alt="" title="运动场上的健儿">
            <img src="static/images/shenghuo5.jpg" alt="" title="席地而坐，无话不说">
        </div>
        <!--第二个页面 结束-->
        <!--第三个页面 开始-->
        <div class="school_img" style="display: none;">
            <img src="static/images/mx1.jpg" alt="" title="第一张图片" width="595" height="595">
            <img class="img_002" src="static/images/mx4.jpg" alt="" title="第二张图片" width="292" height="292">
            <img src="static/images/mx3.jpg" alt="" title="第三张图片" width="292" height="292">
            <img class="img_004" src="static/images/mx2.jpg" alt="" title="第四张图片" width="292" height="292">
            <img src="static/images/mx5.jpg" alt="" title="第五张图片" width="292" height="292">
        </div>
        <!--第三个页面 结束-->
    </div>
    <!--校园风光  end-->

    <!--您关心的问题开始-->
    <div class="about">
        <div class="title title_style">
            <span></span>
            <h1>您最关心的问题</h1>
            <span></span>
        </div>
        <div class="wenti clearfix">
            <!--1-->
            <div class="erzi">
                <img src="static/images/about_01.png" class="img-responsive center-block">
                <div class="sunzi">
                    <h2>自己</h2>
                    <h4>能学会吗</h4>
                    <a href="https://tb.53kf.com/code/client/10170464/2" target="_blank">点击咨询</a>
                </div>
            </div>
            <!--2-->
            <div class="erzi">
                <img src="static/images/about_02.png" class="img-responsive center-block">
                <div class="sunzi">
                    <h2>毕业</h2>
                    <h4>是什么学历？</h4>
                    <a href="https://tb.53kf.com/code/client/10170464/2" target="_blank">点击咨询</a>
                </div>
            </div>
            <!--3-->
            <div class="erzi">
                <img src="static/images/about_03.png" class="img-responsive center-block">
                <div class="sunzi">
                    <h2>学费</h2>
                    <h4>是多少？</h4>
                    <a href="https://tb.53kf.com/code/client/10170464/2" target="_blank">点击咨询</a>
                </div>
            </div>
            <!--4-->
            <div class="erzi">
                <img src="static/images/about_04.png" class="img-responsive center-block">
                <div class="sunzi">
                    <h2>毕业</h2>
                    <h4>做什么工作？</h4>
                    <a href="https://tb.53kf.com/code/client/10170464/2" target="_blank">点击咨询</a>
                </div>
            </div>
            <div class="erzi">
                <img src="static/images/about_05.png" class="img-responsive center-block">
                <div class="sunzi">
                    <h2>毕业</h2>
                    <h4>能拿多少薪水？</h4>
                    <a href="https://tb.53kf.com/code/client/10170464/2" target="_blank">点击咨询</a>
                </div>
            </div>
            <div class="erzi">
                <img src="static/images/about_06.png" class="img-responsive center-block">
                <div class="sunzi">
                    <h2>毕业</h2>
                    <h4>有保障吗？</h4>
                    <a href="https://tb.53kf.com/code/client/10170464/2" target="_blank">点击咨询</a>
                </div>
            </div>
        </div>
    </div>
    <!--您关心的问题结束-->

    <!--七大保障开始-->
    <div class="seven">
        <div class="title">
            <span></span>
            <h1>七大保障</h1>
            <span></span>
        </div>
        <div class="seven-back">
            <!--管理保障-->
            <div class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img src="static/images/管理员.png">
                </div>
                <div class="weui-media-box__bd">
                    <h3 style="color: #2e97c3;">管理保障</h3>
                    <p>双班主任管理，把控教学质量、把握学生思想动态、培养职业素养、指导面试技巧</p>
                </div>
            </div>
            <!--双学历保障-->
            <div class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img src="static/images/学历-实色.png" alt="">
                </div>
                <div class="weui-media-box__bd">
                    <h3 style="color: #E8415B;">双学历保障</h3>
                    <p>双学历教育，毕业文凭中专+大专</p>
                </div>
            </div>
            <!--无理由退款-->
            <div class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img src="static/images/退费保障.png" alt=""></div>
                <div class="weui-media-box__bd">
                    <h3 style="color: #28B2B3">无理由退费</h3>
                    <p>学生在学习期间，感觉有任何不满，入校一个月内可无理由退费。</p>
                </div>
            </div>
            <!--就业协议-->
            <div class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img src="static/images/协议详情.png" alt=""></div>
                <div class="weui-media-box__bd">
                    <h3 style="color: #D9A83D">签订就业协议</h3>
                    <p>入学签订就业协议，律师事务所见证，毕业学校负责推荐学校。</p>
                </div>
            </div>
            <!--失业跟踪-->
            <div class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img src="static/images/跟踪.png" alt=""></div>
                <div class="weui-media-box__bd">
                    <h3 style="color: #477ABE;">失业跟踪</h3>
                    <p>就业后，3年内失业再就业跟踪保障。</p>
                </div>
            </div>
            <!--定岗-->
            <div class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img src="static/images/课堂培训.png" alt=""></div>
                <div class="weui-media-box__bd">
                    <h3 style="color:#E8415B ">定向定岗定薪培养</h3>
                    <p>定工作方向、定工作岗位、定薪资保障。</p>
                </div>
            </div>
            <!--公司化运作-->
            <div class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img src="static/images/公司团队.png" alt=""></div>
                <div class="weui-media-box__bd">
                    <h3 style="color: #28B2B3">公司化运作</h3>
                    <p>类似于公司化管理，让学生毕业可以更快的适应公司环境。</p>
                </div>
            </div>
            <!--中心的内容-->
            <div>
                <p>七重保障</p>
                <p>让学生安心</p>
                <p>让家长放心</p>
            </div>
        </div>

    </div>
    <!--七大保障结束-->

    <!--预约动态开始 -->
    <jsp:include page="/html/subscribes.html"/>
    <!--/* 预约动态结束 -->
    <!--预约成功查询模块已完成，预约报名模块待完善-->

    <!--高薪待遇开始-->
    <div class="salary">
        <div class="salary_title">
            <h1>加入高薪行列 &nbsp;&nbsp;&nbsp;下一个主角就是你</h1>
            <div class="line"></div>
            <div class="salary_th col-xs-12 text-center">
                <span class="col-xs-2">姓名</span>
                <span class="col-xs-2">专业</span>
                <span class="col-xs-3">公司名称</span>
                <span class="col-xs-2">就业薪资</span>
                <span class="col-xs-3">福利待遇</span>
            </div>
            <img src="static/images/money.png" alt="">
        </div>
        <div id="marquee4">
            <ul class="col-xs-12">
                <c:forEach items="${jobList}" var="s">
                    <li class="col-xs-12 text-center">
                        <span class="col-xs-2">${s.name}</span>
                        <span class="col-xs-2">${s.major}</span>
                        <span class="col-xs-3">${s.company}</span>
                        <span class="col-xs-2">${s.salary}</span>
                        <span class="col-xs-3">${s.jobinfo}</span>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!--高薪待遇结束-->
    <!-- 高薪待遇模块已完成 -->

    <!--新闻动态开始-->
    <div class="school">
        <div class="title">
            <span></span>
            <h1>新闻动态</h1>
            <span></span>
        </div>
    </div>
    <div class="news1">
        <div class="news_left">
            <div class="news_nav">
                <span></span>
                <p>学校动态</p>
            </div>
            <ul>
                <c:forEach items="${schoolNewsList}" var="schoolNews">
                    <li>
                        <a href="#">
                            <p>${schoolNews.title}</p>
                            <span><fmt:formatDate value="${schoolNews.anow}" pattern="yyyy-MM-dd"/></span>
                        </a>
                    </li>
                </c:forEach>
            </ul>
            <a href="news.jsp">查看更多</a>
        </div>
        <!--右边的新闻-->
        <div class="news_left">
            <div class="news_nav">
                <span></span>
                <p>行业资讯</p>
            </div>
            <ul>
                <c:forEach items="${industryNewsList}" var="industryNews">
                    <li>
                        <a href="#">
                            <p>${industryNews.title}</p>
                            <span><fmt:formatDate value="${industryNews.anow}" pattern="yyyy-MM-dd"/></span>
                        </a>
                    </li>
                </c:forEach>
            </ul>
            <a href="news.jsp">查看更多</a>
        </div>
    </div>
    <!--新闻动态结束-->
    <!-- 新闻模块已完成 -->

    <!-- 底部 开始-->
    <jsp:include page="/html/config.html"/>
    <!-- 底部 结束-->
</div>
</body>
<!-- 53kf-->
<script>(function () {
    var _53code = document.createElement("script");
    _53code.src = "https://tb.53kf.com/code/code/10170464/2";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(_53code, s);
})();</script>


</html>
