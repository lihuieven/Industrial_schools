<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<div class="sidebar-scroll">
    <div class="sidebar-auto">
        <div id="task" class="task cw" onclick="////messagebox()">19</div>
        <h3 class="mypcip"><span class="f14 cw">网站控制台</span></h3>
        <ul class="menu">
            <li id="memuA" <%=request.getParameter("id").equals("1")?"class='current'":""%>><a class="menu_home" href="index.jsp?id=1">首页</a></li>
            <li id="memuAsite" <%=request.getParameter("id").equals("2")?"class='current'":""%>><a class="menu_web" href="/admin/ad?method=adAll&id=2&currentPaage=1">轮播管理</a></li>
            <li id="memuAftp" <%=request.getParameter("id").equals("3")?"class='current'":""%>><a class="menu_ftp" href="/admin/a?method=subscribeAll&id=3">预约管理</a></li>
            <li id="memuAdatabase" <%=request.getParameter("id").equals("4")?"class='current'":""%>><a class="menu_data" href="/admin/a?method=findNews&id=4">新闻管理</a></li>
            <li id="memuAcontrol" <%=request.getParameter("id").equals("5")?"class='current'":""%>><a class="menu_control" href="/admin/a?method=findLink&id=5">友情链接</a></li>
            <li id="memuAfirewall" <%=request.getParameter("id").equals("6")?"class='current'":""%>><a class="menu_firewall" href="firewall.jsp?id=6">校园风光</a></li>
<%--            <li id="memuAfiles" <%=request.getParameter("id").equals("7")?"class='current'":""%>><a class="menu_folder" href="files.jsp?id=7">文件</a></li>--%>
            <li id="memuAcrontab" <%=request.getParameter("id").equals("7")?"class='current'":""%>><a class="menu_day" href="/admin/a?method=findJob&id=7">就业信息</a></li>
            <li id="memuAsoft" <%=request.getParameter("id").equals("8")?"class='current'":""%>><a class="menu_soft" href="/admin/a?method=guestbookAll&id=8">留言管理</a></li>
            <li id="memuAconfig" <%=request.getParameter("id").equals("9")?"class='current'":""%>><a class="menu_set" href="config.jsp?id=9">系统设置</a></li>
            <li id="dologin" <%=request.getParameter("id").equals("10")?"class='current'":""%>><a class="menu_exit" href="/admin/a?method=exit&id=10">退出</a></li>
        </ul>
    </div>
</div>