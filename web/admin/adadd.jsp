<%--
  Created by IntelliJ IDEA.
  User: lihuieven
  Date: 2019/7/18
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加轮播图</title>
</head>
<body>
    <h3>轮播图管理——添加轮播</h3>
    <form action="/admin/ad?method=adAdd" method="post" enctype="multipart/form-data">
        标题：<input type="text" name="title"><br>
        链接：<input type="text" name="url"><br>
        图片：<input type="file" name="img"><br>
        <input type="submit" value="提交"><br>
    </form>
</body>
</html>
