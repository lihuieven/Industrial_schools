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
                        <a class="plr10 c4" href="index.jsp">首页</a>/<span class="plr10 c4">预约管理</span>
                    </div>
                    <div class="search pull-right">
                        <form target="hid" onsubmit='ftp.get_list(1,$("#SearchValue").prop("value"))'>
                            <input type="text" id="SearchValue" class="ser-text pull-left" placeholder="预约搜索"/>
                            <button type="button" class="ser-sub pull-left"
                                    onclick='ftp.get_list(1,$("#SearchValue").prop("value"))'></button>
                        </form>
                        <iframe name='hid' id="hid" style="display:none"></iframe>
                    </div>
                </div>
                <div class="divtable mtb10">
                    <div class="title c6 plr15">
                        <h3 class="f16">预约信息管理</h3>
                    </div>
                    <div class="tablescroll">
                        <table id="ftpData" class="table table-hover" style="min-width: 900px;border: 0 none;">
                            <thead>
                            <tr>
                                <th width="20%">姓名</th>
                                <th width="15%">毕业学校</th>
                                <th style="cursor: pointer;">手机号 <span data-id="status"
                                                                       class="glyphicon glyphicon-triangle-top"
                                                                       style="margin-left:5px;color:#bbb"></span></th>
                                <th>专业</th>
                                <th>预约时间</th>
                                <th>是否处理</th>
                                <th width="130" style="text-align:right;">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageBean.list}" var="list">
                                <tr>
                                    <td>${list.name}</td>
                                    <td><span class="password" data-pw="8MmAtJ87aZnWTnTk">${list.school}</span></td>
                                    <td><a href="javascript:;" title="FTP帐户"
                                           onclick="ftp.stop_user(349,'fufugay_com') ">${list.phone}</a></td>
                                    <td><p>${list.major}</p></td>
                                    <td>${list.stime}</td>
                                    <td><c:if test="${list.isshow=='y'}">已处理</c:if> <c:if test="${list.isshow=='n'}"><a href="/admin/a?method=subscribeUpdateId&id=${list.id}" class="btlink">处理一下</a></c:if> </td>
                                    <td style="text-align:right"><a href="/admin/a?method=subscribeId&id=${list.id}" class="btlink" title="删除">删除</a>
                                    </td>
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
                                    <a href="${pageContext.request.contextPath}/admin/a?method=subscribeAll&currentPage=${pageBean.currentPage-1 }&id=3"
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
                                        <a href="${pageContext.request.contextPath}/admin/a?method=subscribeAll&currentPage=${page }&id=3">${page}</a>
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
                                    <a href="${pageContext.request.contextPath}/admin/a?method=subscribeAll&currentPage=${pageBean.currentPage+1}&id=3"
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


<script type="text/javascript">

    var ftp = {
        get_list: function (page, search) {
            if (page == undefined) page = 1;
            bt.ftp.get_list(page, search, function (rdata) {
                $('.dataTables_paginate').html(rdata.page);
                var _tab = bt.render({
                    table: '#ftpData',
                    columns: [
                        {field: 'id', type: 'checkbox', width: 30},
                        {field: 'name', title: '用户名', width: '20%'},
                        {
                            field: 'password', width: '15%', title: '密码', templet: function (item) {
                                var _html = '<span class="password" data-pw="' + item.password + '">**********</span>';
                                _html += '<span onclick="bt.pub.show_hide_pass(this)" class="glyphicon glyphicon-eye-open cursor pw-ico" style="margin-left:10px"></span>';
                                _html += '<span class="ico-copy cursor btcopy" style="margin-left:10px" title="复制密码" data-pw="' + item.password + '" onclick="bt.pub.copy_pass(\'' + item.password + '\')"></span>';
                                return _html;
                            }
                        },
                        {
                            field: 'status', title: '状态', templet: function (item) {
                                var _status = '<a href="javascript:;" title="FTP帐户" ';
                                if (item.status == '1') {
                                    _status += ' onclick="ftp.stop_user(' + item.id + ',\'' + item.name + '\') " >';
                                    _status += '<span style="color:#5CB85C">已启用 </span><span style="color:#5CB85C" class="glyphicon glyphicon-play"></span>';
                                } else {
                                    _status += ' onclick="ftp.start_user(' + item.id + ',\'' + item.name + '\')"';
                                    _status += '<span style="color:red">已停用  </span><span style="color:red" class="glyphicon glyphicon-pause"></span>';
                                }
                                return _status;
                            }, sort: function () {
                                ftp.get_list();
                            }
                        },
                        {
                            field: 'path', title: '根目录', templet: function (item) {
                                var _path = bt.format_path(item.path);
                                return '<a class="btlink" title="打开目录" href="javascript:openPath(\'' + _path + '\');">' + _path + '</a>';
                            }
                        },
                        {
                            field: 'ps', title: '备注', templet: function (item) {
                                return "<span class='c9 input-edit' onclick=\"bt.pub.set_data_by_key('ftps','ps',this)\">" + item.ps + "</span>";
                            }
                        },
                        {
                            field: 'opt', width: 130, title: '操作', align: 'right', templet: function (item) {
                                var option = "<a href=\"javascript:;\" class=\"btlink\" onclick=\"ftp.set_password(" + item.id + ",'" + item.name + "','" + item.password + "')\" title=\"修改FTP密码\">改密</a> | ";
                                option += "<a href=\"javascript:;\" class=\"btlink\" onclick=\"ftp.del(" + item.id + ",'" + item.name + "')\" title=\"删除FTP\">删除</a>";
                                return option;
                            }
                        },
                    ],
                    data: rdata.data
                })
            })
        },
        batch_ftp: function (type, arr, result) {
            if (arr == undefined) {
                arr = [];
                result = {count: 0, error_list: []};
                $('input[type="checkbox"].check:checked').each(function () {
                    var _val = $(this).val();
                    if (!isNaN(_val)) arr.push($(this).parents('tr').data('item'));
                })
                bt.show_confirm(lan.ftp.del_all, "<a style='color:red;'>" + lan.get('del_all_ftp', [arr.length]) + "</a>", function () {
                    bt.closeAll();
                    ftp.batch_ftp(type, arr, result);
                });
                return;
            }
            var item = arr[0];
            switch (type) {
                case 'del':
                    if (arr.length < 1) {
                        ftp.get_list();
                        bt.msg({msg: lan.get('del_all_ftp_ok', [result.count]), icon: 1, time: 5000});
                        return;
                    }
                    bt.ftp.del(item.id, item.name, function (rdata) {
                        if (rdata.status) {
                            result.count += 1;
                        } else {
                            result.error_list.push({name: item.item, err_msg: rdata.msg});
                        }
                        arr.splice(0, 1)
                        ftp.batch_ftp(type, arr, result);
                    })
                    break;
            }
        },
        del: function (id, ftp_username) {
            bt.show_confirm(lan.public.del + "[" + ftp_username + "]", lan.get('confirm_del', [ftp_username]), function () {
                bt.ftp.del(id, ftp_username, function (rdata) {
                    if (rdata.status) ftp.get_list();
                    bt.msg(rdata);
                })
            })
        },
        add_user: function () {
            bt.ftp.add(function (rdata) {
                if (rdata.status) ftp.get_list();
            })
        },
        set_password: function (id, name, password) {
            var bs = bt.ftp.set_password(function (rdata) {
                if (rdata.status) ftp.get_list();
            })
            $('.id' + bs).val(id);
            $('.ftp_username' + bs).val(name);
            $('.new_password' + bs).val(password);
        },
        set_port: function () {
            var bs = bt.ftp.set_port(function (rdata) {
                if (rdata.status) ftp.get_list();
            })
            $('.port' + bs).val('551');
        },
        stop_user: function (id, username) {
            bt.confirm({
                msg: lan.ftp.stop_confirm.replace('{1}', username),
                title: lan.ftp.stop_title
            }, function (index) {
                bt.ftp.set_status(id, username, 0, function (rdata) {
                    if (rdata.status) ftp.get_list();
                })
            })
        },
        start_user: function (id, username) {
            bt.ftp.set_status(id, username, 1, function (rdata) {
                if (rdata.status) ftp.get_list();
            })
        }

    }
    bt.set_cookie('sites_path', "/www/wwwroot");

    ftp.get_list();

</script>