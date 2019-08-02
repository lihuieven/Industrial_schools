<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="container-fluid" style="padding-bottom: 50px;">
                <!--头部-->
                <div class="pos-box bgw mtb15">
                    <div class="position f14 c9 pull-left">
                        <a class="plr10 c4" href="index.jsp?id=1">首页</a>/<span class="plr10 c4">友情链接</span>
                    </div>
                </div>
                <!--头部结束-->
                <div class="control">
                    <div class="col-xs-12 col-sm-12 col-md-12 pull-left pd0 view0">
                        <div class="mb15">
                            <div class="bgw pb15">
                                <div class="title c6 plr15 mb15">
                                    <h3 class="c-tit f16">友情链接管理</h3>
                                </div>
                                <div class="info-title-tips" style="margin: 20px 30px 0px;">
                                    <p><span class="glyphicon glyphicon-alert"
                                             style="color: #f39c12; margin-right: 10px;"></span>为了提高项目性能，友情连接使用了缓存机制，如果改变了请在后台首页右上角清除缓存!
                                    </p>
                                </div>

                                <div class="setting-con pd15">
                                    <form id="set-Config" method="post" action="/admin/a?method=inserLink">
                                        <p class="mtb15"><span class="set-tit text-right" title="标题">标题</span><input
                                                name="title" class="inputtxt bt-input-text" type="text"><span
                                                class="set-info c7">友情链接文本标题</span></p>
                                        <p class="mtb15"><span class="set-tit text-right" title="链接地址">链接地址</span><input
                                                name="url" style="width:360px" class="inputtxt bt-input-text"
                                                type="text" value="#"><span class="set-info c7">友情链接的URL地址</span></p>
                                        <input type="submit" class="bt-submit set-submit" style="border:none;"
                                               value="添加新链接">
                                    </form>
                                </div>

                                <div class="plr15">
                                    <div class="tablescroll">
                                        <table id="DataBody" class="table table-hover" width="100%" cellspacing="0"
                                               cellpadding="0" border="0" style="border: 0 none;margin-bottom: 0px;">
                                            <thead>
                                            <tr>
                                                <th>标题</th>
                                                <th>链接地址</th>
                                                <th>基本操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${linkList}" var="list">
                                                <tr>
                                                    <td>${list.title}</td>
                                                    <td>${list.url}</td>
                                                    <td><a href="/admin/a?method=deleteLinkId&id=${list.id}" class="btlink">删除</a></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
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

