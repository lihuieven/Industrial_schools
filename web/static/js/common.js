$(document).ready(function () {
    function c() {
        a.bullets.eq(0).addClass("firsrCurrent")
    }

    var b, a = new Swiper(".apple-banner .swiper-container", {
        autoplay: 2e3,
        speed: 1e3,
        loop: !0,
        runCallbacksOnInit: !1,
        watchSlidesProgress: !0,
        pagination: ".apple-banner .swiper-pagination",
        paginationClickable: !0,
        paginationBulletRender: function (a, b, c) {
            return '<li class="' + c + '"><span><i></i></span></li>'
        },
        nextButton: ".swiper-button-next",
        prevButton: ".swiper-button-prev",
        onProgress: function (a) {
            var b, c, d, e, f, g;
            for (b = 0; b < a.slides.length; b++) {
                for (c = a.slides.eq(b), d = c[0].progress, d > 0 ? (e = .9 * d * a.width, scale = 1 - .1 * d, d > 1 && (scale = .9), txtPositionX = 0, txtPositionY = 30 * d + "px") : (e = 0, scale = 1, txtPositionX = 1e3 * -d + "px", txtPositionY = 0), f = c.find(".txt"), g = 0; g < f.length; g++) f.eq(g).transform("translate3d(" + txtPositionX + "," + txtPositionY + ",0)");
                c.transform("translate3d(" + e + "px,0,0) scale(" + scale + ")")
            }
        },
        onSetTransition: function (a, b) {
            var c, d, e;
            for (c = 0; c < a.slides.length; c++) for (slide = a.slides.eq(c), slide.transition(b), d = slide.find(".txt"), e = 0; e < d.length; e++) d.eq(e).transition(b)
        },
        onSlideChangeStart: function (a) {
            a.autoplaying && (a.bullets.eq(a.realIndex - 1).addClass("replace"), a.bullets.eq(a.realIndex - 1).removeClass("current firsrCurrent"), a.bullets.eq(a.realIndex).addClass("current"), 0 == a.realIndex && a.bullets.removeClass("replace"))
        },
        onAutoplayStop: function (a) {
            a.$(".autoplay").removeClass("autoplay")
        }
    });
    for (b = 0; b < a.slides.length; b++) a.slides[b].style.zIndex = b;
    setTimeout(c, 1)

//    鼠标悬停显示校园生活
    function clearall(){
        $(".school_img").hide();

        $(".school_nav p").css({'background':'transparent','color':'#fff'});
    }
    $(function () {

        $(".school_nav").children("p").eq(0).hover(function(){
            clearall();
            $(this).css({'background':'#fff','color':'#000'});
            $(".school_img").eq(0).show();
        });
        $(".school_nav").children("p").eq(1).hover(function(){
            clearall();
            $(this).css({'background':'#fff','color':'#000'});
            $(".school_img").eq(1).show();
        });
        $(".school_nav").children("p").eq(2).hover(function(){
            clearall();
            $(this).css({'background':'#fff','color':'#000'});
            $(".school_img").eq(2).show();
        });
    });
    //校园图集开始
    function clearall2(){
        $(".school_img").hide();

        $(".school_nav2 p").css({'background':'white','color':'#333','border-color':'#333'});
    }
    $(function () {

        $(".school_nav2").children("p").eq(0).hover(function(){
            clearall2();
            $(this).css({'background':'#2D96C3','color':'#fff','border-color':'transparent'});
            $(".school_img").eq(0).show();
        });
        $(".school_nav2").children("p").eq(1).hover(function(){
            clearall2();
            $(this).css({'background':'#2D96C3','color':'#fff','border-color':'transparent'});
            $(".school_img").eq(1).show();
        });
        $(".school_nav2").children("p").eq(2).hover(function(){
            clearall2();
            $(this).css({'background':'#2D96C3','color':'#fff','border-color':'transparent'});
            $(".school_img").eq(2).show();
        });
    });
    $('#marquee5,#marquee4').kxbdMarquee({
            direction: 'up',
            isEqual: false
        }
    );

    //    预约动态滚屏事件开始

    var works=[
        {name:'周*龙',school:'驻马店十五中',phone:'138****6788',pro:'电商运营与管理',status:'预约成功'},
        {name:'张*兰',school:'驻马店九中',phone:'136****3235',pro:'新媒体营销与策划',status:'预约成功'},
        {name:'柴*鑫',school:'郸城一中',phone:'180****2684',pro:'电商运营与管理',status:'预约成功'},
        {name:'闫*',school:'驻马店八中',phone:'133****1532',pro:'电商运营与管理',status:'预约成功'},
        {name:'李*龙',school:'驻马店一高总部',phone:'138****2431',pro:'新媒体营销与策划',status:'预约成功'},
        {name:'王*宇',school:'平舆六中',phone:'178****0960',pro:'新媒体营销与策划',status:'预约成功'},
        {name:'赵*云',school:'平舆三中',phone:'135****5504',pro:'UI设计',status:'预约成功'},
        {name:'张*悦',school:'平舆实验中学',phone:'178****0203',pro:'大数据',status:'预约成功'},
        {name:'卢*',school:'南阳八中',phone:'136****5623',pro:'移动软件开发',status:'预约成功'},
        {name:'龚*帅',school:'南阳九中',phone:'138****4069',pro:'电商运营与管理',status:'预约成功'},
        {name:'耿*',school:'树人中学',phone:'150****9640',pro:'新媒体营销与策划',status:'预约成功'},
        {name:'彭*',school:'周口实验中学',phone:'138****3435',pro:'电商运营与管理',status:'预约成功'},
        {name:'杨*雨',school:'太康一中',phone:'150****0063',pro:'新媒体营销与策划',status:'预约成功'},
        {name:'宋*',school:'南阳九中',phone:'136****9324',pro:'电商运营与管理',status:'预约成功'},
        {name:'曹*浩',school:'驻马店九中',phone:'178****0730',pro:'UI设计',status:'预约成功'},
        {name:'谢*丽',school:'树人中学',phone:'138****6892',pro:'UI设计',status:'预约成功'}
    ];
    var salary=new Vue({
        el:'#marquee5',
        data:{
            salaries:works
        }
    });
    $('#marquee5').kxbdMarquee({
            direction: 'up',
            isEqual: false
        }
    );
//    预约动态滚屏事件结束

//高薪待遇 动态滚屏 开始

    var works=[
        {name:'卢*燕',zhuanye:'电商运营',comname:'上海郎峰实业有限公司',salary:'7000+',welfary:'交通补贴 餐补 五险一金'},
        {name:'李*玲',zhuanye:'UI设计',comname:'上海郎峰实业有限公司',salary:'8000+',welfary:'交通补贴 餐补 五险一金'},
        {name:'赵**',zhuanye:'新媒体',comname:'上海美邦塑胶有限公司',salary:'8000+',welfary:'交通补贴 餐补 五险一金'},
        {name:'汪*贤',zhuanye:'移动端',comname:'上海浩洋泵阀制造有限公司',salary:'10000+',welfary:'交通补贴 餐补 五险一金'},
        {name:'刘*阳',zhuanye:'大数据',comname:'北京有限公司',salary:'10000+',welfary:'交通补贴 餐补 五险一金'},
        {name:'彭*',zhuanye:'商务客服',comname:'上海置泉自动化设备有限公司',salary:'6000+',welfary:'交通补贴 餐补 五险一金'},
        {name:'吴*雨',zhuanye:'电商运营',comname:'上海缘图光电科技有限公司',salary:'7000+',welfary:'交通补贴 餐补 五险一金'},
        {name:'周*芳',zhuanye:'新媒体',comname:'杭州瑞升线缆有限公司',salary:'8000+',welfary:'交通补贴 餐补 五险一金'},
        {name:'陶*',zhuanye:'UI设计',comname:'上海沁格贸易有限公司',salary:'8000+',welfary:'交通补贴 餐补 五险一金'},
        {name:'冯*雨',zhuanye:'新媒体',comname:'上海剑平动平衡机制造有限公司',salary:'8000+',welfary:'交通补贴 餐补 五险一金'},
        {name:'江*阳',zhuanye:'电商运营',comname:'上海美邦塑胶有限公',salary:'8000+',welfary:'交通补贴 餐补 五险一金'}
    ];
    var salary=new Vue({
        el:'#marquee4',
        data:{
            salaries:works
        }
    });
    $('#marquee4').kxbdMarquee({
            direction: 'up',
            isEqual: false
        }
    );
    document.querySelector("#career")

    /**
     * Created by Administrator on 2019/4/16.
     */
    function change(i,local) {
        var img=document.getElementsByClassName("server");
        img[i].src = "../images/icon" +local + ".png";
    }
    function  leave(i,local) {
        var img=document.getElementsByClassName("server");
        img[i].src="../images/icon"+local+".png";
    }
    function bluePointer(i) {
        var img=document.getElementsByClassName("pointer");
        img[i].src = "../images/arrow-right.png";
    }
    function whitePointer(i) {
        var img=document.getElementsByClassName("pointer");
        img[i].src = "../images/arrow-right-white.png";
    }
    //    就业咨询页面 开始

//    就业咨询页面 结束

});

