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
        <div class="main-content pb55">
            <div class="container-fluid">
                <div class="pos-box bgw mtb15">
                    <div class="position f14 c9 pull-left">
                        <a class="plr10 c4" href="index.jsp">首页</a>/<span class="plr10 c4">新闻管理</span>
                    </div>
                    <div class="search pull-right">
                        <form>
                            <input type="text" id="SearchValue" class="ser-text pull-left" placeholder="搜索文章"/>
                            <button type="button" class="ser-sub pull-left"></button>
                        </form>
                    </div>
                </div>
                <div class="softlist">
                    <div class="row soft-filter-box">
                        <div class="col-md-12">
                            <div class="menu-sub softtype">
                                <a href="/admin/a?method=findNews&id=4"><span class="on">文章管理</span></a>
                                <a href=""><span>文章类别管理</span></a>
                                <a href="/admin/newsadd.jsp?id=4"><span>发布新闻文章</span></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="safe bgw mtb15 pd15">
                    <div class="divtable mtb10">
                        <div class="tablescroll">
                            <table id="DataBody" class="table table-hover" width="100%" cellspacing="0" cellpadding="0"
                                   border="0" style="border: 0 none;">
                                <thead>
                                <tr>
                                    <th style="text-align: center">序号</th>
                                    <th style="text-align: center">导图</th>
                                    <th width="30%" style="text-align: center">标题</th>
                                    <th width="10%" style="text-align: center">类别</th>
                                    <th style="text-align: center">发表时间</th>
                                    <th style="text-align: center">浏览次数</th>
                                    <th width="200" style="text-align: center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pageBean.list}" var="list" varStatus="aa">
                                    <tr style="text-align: center">
                                        <td>${aa.count}</td>
                                        <td><img src="../uploads/news/${list.img}" style="width: 200px"></td>
                                        <td>${list.title}</td>
                                        <td>${list.nclass}</td>
                                        <td>${list.anow}</td>
                                        <td>${list.atime}</td>
                                        <td style="text-align:center"><a href="#" class="btlink">编辑 </a>
                                            | <a href="/admin/a?method=deleteNews&id=${list.id}"
                                                 class="btlink">删除</a></td>
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
                                        <a href="${pageContext.request.contextPath}/admin/a?method=findNews&currentPage=${pageBean.currentPage-1 }&id=4"
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
                                            <a href="${pageContext.request.contextPath}/admin/a?method=findNews&currentPage=${page }&id=4">${page}</a>
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
                                        <a href="${pageContext.request.contextPath}/admin/a?method=findNews&currentPage=${pageBean.currentPage+1}&id=4"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                            <p style="height: 31px;text-align: center">共${pageBean.totalCount}条数据</p>
                        </div>
                        <!-- 分页结束 -->
                        <div></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer bgw">网站后台系统 &copy;2005-2019 webrx (webrx.cn)&nbsp;(author:webrx modile:13014577033)</div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $("#setBox").click(function () {
        if ($(this).prop("checked")) {
            $("input[name=id]").prop("checked", true)
        } else {
            $("input[name=id]").prop("checked", false)
        }
    });
    setCookie('order', 'id desc');
</script>
<style type="text/css">
    .contextmenu {
        position: absolute;
        width: 120px;
        background: #FFFFFF;
        border-radius: 5px;
        overflow: hidden;
        z-index: 99999999;
    }

    .contextmenu li {
        border-left: 3px solid transparent;
        transition: ease 0.3s;
    }

    .contextmenu li:hover {
        background: #707070;
        border-left: 3px solid #333;
    }

    .contextmenu li a {
        display: block;
        padding: 5px 10px;
        color: #000000;
        text-decoration: none;
        transition: ease 0.3s;
        cursor: default;
    }

    .contextmenu li:hover a {
        color: #fff;
    }
</style>


<script src="static/js/database.js?date=6.8.7"></script>
<script type="text/javascript">
    bt.set_cookie('backup_path', "/www/backup");
    database.get_list();
</script>
<script src="static/js/upload.js?date=6.8.7"></script>
