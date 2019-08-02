<%--
  Created by IntelliJ IDEA.
  User: lihuieven
  Date: 2019/7/18
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>轮播图管理</title>
    <link rel="stylesheet" href="/static/bootstrap-3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h3>轮播管理 - 显示</h3>
    <table class="table table-bordered table-hover table-condensed table-striped">
        <tr>
            <th>序号</th>
            <th>标题</th>
            <th>图片</th>
            <th>链接</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${adList}" var="ad" varStatus="aa">
            <tr>
                <td>${aa.count}</td>
                <td>${ad.title}</td>
                <td><img src="/uploads/ad/${ad.img}" class="img-responsive" style="width:200px"></td>
                <td>${ad.url}</td>
                <td>
                    <a href="/admin/ad?method=adDelete&id=${ad.id}&i=${ad.img}" class="btn btn-xs btn-danger">删除</a>
                    <a href="/admin/ad?method=adEditorId&id=${ad.id}" class="btn btn-xs btn-primary">编辑</a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="5">用来分页数据</td>
        </tr>
        <tr>
            <td colspan="5">
                <a href="/admin/adadd.jsp" class="btn btn-info btn-xs">添加轮播广告</a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
