
/**
 * 鎵嬪唽缃戞敹钘�(www.shouce.ren)
 * @classDescription 妯℃嫙Marquee锛屾棤闂存柇婊氬姩鍐呭
 * @author Aken Li(www.kxbd.com)
 * @DOM
 *  	<div id="marquee">
 *  		<ul>
 *   			<li></li>
 *   			<li></li>
 *  		</ul>
 *  	</div>
 * @CSS
 *  	#marquee {overflow:hidden;width:200px;height:50px;}
 * @Usage
 *  	$("#marquee").kxbdMarquee(options);
 * @options
 *		isEqual:true,		//鎵€鏈夋粴鍔ㄧ殑鍏冪礌闀垮鏄惁鐩哥瓑,true,false
 *  	loop:0,				//寰幆婊氬姩娆℃暟锛�0鏃舵棤闄�
 *		direction:"left",	//婊氬姩鏂瑰悜锛�"left","right","up","down"
 *		scrollAmount:1,		//姝ラ暱
 *		scrollDelay:20		//鏃堕暱
 */
(function($){
    $.fn.kxbdMarquee=function(options){
        var opts=$.extend({},$.fn.kxbdMarquee.defaults, options);

        return this.each(function(){
            var $marquee=$(this);				//婊氬姩鍏冪礌瀹瑰櫒
            var _scrollObj=$marquee.get(0);		//婊氬姩鍏冪礌瀹瑰櫒DOM
            var scrollW=$marquee.width();		//婊氬姩鍏冪礌瀹瑰櫒鐨勫搴�
            var scrollH=$marquee.height();		//婊氬姩鍏冪礌瀹瑰櫒鐨勯珮搴�
            var $element=$marquee.children();	//婊氬姩鍏冪礌
            var $kids=$element.children();		//婊氬姩瀛愬厓绱�
            var scrollSize=0;					//婊氬姩鍏冪礌灏哄

            //婊氬姩绫诲瀷锛�1宸﹀彸锛�0涓婁笅
            var _type=(opts.direction=="left"||opts.direction=="right") ? 1:0;

            //闃叉婊氬姩瀛愬厓绱犳瘮婊氬姩鍏冪礌瀹借€屽彇涓嶅埌瀹為檯婊氬姩瀛愬厓绱犲搴�
            $element.css(_type?"width":"height",10000);

            //鑾峰彇婊氬姩鍏冪礌鐨勫昂瀵�
            if(opts.isEqual){
                scrollSize=$kids[_type?"outerWidth":"outerHeight"]()*$kids.length;
            }else{
                $kids.each(function(){
                    scrollSize+=$(this)[_type?"outerWidth":"outerHeight"]();
                });
            };

            //婊氬姩鍏冪礌鎬诲昂瀵稿皬浜庡鍣ㄥ昂瀵革紝涓嶆粴鍔�
            if(scrollSize<(_type?scrollW:scrollH)){return;};

            //鍏嬮殕婊氬姩瀛愬厓绱犲皢鍏舵彃鍏ュ埌婊氬姩鍏冪礌鍚庯紝骞惰瀹氭粴鍔ㄥ厓绱犲搴�
            $element.append($kids.clone()).css(_type?"width":"height",scrollSize*2);

            var numMoved=0;
            function scrollFunc(){
                var _dir=(opts.direction=="left"||opts.direction=="right") ? "scrollLeft":"scrollTop";
                if (opts.loop>0) {
                    numMoved+=opts.scrollAmount;
                    if(numMoved>scrollSize*opts.loop){
                        _scrollObj[_dir]=0;
                        return clearInterval(moveId);
                    };
                };

                if(opts.direction=="left"||opts.direction=="up"){
                    var newPos=_scrollObj[_dir]+opts.scrollAmount;
                    if(newPos>=scrollSize){
                        newPos-=scrollSize;
                    }
                    _scrollObj[_dir]=newPos;
                }else{
                    var newPos=_scrollObj[_dir]-opts.scrollAmount;
                    if(newPos<=0){
                        newPos += scrollSize;
                    };
                    _scrollObj[_dir]=newPos;
                };
            };

            //婊氬姩寮€濮�
            var moveId=setInterval(scrollFunc, opts.scrollDelay);

            //榧犳爣鍒掕繃鍋滄婊氬姩
            $marquee.hover(function(){
                clearInterval(moveId);
            },function(){
                clearInterval(moveId);
                moveId=setInterval(scrollFunc, opts.scrollDelay);
            });
        });
    };

    $.fn.kxbdMarquee.defaults={
        isEqual:true,		//鎵€鏈夋粴鍔ㄧ殑鍏冪礌闀垮鏄惁鐩哥瓑,true,false
        loop: 0,			//寰幆婊氬姩娆℃暟锛�0鏃舵棤闄�
        direction: "left",	//婊氬姩鏂瑰悜锛�"left","right","up","down"
        scrollAmount:1,		//姝ラ暱
        scrollDelay:20		//鏃堕暱

    };

    $.fn.kxbdMarquee.setDefaults=function(settings) {
        $.extend( $.fn.kxbdMarquee.defaults, settings );
    };
})(jQuery);