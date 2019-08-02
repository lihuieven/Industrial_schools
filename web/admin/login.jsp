<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" href="/static/bootstrap-3.3.7/css/bootstrap.min.css">
    <title>内容管理系统 - Powered by Webrx@126.com</title>
    <link href="/static/admin/images/wall/login.css" rel="stylesheet">
</head>
<body id="mydiv">
<style type='text/css'>
    .aero:before, .aero:after, .background {background-color: #bbb;background-image: url('/static/admin/images/wall/2.jpg');}</style>
<div id="bg" class="background"></div>
<script>
   function init(){
        let index = Math.round(Math.random()*35);
		document.getElementById("bg").style.backgroundImage = "url('/static/admin/images/wall/"+index+".jpg')";
   }
   init();
   setInterval(init,1000*60);
</script>
<div class="loginbox animated-500 fadeInDown aero">
    <div class="title">
        <div class="logo"><i class="glyphicon glyphicon-cloud"></i>内容管理系统</div>
    </div>
    <div class="form">
        <form action="/admin" method="post">
            <div class="inputs">
                <div>
                    <i class="font-icon"><i class="glyphicon glyphicon-user"></i></i>
                    <input id="username" name='name' type="text" autofocus placeholder="登录账号" required autocomplete="on">
                </div>
                <div>
                    <i class="font-icon"><i class="glyphicon glyphicon-lock"></i></i>
                    <input id="password" name='password' type="password" placeholder="密码" required autocomplete="on">
                </div>

                <div>
                    <i class="font-icon"><i class="glyphicon glyphicon-check"></i></i>
                    <input id="check" name='check' type="text" placeholder="验证码" required autocomplete="on">
                </div>
            </div>

            <div class="actions">
                <label for='rm'>
                    <input type="checkbox" class="checkbox" name="rememberPassword" id='rm'/>
                    记住密码 </label>
                <a href="javascript:void(0);" class="forget-password">忘记密码</a>
                <br/>
                <input type="submit" id="submit" value="登录"/>
            </div>
            <div class="msg"></div>
        </form>
    </div>
</div>
<div class="common-footer aero">
    <span class="copyright-content">Powered by webrx v1.00 | Copyright © <a href="http://www.webrx.cn" target="_blank">webrx.cn</a>&nbsp;&nbsp;Author:webrx &nbsp; Modile:13014577033</span>
</div>
<script>
		window.onload = function() {
		    //配置
		    var config = {
		        vx: 4,	//小球x轴速度,正为右，负为左
		        vy: 4,	//小球y轴速度
		        height: 2,	//小球高宽，其实为正方形，所以不宜太大
		        width: 2,
		        count: 200,		//点个数
		        color: "255, 255, 255", 	//点颜色
		        stroke: "255,255,255", 		//线条颜色
		        dist: 6000, 	//点吸附距离
		        e_dist: 20000, 	//鼠标吸附加速距离
		        max_conn: 10 	//点到点最大连接数
		    };
		    //调用
		    CanvasParticle(config);
		}
	</script>
<script src="/static/admin/canvas-particle.js"></script>
</body>
</html>
