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
    <link href="/static/css/topic.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
</head>
<body>
<div class="bt-warp bge6">
    <div id="container" class="container-fluid">
        <jsp:include page="header.jsp"/>

        <div class="main-content pb55">
            <div class="container-fluid">
                <div class="pos-box bgw mtb15">
                    <div class="position f14 c9 pull-left">
                        <a class="plr10 c4" href="index.jsp">首页</a>/<span class="plr10 c4">轮播管理</span>
                    </div>
                    <div class="search pull-right">
                        <form target="hid" onsubmit='site.get_list(1,$("#SearchValue").val())'>
                            <input type="text" id="SearchValue" class="ser-text pull-left" placeholder="网站搜索"/>
                            <button type="button" class="ser-sub pull-left"
                                    onclick='site.get_list(1,$("#SearchValue").val())'></button>
                        </form>
                        <iframe name='hid' id="hid" style="display:none"></iframe>
                    </div>
                </div>

                <div class="conter-box bgw mtb15 pd15">
                    <%--<button onclick="site.add_site()" class="btn btn-success btn-sm btn-title" type="button"><a href="adadd.jsp">添加动态</a>
                    </button>--%>
                    <div class="container">
                        <div class="publish_box"><span class="publish open">发表动态</span><span
                                class="publish close4">取消发表</span></div>
                        <div class="create_topic">
                            <form method="post" action="${pageContext.request.contextPath}/Article/create"
                                  enctype="multipart/form-data">
                                <p class="add_article">标题：<input type="text" name="titles" class="title"
                                                                 placeholder="请输入标题"></p>
                                <div class="add_article article_content"><span>内容：</span><textarea rows="10"
                                                                                                   class="topic_content"
                                                                                                   placeholder="请输入内容..."
                                                                                                   name="fcontent"></textarea>
                                </div>
                                <div class="add_article add_img">添加图片：<input type="file" name="file" class="topic_img">
                                </div>
                                <div class="add_article sub_btn"><input type="submit" value="发表"><input type="button"
                                                                                                        value="取消"
                                                                                                        class="cancel">
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="divtable mtb10">
                        <div class="tablescroll">
                            <table id="webBody" class="table table-hover" style="min-width: 900px;border: 0 none;">
                                <thead>
                                <tr>
                                    <th width="150" style="cursor: pointer;">序号 <span data-id="name"
                                                                                      class="glyphicon glyphicon-triangle-top"
                                                                                      style="margin-left:5px;color:#bbb"></span>
                                    </th>
                                    <th width="98" style="cursor: pointer;">标题<span data-id="status"
                                                                                    class="glyphicon glyphicon-triangle-top"
                                                                                    style="margin-left:5px;color:#bbb"></span>
                                    </th>
                                    <th width="58">链接</th>
                                    <th width="26%">图片</th>
                                    <th width="86" style="cursor: pointer;text-align: center">是否开启<span data-id="edate"
                                                                                                        class="glyphicon glyphicon-triangle-top"
                                                                                                        style="margin-left:5px;color:#bbb"></span>
                                    </th>
                                    <th width="260" style="text-align:center;">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pageBean.list}" var="ad" varStatus="aa">
                                    <tr>
                                        <td>${aa.count}</td>
                                        <td>${ad.title}</td>
                                        <td>${ad.url}</td>
                                        <td><img src="/uploads/ad/${ad.img}" class="img-responsive" style="width:300px">
                                        </td>
                                        <td style="text-align: center">永久</td>
                                        <td style="text-align:center"><a href="/admin/ad?method=adEditorId&id=${ad.id}"
                                                                         class="btlink">编辑 </a>
                                            | <a href="/admin/ad?method=adDelete&id=${ad.id}&i=${ad.img}"
                                                 class="btlink">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!--分页 -->
                        <div style="width: 700px;margin:0 auto; border-top: 10px;">
                            <ul class="pagination">
                                <!-- 上一页 -->
                                <c:if test="${pageBean.currentPage==1 }">
                                    <li class="disabled">
                                        <a href="javascript:void(0);" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${pageBean.currentPage!=1 }">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/a?method=adAll&currentPage=${pageBean.currentPage-1 }&id=2"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <!-- 显示每一页 -->
                                <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
                                    <!-- 判断是否是当前页 -->
                                    <c:if test="${page==pageBean.currentPage }">
                                        <li class="active"><a href="javascript:void(0);">${page}</a></li>
                                    </c:if>
                                    <c:if test="${page!=pageBean.currentPage }">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/admin/a?method=adAll&currentPage=${page }&id=2">${page}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <!-- 下一页 -->
                                <c:if test="${pageBean.currentPage==pageBean.totalPage }">
                                    <li class="disabled">
                                        <a href="javascript:void(0);" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${pageBean.currentPage!=pageBean.totalPage }">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/a?method=adAll&currentPage=${pageBean.currentPage+1}&id=2"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <p>共${pageBean.totalCount}条数据</p>
                            </ul>
                        </div>
                        <!-- 分页结束 -->
                    </div>
                </div>
            </div>
        </div>
        <div class="footer bgw">网站后台系统 &copy;2005-2019 webrx (webrx.cn)&nbsp;(author:webrx modile:13014577033)</div>
    </div>
</div>
</body>
</html>

