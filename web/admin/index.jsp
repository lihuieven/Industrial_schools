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

        <!-- 主要内容 -->
        <div class="main-content">
            <div class="index-pos-box bgw">
                <div class="position f12 c6 pull-left" style="background:none;padding-left:15px">
                    <span class="bind-user c4"><a href="javascript:void(0)" class="btlink">宝塔账户</a><a class="btn btn-success btn-xs" href="#" target="_blank" style="margin-left:5px">注册</a></span>
                    <span class="bind-weixin c4"><a href="javascript:void(0)" class="btlink">微信</a></span>
                    <span class="ico-system">系统:</span><span id="info" style="margin-left:10px;"> 获取中: </span>&#12288;&#12288;已不间断运行:  <span id="running"> 获取中</span>
                </div>
                <span class="pull-right f12 c6" style="line-height:52px; margin-right:15px">
            免费版 <span id="btversion" onclick="index.open_log()" style="margin-right:10px">6.8.7</span>
            <span id="toUpdate"><a class="btlink" href="javascript:index.check_update();">更新</a></span>
            <span style="margin:0 10px"><a class="btlink" href="javascript:index.re_panel();">修复</a></span>
            <span><a class="btlink" href="javascript:index.re_server();">安全退出</a></span>
        </span>
            </div>
            <div class="container-fluid" style="padding-bottom: 66px;">
                <div class="danger-tips">
                    <div class="important-title" id="messageError" style="display: none; margin-top:15px"></div>
                </div>
                <div class="conter-box server bgw mtb15">
                    <div class="title c6 f16 plr15">
                        <h3 class="c6 f16 pull-left">状态</h3>
                    </div>
                    <div class="server-circle">
                        <ul class="row" id="systemInfoList">
                            <li class="col-xs-6 col-sm-3 col-md-3 col-lg-2 mtb20 circle-box text-center loadbox">
                                <h3 class="c9 f15">负载状态<a href="https://www.bt.cn/bbs/thread-11402-1-1.html" target="_blank" class="bt-ico-ask" style="cursor: pointer;">?</a></h3>
                                <div class="cicle">
                                    <div class="bar bar-left">
                                        <div class="bar-left-an bar-an"></div>
                                    </div>
                                    <div class="bar bar-right">
                                        <div class="bar-right-an bar-an"></div>
                                    </div>
                                    <div class="occupy"><span>0</span>%</div>
                                </div>
                                <h4 class="c9 f15">获取中: </h4>
                            </li>
                            <li class="col-xs-6 col-sm-3 col-md-3 col-lg-2 mtb20 circle-box text-center cpubox">
                                <h3 class="c9 f15">CPU使用率</h3>
                                <div class="cicle">
                                    <div class="bar bar-left">
                                        <div class="bar-left-an bar-an"></div>
                                    </div>
                                    <div class="bar bar-right">
                                        <div class="bar-right-an bar-an"></div>
                                    </div>
                                    <div class="occupy"><span>0</span>%</div>
                                </div>
                                <h4 class="c9 f15">获取中: </h4>
                            </li>
                            <li class="col-xs-6 col-sm-3 col-md-3 col-lg-2 mtb20 circle-box text-center membox">
                                <h3 class="c9 f15">内存使用率</h3>
                                <div class="cicle mem-release">
                                    <div class="bar bar-left">
                                        <div class="bar-left-an bar-an"></div>
                                    </div>
                                    <div class="bar bar-right">
                                        <div class="bar-right-an bar-an"></div>
                                    </div>
                                    <div class="occupy"><span>0</span>%</div>
                                    <div class="mem-re-min"></div>
                                    <div class="mem-re-con" title="$data['lan']['P3']"></div>
                                </div>
                                <h4 class="c9 f15">获取中: </h4>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="conter-box system-info bgw clearfix mtb15">
                    <div class="title c6 f16 plr15">
                        概览
                    </div>
                    <div class="system-info-con mtb20">
                        <ul class="clearfix text-center">
                            <li class="sys-li-box col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <p class="name f15 c9">网站</p>
                                <div class="val"><a class="btlink" href="site.jsp">2</a></div>
                            </li>
                            <li class="sys-li-box col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <p class="name f15 c9">FTP</p>
                                <div class="val"><a class="btlink" href="subscribe.jsp">5</a></div>
                            </li>
                            <li class="sys-li-box col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <p class="name f15 c9">数据库</p>
                                <div class="val"><a class="btlink" href="news.jsp">4</a></div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 pull-left pd0">
                    <div class="pr8">
                        <div class="bgw conter-box">
                            <div class="title c6 f16 plr15">软件</div>
                            <div class="setting-con" style="padding:0; height:442px; margin-right: -4px; overflow: hidden;">
                                <div class="container-fluid soft-man">
                                    <input name="list1SortOrder" type="hidden" value="" />
                                    <div id="indexsoft" class="row"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 pull-left pd0">
                    <div class="pl7">
                        <div class="bgw conter-box" style="height:491px">
                            <div class="title c6 f16 plr15">流量</div>
                            <div class="bw-info">
                                <div class="col-sm-6 col-md-3"><p class="c9"><span class="ico-up"></span>上行</p><a id="upSpeed">获取中: </a></div>
                                <div class="col-sm-6 col-md-3"><p class="c9"><span class="ico-down"></span>下行</p><a id="downSpeed">获取中: </a></div>
                                <div class="col-sm-6 col-md-3"><p class="c9">总发送</p><a id="upAll">获取中: </a></div>
                                <div class="col-sm-6 col-md-3"><p class="c9">总接收</p><a id="downAll">获取中: </a></div>
                            </div>
                            <div id="NetImg" style="width:100%;height:370px;"></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- 版权信息 -->
        <div class="footer bgw">网站后台系统 &copy;2005-2019 webrx (webrx.cn)&nbsp;(author:webrx modile:13014577033)</div>
    </div>
</div>
</body>
</html>