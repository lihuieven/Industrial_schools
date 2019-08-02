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
            <div class="container-fluid" style="padding-bottom:50px">
                <div class="file-box bgw mtb15" style="position:relative; padding-top:110px">
                    <div id="tipTools" class="plr15"
                         style="width: 1107px; position: fixed; top: 0px; left: 195px; box-shadow: rgb(204, 204, 204) 0px 1px 10px 3px;">
                        <div class="ptb15">
                            <div class="clearfix">
                                <div class="pull-left">
                                    <button id="backBtn"
                                            class="backBtn btn btn-default btn-sm glyphicon glyphicon-arrow-left pull-left"
                                            title="后退" onclick="BackDir()"></button>
                                    <button class="backBtn refreshBtn btn btn-default btn-sm glyphicon glyphicon-refresh pull-right"
                                            title="刷新" style="margin-left:-1px;"></button>
                                    <span id="DirPathPlace" class="pull-left" style="display: none;"><input
                                            id="fileInputPath" type="text" style="width: 419px;"></span>
                                    <span id="PathPlaceBtn" class="pull-left" style="width: 409px; display: inline;"><div
                                            style="width:1200px;height:26px"><ul style="left: 0px;"><li><a
                                            title="/">根目录</a></li><li><a title="/www/">www</a></li><li><a
                                            title="/www/wwwroot/">wwwroot</a></li></ul></div></span>
                                </div>
                                <div class="pull-left mlr15" style="line-height:26px"><span id="DirInfo">(共10个目录与10个文件,大小:<font
                                        id="pathSize">0 B<a class="btlink ml5"
                                                            onclick="GetPathSize()">获取</a></font>)</span></div>
                                <div class="search pull-right" style="position: absolute; top: 6px; right: 5px;">
                                    <form target="hid" onsubmit="GetFiles(1)">
                                        <input type="text" id="SearchValue" class="ser-text pull-left" placeholder="">
                                        <button type="button" class="ser-sub pull-left" onclick="GetFiles(1)"></button>
                                    </form>
                                    <iframe name="hid" id="hid" style="display:none"></iframe>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix ptb10">
                            <button class="btn btn-default btn-sm pull-left" onclick="UploadFiles()">上传</button>
                            <button class="btn btn-default btn-sm pull-left" onclick="DownloadFile()" title="下载文件到服务器"
                                    style="margin:0 5px">远程下载
                            </button>
                            <span id="BarTools"><div class="btn-group">						<button
                                    class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">						新建 <span
                                    class="caret"></span>						</button>						<ul
                                    class="dropdown-menu">						<li><a
                                    href="javascript:CreateFile(0,'%2Fwww%2Fwwwroot');">新建空白文件</a></li>						<li><a
                                    href="javascript:CreateDir(0,'%2Fwww%2Fwwwroot');">新建目录</a></li>						</ul>						</div> <button
                                    onclick="javascript:BackDir();"
                                    class="btn btn-default btn-sm glyphicon glyphicon-arrow-left"
                                    title="返回上一级"></button> <button onclick="javascript:GetFiles('/www/wwwroot');"
                                                                    class="btn btn-default btn-sm glyphicon glyphicon-refresh"
                                                                    title="刷新"></button> <button onclick="web_shell()"
                                                                                                 title="终端"
                                                                                                 type="button"
                                                                                                 class="btn btn-default btn-sm"><em
                                    class="ico-cmd"></em></button></span>
                            <span id="Batch"
                                  style="background-color:#fff;position:absolute;right:190px;z-index:10"></span>
                            <span id="comlist" class="comlist"><span onclick="GetFiles('/')"><span
                                    class="glyphicon glyphicon-hdd"></span>&nbsp;根目录(32G)</span><span
                                    onclick="GetFiles('/etc/hosts')"><span class="glyphicon glyphicon-hdd"></span>&nbsp;/etc/hosts(32G)</span><span
                                    id="recycle_bin" onclick="Recycle_bin('open')" title="回收站"
                                    style="position: absolute; border-color: #ccc; right: 77px;"><span
                                    class="glyphicon glyphicon-trash"></span>&nbsp;回收站</span></span>
                            <div class="btn-group btn-group-sm pull-right" style="margin-right:5px;">
                                <button id="set_icon" title="图标排列" type="button" class="btn btn-default">
                                    <i class="glyphicon glyphicon-th"></i>
                                </button>
                                <button id="set_list" title="列表排列" type="button" class="btn btn-default active">
                                    <i class="glyphicon glyphicon-th-list"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="divtable pd15 ui-selectable" id="fileCon">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-hover">
                            <thead>
                            <tr class="ui-selectee">
                                <th width="30"><input type="checkbox" id="setBox" placeholder=""></th>
                                <th>文件名</th>
                                <th>大小</th>
                                <th>修改时间</th>
                                <th>权限</th>
                                <th>所有者</th>
                                <th style="text-align: right;" width="330">操作</th>
                            </tr>
                            </thead>
                            <tbody id="filesBody" class="list-list ui-selectable">
                            <tr class="folderBoxTr ui-selectee" data-path="/www/wwwroot/111" filetype="dir">
                                <td><input type="checkbox" name="id" value="111"></td>
                                <td class="column-name"><span class="cursor"
                                                              onclick="GetFiles('/www/wwwroot/111')"><span
                                        class="ico ico-folder"></span><a class="text" title="111">111</a></span></td>
                                <td>4.00 KB</td>
                                <td>2019/05/14 09:19:35</td>
                                <td>444</td>
                                <td>www</td>
                                <td class="editmenu"><span>						<a class="btlink" href="javascript:;"
                                                                                      onclick="CopyFile('/www/wwwroot/111')">复制</a> | 						<a
                                        class="btlink" href="javascript:;" onclick="CutFile('/www/wwwroot/111')">剪切</a> | 						<a
                                        class="btlink" href="javascript:ReName(0,'111');">重命名</a> | 						<a
                                        class="btlink" href="javascript:SetChmod(0,'/www/wwwroot/111');">权限</a> | 						<a
                                        class="btlink" href="javascript:Zip('/www/wwwroot/111');">压缩</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="DeleteDir('/www/wwwroot/111')">删除</a></span></td>
                            </tr>
                            <tr class="folderBoxTr ui-selectee" data-path="/www/wwwroot/123" filetype="dir">
                                <td><input type="checkbox" name="id" value="123"></td>
                                <td class="column-name"><span class="cursor"
                                                              onclick="GetFiles('/www/wwwroot/123')"><span
                                        class="ico ico-folder"></span><a class="text" title="123">123</a></span></td>
                                <td>4.00 KB</td>
                                <td>2019/05/13 22:13:31</td>
                                <td>755</td>
                                <td>www</td>
                                <td class="editmenu"><span>						<a class="btlink" href="javascript:;"
                                                                                      onclick="CopyFile('/www/wwwroot/123')">复制</a> | 						<a
                                        class="btlink" href="javascript:;" onclick="CutFile('/www/wwwroot/123')">剪切</a> | 						<a
                                        class="btlink" href="javascript:ReName(0,'123');">重命名</a> | 						<a
                                        class="btlink" href="javascript:SetChmod(0,'/www/wwwroot/123');">权限</a> | 						<a
                                        class="btlink" href="javascript:Zip('/www/wwwroot/123');">压缩</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="DeleteDir('/www/wwwroot/123')">删除</a></span></td>
                            </tr>
                            <tr class="folderBoxTr ui-selectee" data-path="/www/wwwroot/333" filetype="dir">
                                <td><input type="checkbox" name="id" value="333"></td>
                                <td class="column-name"><span class="cursor"
                                                              onclick="GetFiles('/www/wwwroot/333')"><span
                                        class="ico ico-folder"></span><a class="text" title="333">333</a></span></td>
                                <td>4.00 KB</td>
                                <td>2019/05/15 09:43:38</td>
                                <td>755</td>
                                <td>www</td>
                                <td class="editmenu"><span>						<a class="btlink" href="javascript:;"
                                                                                      onclick="CopyFile('/www/wwwroot/333')">复制</a> | 						<a
                                        class="btlink" href="javascript:;" onclick="CutFile('/www/wwwroot/333')">剪切</a> | 						<a
                                        class="btlink" href="javascript:ReName(0,'333');">重命名</a> | 						<a
                                        class="btlink" href="javascript:SetChmod(0,'/www/wwwroot/333');">权限</a> | 						<a
                                        class="btlink" href="javascript:Zip('/www/wwwroot/333');">压缩</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="DeleteDir('/www/wwwroot/333')">删除</a></span></td>
                            </tr>
                            <tr class="folderBoxTr ui-selectee" data-path="/www/wwwroot/47.102.114.224" filetype="dir">
                                <td><input type="checkbox" name="id" value="47.102.114.224"></td>
                                <td class="column-name"><span class="cursor"
                                                              onclick="GetFiles('/www/wwwroot/47.102.114.224')"><span
                                        class="ico ico-folder"></span><a class="text" title="47.102.114.224">47.102.114.224</a></span>
                                </td>
                                <td>4.00 KB</td>
                                <td>2019/05/13 21:13:36</td>
                                <td>755</td>
                                <td>www</td>
                                <td class="editmenu"><span>						<a class="btlink" href="javascript:;"
                                                                                      onclick="CopyFile('/www/wwwroot/47.102.114.224')">复制</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="CutFile('/www/wwwroot/47.102.114.224')">剪切</a> | 						<a
                                        class="btlink" href="javascript:ReName(0,'47.102.114.224');">重命名</a> | 						<a
                                        class="btlink"
                                        href="javascript:SetChmod(0,'/www/wwwroot/47.102.114.224');">权限</a> | 						<a
                                        class="btlink" href="javascript:Zip('/www/wwwroot/47.102.114.224');">压缩</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="DeleteDir('/www/wwwroot/47.102.114.224')">删除</a></span></td>
                            </tr>
                            <tr class="folderBoxTr ui-selectee" data-path="/www/wwwroot/adm" filetype="dir">
                                <td><input type="checkbox" name="id" value="adm"></td>
                                <td class="column-name"><span class="cursor"
                                                              onclick="GetFiles('/www/wwwroot/adm')"><span
                                        class="ico ico-folder"></span><a class="text" title="adm">adm</a></span></td>
                                <td>4.00 KB</td>
                                <td>2019/05/13 20:55:09</td>
                                <td>755</td>
                                <td>www</td>
                                <td class="editmenu"><span>						<a class="btlink" href="javascript:;"
                                                                                      onclick="CopyFile('/www/wwwroot/adm')">复制</a> | 						<a
                                        class="btlink" href="javascript:;" onclick="CutFile('/www/wwwroot/adm')">剪切</a> | 						<a
                                        class="btlink" href="javascript:ReName(0,'adm');">重命名</a> | 						<a
                                        class="btlink" href="javascript:SetChmod(0,'/www/wwwroot/adm');">权限</a> | 						<a
                                        class="btlink" href="javascript:Zip('/www/wwwroot/adm');">压缩</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="DeleteDir('/www/wwwroot/adm')">删除</a></span></td>
                            </tr>
                            <tr class="folderBoxTr ui-selectee" data-path="/www/wwwroot/beedoob.com" filetype="dir">
                                <td><input type="checkbox" name="id" value="beedoob.com"></td>
                                <td class="column-name"><span class="cursor"
                                                              onclick="GetFiles('/www/wwwroot/beedoob.com')"><span
                                        class="ico ico-folder"></span><a class="text"
                                                                         title="beedoob.com">beedoob.com</a></span></td>
                                <td>4.00 KB</td>
                                <td>2019/05/13 21:00:24</td>
                                <td>755</td>
                                <td>www</td>
                                <td class="editmenu"><span>						<a class="btlink" href="javascript:;"
                                                                                      onclick="CopyFile('/www/wwwroot/beedoob.com')">复制</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="CutFile('/www/wwwroot/beedoob.com')">剪切</a> | 						<a
                                        class="btlink" href="javascript:ReName(0,'beedoob.com');">重命名</a> | 						<a
                                        class="btlink" href="javascript:SetChmod(0,'/www/wwwroot/beedoob.com');">权限</a> | 						<a
                                        class="btlink" href="javascript:Zip('/www/wwwroot/beedoob.com');">压缩</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="DeleteDir('/www/wwwroot/beedoob.com')">删除</a></span></td>
                            </tr>
                            <tr class="folderBoxTr ui-selectee" data-path="/www/wwwroot/ceshi" filetype="dir">
                                <td><input type="checkbox" name="id" value="ceshi"></td>
                                <td class="column-name"><span class="cursor"
                                                              onclick="GetFiles('/www/wwwroot/ceshi')"><span
                                        class="ico ico-folder"></span><a class="text" title="ceshi">ceshi</a></span>
                                </td>
                                <td>4.00 KB</td>
                                <td>2019/05/14 23:15:34</td>
                                <td>755</td>
                                <td>www</td>
                                <td class="editmenu"><span>						<a class="btlink" href="javascript:;"
                                                                                      onclick="CopyFile('/www/wwwroot/ceshi')">复制</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="CutFile('/www/wwwroot/ceshi')">剪切</a> | 						<a
                                        class="btlink" href="javascript:ReName(0,'ceshi');">重命名</a> | 						<a
                                        class="btlink" href="javascript:SetChmod(0,'/www/wwwroot/ceshi');">权限</a> | 						<a
                                        class="btlink" href="javascript:Zip('/www/wwwroot/ceshi');">压缩</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="DeleteDir('/www/wwwroot/ceshi')">删除</a></span></td>
                            </tr>
                            <tr class="folderBoxTr ui-selectee" data-path="/www/wwwroot/fufugay.com" filetype="dir">
                                <td><input type="checkbox" name="id" value="fufugay.com"></td>
                                <td class="column-name"><span class="cursor"
                                                              onclick="GetFiles('/www/wwwroot/fufugay.com')"><span
                                        class="ico ico-folder"></span><a class="text"
                                                                         title="fufugay.com">fufugay.com</a></span></td>
                                <td>4.00 KB</td>
                                <td>2019/05/15 11:22:39</td>
                                <td>755</td>
                                <td>www</td>
                                <td class="editmenu"><span>						<a class="btlink" href="javascript:;"
                                                                                      onclick="CopyFile('/www/wwwroot/fufugay.com')">复制</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="CutFile('/www/wwwroot/fufugay.com')">剪切</a> | 						<a
                                        class="btlink" href="javascript:ReName(0,'fufugay.com');">重命名</a> | 						<a
                                        class="btlink" href="javascript:SetChmod(0,'/www/wwwroot/fufugay.com');">权限</a> | 						<a
                                        class="btlink" href="javascript:Zip('/www/wwwroot/fufugay.com');">压缩</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="DeleteDir('/www/wwwroot/fufugay.com')">删除</a></span></td>
                            </tr>
                            <tr class="folderBoxTr ui-selectee" data-path="/www/wwwroot/www.catline.com" filetype="dir">
                                <td><input type="checkbox" name="id" value="www.catline.com"></td>
                                <td class="column-name"><span class="cursor"
                                                              onclick="GetFiles('/www/wwwroot/www.catline.com')"><span
                                        class="ico ico-folder"></span><a class="text" title="www.catline.com">www.catline.com</a></span>
                                </td>
                                <td>4.00 KB</td>
                                <td>2019/05/15 10:52:45</td>
                                <td>555</td>
                                <td>www</td>
                                <td class="editmenu"><span>						<a class="btlink" href="javascript:;"
                                                                                      onclick="CopyFile('/www/wwwroot/www.catline.com')">复制</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="CutFile('/www/wwwroot/www.catline.com')">剪切</a> | 						<a
                                        class="btlink" href="javascript:ReName(0,'www.catline.com');">重命名</a> | 						<a
                                        class="btlink"
                                        href="javascript:SetChmod(0,'/www/wwwroot/www.catline.com');">权限</a> | 						<a
                                        class="btlink" href="javascript:Zip('/www/wwwroot/www.catline.com');">压缩</a> | 						<a
                                        class="btlink" href="javascript:;"
                                        onclick="DeleteDir('/www/wwwroot/www.catline.com')">删除</a></span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="dataTables_paginate paging_bootstrap pagination plr15"
                         style="position: relative; top: -15px;">
                        <ul id="filePage" class="page">
                            <div><span class="Pcurrent">1</span><span class="Pnumber">1/1</span><span class="Pline">从1-10条</span><span
                                    class="Pcount" style="left: 16px;">共10条数据</span><span class="Pcount-item">每页<select
                                    style="margin-left: 3px;margin-right: 3px;border:#ddd 1px solid" class="showRow"><option
                                    value="100" selected="">100</option><option value="200">200</option><option
                                    value="500">500</option><option value="1000">1000</option><option
                                    value="2000">2000</option></select>条</span></div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <ul id="rmenu" class="dropdown-menu" style="display:none">
            <li onclick="javascript:Batch(1);"><a style="cursor: pointer;">复制</a></li>
            <li onclick="javascript:Batch(2);"><a style="cursor: pointer;">剪切</a></li>
            <li onclick="javascript:Batch(5);"><a style="cursor: pointer;">压缩</a></li>
            <li onclick="javascript:Batch(3);"><a style="cursor: pointer;">权限</a></li>
            <li onclick="javascript:Batch(4);"><a style="cursor: pointer;">删除</a></li>
        </ul>
        <script src="static/js/jquery-ui.min.js"></script>
        <script src="static/js/jquery.contextify.min.js"></script>
        <script src="static/js/files.js?date=6.8.7"></script>
        <script src="static/js/upload.js?date=6.8.7"></script>
        <script type="text/javascript">
            setTimeout(function () {
                GetDisk();
            }, 500);
            var xPath = getCookie('Path');
            setTimeout(function () {
                GetFiles((xPath != undefined ? xPath : '/www/wwwroot'));
            }, 800);

            PathPlaceBtn((xPath != undefined ? xPath : '/www/wwwroot'));
            setCookie('uploadSize', 1024 * 1024 * 1024);
            if (getCookie('rank') == undefined || getCookie('rank') == null) {
                setCookie('rank', 'a');
            }
            $("#set_icon").click(function () {
                setCookie('rank', 'b');
                $(this).addClass("active");
                $("#set_list").removeClass("active");
                GetFiles(getCookie('Path'));
            });
            $("#set_list").click(function () {
                setCookie('rank', 'a');
                $(this).addClass("active");
                $("#set_icon").removeClass("active");
                GetFiles(getCookie('Path'));
            })
            $(".refreshBtn").click(function () {
                GetFiles(getCookie('Path'));
            })
        </script>

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

