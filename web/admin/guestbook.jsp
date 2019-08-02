<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>内容管理系统 - 首页</title>
    <link href="/static/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/admin/site.css" rel="stylesheet">
</head>
<body>
<div class="bt-warp bge6">
    <div id="container" class="container-fluid">
        <jsp:include page="header.jsp"/>

        <div class="main-content">
            <div class="container-fluid" style="padding-bottom:54px">
                <div class="pos-box bgw mtb15">
                    <div class="position f14 c9 pull-left">
                        <a class="plr10 c4" href="index.jsp">首页</a>/<span class="plr10 c4">留言管理</span>
                    </div>
                </div>
                <div class="softbox bgw mtb15">
                    <div class="softlist">
                        <div class="divtable pd15 relative">
                            <div class="menu-sub softtype" style="text-align: left"><h3>留言管理</h3></div>
                            <table id="softList" class="table table-hover" width="100%" cellspacing="0" cellpadding="0"
                                   border="0">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>姓名</th>
                                    <th>电话</th>
                                    <th>IP</th>
                                    <th>留言时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${guestbookList}" var="list" varStatus="aa">
                                    <tr>
                                        <td>${aa.count}</td>
                                        <td>${list.name}</td>
                                        <td>${list.phone}</td>
                                        <td>${list.aip}</td>
                                        <td>${list.atime}</td>
                                        <td><c:if test="${list.isok=='y'}">已处理</c:if>
                                            <c:if test="${list.isok=='n'}"><a href="/admin/a?method=isokGuestbook&id=${list.id}" class="btlink">处理一下</a></c:if>
                                        </td>
                                        <td><a href="/admin/a?method=deleteId&id=${list.id}" class="btlink">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div id="softPage" class="dataTables_paginate paging_bootstrap page">
                                <div><span class="Pcurrent">1</span><a class="Pnum" onclick="soft.get_list(2)">2</a><a
                                        class="Pnum" onclick="soft.get_list(3)">3</a><a class="Pnum"
                                                                                        onclick="soft.get_list(4)">4</a><a
                                        class="Pnext" onclick="soft.get_list(2)">下一页</a><a class="Pend"
                                                                                           onclick="soft.get_list(4)">尾页</a><span
                                        class="Pnumber">1/4</span><span class="Pline">从1-15条</span><span class="Pcount">共54条数据</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer bgw">网站后台系统 &copy;2005-2019 webrx (webrx.cn)&nbsp;(author:webrx modile:13014577033)</div>
    </div>
</div>
</body>
</html>
