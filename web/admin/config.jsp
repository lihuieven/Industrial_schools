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
        <button style="display: none;" id="bt_copys" class="bt_copy" data-clipboard-text=""></button>

        <div class="main-content">
            <div class="container-fluid" style="padding-bottom:54px">
                <div class="pos-box bgw mtb15">
                    <div class="position f14 c9 pull-left">
                        <a class="plr10 c4" href="index.jsp">首页</a>/<span class="plr10 c4">系统设置</span>
                    </div>
                </div>
                <div class="setbox bgw mtb15">
                    <div class="title c6 plr15">
                        <h3 class="f16">用户信息修改</h3>
                    </div>
                    <div class="info-title-tips" style="margin: 20px 30px 0px;">
                        <p><span class="glyphicon glyphicon-alert" style="color: #f39c12; margin-right: 10px;"></span>为了提高安全，建议经常修改密码和手机号，账号手机号都可以直接登录本系统!
                        </p>
                    </div>

                    <div class="setting-con pd15">
                        <form id="set-Config">
                            <p class="mtb15"><span class="set-tit text-right" title="账号">账号</span><input name="account" class="inputtxt bt-input-text" type="text" value="lihui" readonly><span class="set-info c7">管理员账号，不可以修改</span></p>
                            <p class="mtb15"><span class="set-tit text-right" title="旧密码">旧密码</span><input name="passwd" class="inputtxt bt-input-text" type="password"><span class="set-info c7">旧密码，没有旧密码或错误是不能修改当前账号信息的</span></p>
                            <p class="mtb15"><span class="set-tit text-right" title="新密码">新密码</span><input name="pwd1" class="inputtxt bt-input-text" type="password"><span class="set-info c7">新密码</span></p>
                            <p class="mtb15"><span class="set-tit text-right" title="确认密码">确认密码</span><input name="pwd2" class="inputtxt bt-input-text" type="password"><span class="set-info c7">确认密码</span></p>
                            <p class="mtb15"><span class="set-tit text-right" title="真实姓名">真实姓名</span><input name="tname" class="inputtxt bt-input-text" type="text" value="张三丰"><span class="set-info c7">真实姓名!</span></p>
                            <p class="mtb15"><span class="set-tit text-right" title="手机号">手机号</span><input name="phone" class="inputtxt bt-input-text" type="text" value="13014577033"><span class="set-info c7">手机号也可以登录!</span></p>
                            <p class="mtb15"><span class="set-tit text-right" title="登录次数">登录次数</span><input name="num" class="inputtxt bt-input-text" type="text" value="137" readonly><span class="set-info c7">当前管理登录管理系统的次数</span></p>
                        </form>
                        <div class="bt-submit set-submit" id="submit">修改当前管理员信息</div>
                        <script src="/static/js/jquery-3.4.1.js"></script>
                        <script src="/static/layer-v3.1.1/layer.js"></script>
                        <script>
                            $(function () {
                                $("#submit").click(function () {
                                    aa = layer.load();
                                    $.ajax({
                                        type: 'post',
                                        url: '/admin/a?method=updateAdmin',
                                        cache: false,
                                        data: {
                                            account: $('input[name=account]').val(),
                                            passwd: $('input[name=passwd]').val(),
                                            pwd1: $('input[name=pwd1]').val(),
                                            pwd2: $('input[name=pwd2]').val(),
                                            tname: $('input[name=tname]').val(),
                                            phone: $('input[name=phone]').val()
                                        },
                                        success: function (dd) {
                                            layer.alert(dd);
                                            layer.close(aa);
                                        }
                                    })
                                });
                            });
                        </script>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<style>
    .boxConter {
        height: 458px;
        position: relative;
        overflow: auto;
    }

    .iconCode {
        padding: 50px 60px;
    }

    .box-conter {
        width: 100%;
    }

    #QRcode {
        margin-bottom: 25px;
        text-align: center;
    }

    .iconCode #QRcode,
    .iconCode .codeTip {
        width: 100%;
        text-align: center;
        font-size: 17px;
    }

    .iconCode .weChatSamll img {
        width: 100%;
    }

    .iconCode .weChatSamll {
        display: none;
        width: 200px;
        height: 200px;
        position: absolute;
        border: 1px solid #ececec;
        border-radius: 5px;
        bottom: 150px;
        right: 50px;
        padding: 20px;
        background-color: #fff;
    }

    .iconCode .weChatSamll:after {
        content: '';
        width: 15px;
        height: 15px;
        background: #ffffff;
        border-bottom: 1px solid #ececec;
        border-right: 1px solid #ececec;
        transform: rotate(45deg);
        position: absolute;
        border-radius: 4px;
        left: 90px;
        bottom: -8px;
    }

    .iconCode .weChat {
        margin-left: 15px;
    }

    .iconCode .weChat:hover .weChatSamll {
        display: block;
    }

    .iconCode .QRcode {
        margin-bottom: 15px;
        text-align: center;
    }

    .codeTip ul li {
        margin-bottom: 10px;
    }

    .personalDetails .head_img {
        width: 50px;
        height: 50px;
        float: left;
        margin-right: 30px;
    }

    .personalDetails .head_img img {
        height: 100%;
        border-radius: 50%;
    }

    .personalDetails .nick_name {
        height: 50px;
        line-height: 50px;
        width: 148px;
        float: left;
        font-size: 15px;
        color: #808080;
    }

    .personalDetails .userList {
        height: 100%;
    }

    .personalDetails .userList .addweChat {
        height: 50px;
        text-align: center;
        padding-top: 20px;
        color: #20a53a;
        font-size: 16px;
    }

    .personalDetails .userList .addweChat:hover {
    }

    .personalDetails .userList .item {
        height: 70px;
        padding: 10px 15px;
        border: 1px solid #ececec;
        margin: 15px 65px;
        border-radius: 5px;
    }

    .personalDetails .userList .cancelBind {
        height: 50px;
        width: 60px;
        float: right;
        line-height: 50px;
        text-align: center;
    }
</style>
<script type="text/javascript" src="/static/js/jquery.qrcode.min.js"></script>
<script src="/static/js/config.js?date=6.8.7"></script>
<script type="text/javascript">
    setCookie('serverType', "nginx");
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

