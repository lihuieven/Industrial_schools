<%--
  Created by IntelliJ IDEA.
  User: lihuieven
  Date: 2019/7/24
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div class="main-content" style="min-height: 300px;">
            <div class="container-fluid" style="padding-bottom:54px">
                <div class="pos-box bgw mtb15">
                    <div class="position f14 c9 pull-left">
                        <a class="plr10 c4" href="/admin/index">首页</a>/<span class="plr10 c4">新闻管理</span>
                    </div>
                    <div class="search pull-right">
                        <form>
                            <input type="text" id="SearchValue" class="ser-text pull-left" placeholder="搜索文章"/>
                            <button type="button" class="ser-sub pull-left"></button>
                        </form>
                    </div>
                </div>

                <div class="softbox bgw mtb15">
                    <div class="softlist">
                        <div class="row soft-filter-box">
                            <div class="col-md-12">
                                <div class="menu-sub softtype">
                                    <a href="/admin/a?method=findNews&id=4"><span>文章管理</span></a>
                                    <a href=""><span>文章类别管理</span></a>
                                    <a href="/admin/newsadd"><span class="on">发布新闻文章</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="divtable pd15 relative">
                        <form action="/admin/newsaddsave" method="post" enctype="multipart/form-data">
                            <table class="table table-striped table-bordered">
                                <tr>
                                    <td align="right">导图：</td>
                                    <td><input type="file" name="img"></td>
                                </tr>
                                <tr>
                                    <td width="80" align="right">标题：</td>
                                    <td><input type="text" name="title" class="bt-input-text" size="80"></td>
                                </tr>

                                <tr>
                                    <td align="right">类别：</td>
                                    <td>
                                        <select name="nclass" class="bt-input-text">
                                            <option value="学校动态">学校动态</option>
                                            <option value="行业新闻">行业新闻</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">正文：</td>
                                    <td>
                                        <script src="/editor/ueditor.config.js"></script>
                                        <script src="/editor/ueditor.all.min.js"></script>
                                        <script id="editor" name="content" type="text/plain"
                                                style="width:100%;height:500px;"></script>
                                        <script>
                                            var ue = UE.getEditor('editor');
                                        </script>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">发布时间：</td>
                                    <td><input type="text" name="anow" class="bt-input-text" size="30"
                                               value="2019-07-24 19:45:32"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="submit" value="提交文章" class="btn btn-primary">&nbsp;&nbsp;
                                        <input type="reset" value="重置" class="btn btn-info">
                                    </td>
                                </tr>
                            </table>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer bgw">网站后台系统 &copy;2005-2019 webrx (webrx.cn)&nbsp;(author:webrx modile:13014577033)</div>
</body>
</html>
