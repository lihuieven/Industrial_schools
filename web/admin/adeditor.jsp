<%--
  Created by IntelliJ IDEA.
  User: lihuieven
  Date: 2019/7/18
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改轮播图</title>
</head>
<body>
<h3>轮播图管理——修改轮播</h3>
<form action="/admin/ad?method=adEditor" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${ad.id}">
    <input type="hidden" name="ad" value="${ad.img}">
    标题：<input type="text" name="title" value="${ad.title}"><br>
    链接：<input type="text" name="url" value="${ad.url}"><br>
    图片：<input type="file" name="img"><br>
    <img src="/uploads/ad/${ad.img}" width="200px">
    <input type="submit" value="提交"><br>
</form>
<a href="ad">查看管理广告轮播</a>
</body>
</html>