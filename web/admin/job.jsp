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
                        <a class="plr10 c4" href="index.jsp">首页</a>/<span class="plr10 c4">就业明星</span>
                    </div>
                </div>

                <!--新模块开始-->
                <div class="softbox bgw mtb15">
                    <div class="softlist">
                        <div class="row soft-filter-box">
                            <div class="col-md-12">
                                <div class="menu-sub softtype">
                                    <a href=""><span class="on">就业明星</span></a>
                                    <a href=""><span>发布就业明星</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="divtable pd15 relative">
                        <div class="tablescroll">
                            <table id="DataBody" class="table table-hover" width="100%" cellspacing="0" cellpadding="0"
                                   border="0" style="border: 0 none;">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>姓名</th>
                                    <th>照片</th>
                                    <th>专业</th>
                                    <th>就业企业</th>
                                    <th>薪资</th>
                                    <th>信息</th>
                                    <th>基本操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pageBean.list}" var="list" varStatus="aa">
                                    <tr>
                                        <td>${aa.count}</td>
                                        <td>${list.name}</td>
                                        <td><img src="../uploads/job/${list.face}" style="width: 100px"></td>
                                        <td>${list.major}</td>
                                        <td>${list.company}</td>
                                        <td>${list.salary}</td>
                                        <td>${list.jobinfo}</td>
                                        <td><a href="#" class="btlink">编辑</a><span>|</span><a href="/admin/a?method=deleteJob&id=${list.id}" class="btlink">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!--分页 -->
                        <div style="width: 700px; margin: 0 auto; border-top: 10px;">
                            <ul class="pagination" style="text-align: center;">
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
                                        <a href="${pageContext.request.contextPath}/admin/a?method=findJob&currentPage=${pageBean.currentPage-1 }&id=7"
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
                                            <a href="${pageContext.request.contextPath}/admin/a?method=findJob&currentPage=${page }&id=7">${page}</a>
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
                                        <a href="${pageContext.request.contextPath}/admin/a?method=findJob&currentPage=${pageBean.currentPage+1}&id=7"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                            <p style="height: 31px;text-align: center">共${pageBean.totalCount}条数据</p>
                        </div>
                        <!-- 分页结束 -->
                    </div>
                </div>
                <!--新模块结束-->
            </div>
        </div>
    </div>

    <div class="footer bgw">网站后台系统 &copy;2005-2019 webrx (webrx.cn)&nbsp;(author:webrx modile:13014577033)</div>
</div>
</body>
</html>