<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="static/css/index.css">
<div class="header">
    <div class="header-content">
        <div class="logo">
            <img src="static/images/logo.png">
        </div>
        <div class="nav">
            <ul class="menu">
                <li <%=request.getParameter("id").equals("1")?"class='active'":""%> ><a href="/page?method=indexpage&id=1">首页</a></li>
                <li <%=request.getParameter("id").equals("2")?"class='active'":""%> ><a href="school.jsp?id=2">学校简介</a></li>
                <li <%=request.getParameter("id").equals("3")?"class='active'":""%>>
                    <a  href="###">专业介绍</a>
                    <ul class="submenu">
                        <li ><a href="online.jsp?id=3" target="_blank">电商运营</a></li>
                        <li ><a href="ui.jsp?id=3" target="_blank">UI设计</a></li>
                        <li ><a href="phone.jsp?id=3" target="_blank">移动软件</a></li>
                        <li ><a href="kefuzy.jsp?id=3" target="_blank">商务客服</a></li>
                        <li ><a href="media.jsp?id=3" target="_blank">新媒体营销</a></li>
                        <li ><a href="big_data.jsp?id=3" target="_blank">大数据</a></li>
                    </ul>
                </li>
                <li <%=request.getParameter("id").equals("4")?"class='active'":""%>><a href="/employment?method=job&id=4">就业资讯</a></li>
                <li <%=request.getParameter("id").equals("5")?"class='active'":""%>><a href="news.jsp?id=5">学校新闻</a></li>
                <li <%=request.getParameter("id").equals("6")?"class='active'":""%>><a href="contact-us.jsp?id=6">联系我们</a></li>
            </ul>
        </div>
    </div>
</div>

