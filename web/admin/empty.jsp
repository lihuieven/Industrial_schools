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
                        <a class="plr10 c4" href="index.jsp">首页</a>/<span class="plr10 c4">计划任务</span>
                    </div>
                </div>
                <div class="setbox bgw mtb15">
                    <div class="title c6 plr15">
                        <h3 class="f16">添加计划任务</h3>
                    </div>
                    <div class="setting-con ptb20">
                        <div class="clearfix plan">
                            <span class="typename c4 pull-left f14 text-right mr20">任务类型</span>
                            <div class="planname pull-left"><input type="text" name="name" class="bt-input-text"></div>
                            <span class="planSign"><i>*</i>任务类型包含以下部分：Shell脚本、备份网站、备份数据库、日志切割、释放内存、访问URL</span>
                        </div>
                        <div class="clearfix plan">
                            <span class="typename c4 pull-left f14 text-right mr20">任务名称</span>
                            <div class="planname pull-left"><input type="text" name="name" class="bt-input-text"></div>
                        </div>
                        <div class="clearfix plan">
                            <span class="typename c4 pull-left f14 text-right mr20">执行周期</span>

                            <div id="ptime" class="pull-left">
                                <div class="dropdown planweek pull-left mr20">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="excode" data-toggle="dropdown"><b val="1">周一</b> <span class="caret"></span></button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="excode">
                                        <li>
                                            <a role="menuitem" tabindex="-1" href="javascript:;" value="1">周一</a>
                                        </li>
                                        <li>
                                            <a role="menuitem" tabindex="-1" href="javascript:;" value="2">周二</a>
                                        </li>
                                        <li>
                                            <a role="menuitem" tabindex="-1" href="javascript:;" value="3">周三</a>
                                        </li>
                                        <li>
                                            <a role="menuitem" tabindex="-1" href="javascript:;" value="4">周四</a>
                                        </li>
                                        <li>
                                            <a role="menuitem" tabindex="-1" href="javascript:;" value="5">周五</a>
                                        </li>
                                        <li>
                                            <a role="menuitem" tabindex="-1" href="javascript:;" value="6">周六</a>
                                        </li>
                                        <li>
                                            <a role="menuitem" tabindex="-1" href="javascript:;" value="0">周日</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix plan">
                            <span class="typename controls c4 pull-left f14 text-right mr20">文章内容</span>
                            <div id="implement" style="line-height:34px"><textarea class="txtsjs bt-input-text" name="sBody"></textarea></div>
                        </div>
                        <div class="clearfix plan">
                            <div class="bt-submit plan-submit">提交内容</div>
                        </div>
                        <ul class="help-info-text c7 ptb15 mlr20">
                            <li>当添加完备份任务，应该手动运行一次，并检查备份包是否完整</li>
                            <li>磁盘容量不够、数据库密码错误、网络不稳定等原因，可能导致数据备份不完整</li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="footer bgw">网站后台系统 &copy;2005-2019 webrx (webrx.cn)&nbsp;(author:webrx modile:13014577033)</div>
</div>
<script src="static/js/jquery-1.10.2.min.js"></script>
<script src="static/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</body>
</html>