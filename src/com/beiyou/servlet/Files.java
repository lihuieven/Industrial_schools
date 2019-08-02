package com.beiyou.servlet;

import com.beiyou.entity.Ad;
import com.beiyou.entity.Subscribe;
import com.beiyou.service.AdService;
import com.beiyou.service.ConfigService;
import com.beiyou.service.SubscribeService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.Map;

@WebServlet("/file")
public class Files extends BeanServlet {
    //生成轮播图缓存文件
    public void adFile(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        //指定文件生成路径
        String path = "/html/";
        File file = new File(path);
        //判断是否存在，若不存在则创建目录
        if (!file.exists()) {
            file.mkdirs();
        }
        //指定生成文件
        String adFile = "ad.html";
        //拼接文件路径
        String adPath = request.getServletContext().getRealPath(path + adFile);
        File ad = new File(adPath);
        StringBuilder stringBuilder = new StringBuilder();
        if (ad.exists()) {
            BufferedReader br = new BufferedReader(new FileReader(adPath));
            while (br.ready()) {
                stringBuilder.append(br.readLine());
            }
            br.close();
        } else {
            AdService adService = new AdService();
            List<Ad> adList = adService.findAdList();
            stringBuilder.append("<div class=\"apple-banner\">" +
                    "<div class=\"swiper-container\">" +
                    "<div class=\"swiper-wrapper\">");
            for (Ad mm : adList) {
                stringBuilder.append(String.format("<div class=\"swiper-slide\" onclick=\"location.href='%s'\" style=\"background: #000 url(/uploads/ad/%s) no-repeat center;cursor: pointer\" title=\"%s\"></div>",mm.getUrl(),mm.getImg(),mm.getTitle()));
                System.out.println(mm.getTitle());
            }
            stringBuilder.append("</div>" +
                    "<div class=\"swiper-button-prev\"><span></span></div>" +
                    "<div class=\"swiper-button-next\"><span></span></div>" +
                    "<ul class=\"swiper-pagination autoplay\">" +
                    "</ul>" +
                    "</div>" +
                    "</div>");
            FileOutputStream fileOutputStream = new FileOutputStream(ad);
            try {
                fileOutputStream.write(stringBuilder.toString().getBytes());
                fileOutputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //缓存时间
        //生成缓存
        response.sendRedirect("/page?method=indexpage&id=1");
    }

    //生成预约模块缓存文件
    public void subscribesFile(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String string = "/html/";
        File file = new File(string);
        if(!file.exists()){
            file.mkdirs();
        }
        String subscribes = "subscribes.html";
        String subscribesPath = request.getServletContext().getRealPath(string+subscribes);
        File subscribesFile = new File(subscribesPath);
        StringBuilder stringBuilder = new StringBuilder();
        if(!subscribesFile.exists()){
            SubscribeService subscribeService = new SubscribeService();
            List<Subscribe> subscribesList = subscribeService.findYesList();
            stringBuilder.append("<div class=\"yuyue\"><div class=\"yuyue_div\"><div id=\"notice\" class=\"yuyue_left\"><h2>预约动态：</h2><div id=\"marquee5\"><ul class=\"col-xs-12 row\">");
            for(Subscribe subscribe:subscribesList){
                stringBuilder.append(String.format("<li class=\"col-xs-12 text-center row\"><span class=\"col-xs-2\">%s</span><span class=\"col-xs-3\">%s</span>" +
                        "<span class=\"col-xs-2\">%s</span><span class=\"col-xs-3\">%s</span><span class=\"col-xs-2\">预约成功</span></li>",
                        subscribe.getName(),subscribe.getSchool(),subscribe.getPhone(),subscribe.getMajor()));
            }
            stringBuilder.append("</ul></div></div><div class=\"yuyue_right\"><h2>预约报名</h2><form action=\"${pageContext.request.contextPath }/page?method=register\" method=\"post\">" +
                    "<input type=\"text\" class=\"form-control\" placeholder=\"请输入姓名\" name=\"name\"><input type=\"text\" class=\"form-control\" placeholder=\"请输入毕业学校\" name=\"school\">" +
                    "<input type=\"text\" class=\"form-control\" placeholder=\"请输入手机号\" name=\"phone\"><select class=\"form-control\" id=\"majorlist\" name=\"major\"><option value=\"0\">请选择专业</option>" +
                    "<option value=\"电商运营\">电商运营</option><option value=\"UI设计\">UI设计</option><option value=\"移动软件\">移动软件</option><option value=\"商务客服\">商务客服</option>" +
                    "<option value=\"新媒体营销\">新媒体营销</option><option value=\"大数据\">大数据</option></select><span><input type=\"submit\" name=\"submit\" value=\"马上预约\"></span>" +
                    "</form></div></div></div>");
            FileOutputStream fileOutputStream = new FileOutputStream(subscribesFile);
            fileOutputStream.write(stringBuilder.toString().getBytes());
            fileOutputStream.close();
        }else{
            BufferedReader br = new BufferedReader(new FileReader(subscribesPath));
            while (br.ready()) {
                stringBuilder.append(br.readLine());
            }
            br.close();
        }
        request.getParameter("/file?method=adFile");
    }

    //尾部缓存文件生成
    public void configFile(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String string = "/html/";
        File file = new File(string);
        if(!file.exists()){
            file.mkdirs();
        }

        String subscribes = "config.html";
        String subscribesPath = request.getServletContext().getRealPath(string+subscribes);
        File configFile = new File(subscribesPath);
        StringBuilder stringBuilder = new StringBuilder();
        if(configFile.exists()){
            BufferedReader br = new BufferedReader(new FileReader(subscribesPath));
            while (br.ready()) {
                stringBuilder.append(br.readLine());
            }
            br.close();
        }else{
            ConfigService configService = new ConfigService();
            Map<String,String> map = configService.configAll();
            stringBuilder.append("<div class=\"footer\"><div class=\"footer_box\"><div class=\"footer_left\">\n" +
                    "<p>友情链接：<a href=\"###\">XXXXXXX</a><a href=\"###\">XXXXXX</a><a href=\"###\">XXXXXXXX</a></p>");
            stringBuilder.append(String.format("<p>单位地址：%s</p><p>联系电话：%s</p><p>Q Q号码：%s</p>",map.get("address"),map.get("phone"),map.get("qq")));
            stringBuilder.append("</div><div class=\"footer_right\"><img src=\"static/images/erweima.png\" alt=\"\"><p>关注官方微信</p><p>获取最新学习资料</p>" +
                    "</div></div></div><div class=\"footer_bottom\">");
            stringBuilder.append(String.format("<p>%s</p><p>%s</p><p>%s</p></div>",map.get("icp"),map.get("name"),map.get("banquan")));
            FileOutputStream fileOutputStream = new FileOutputStream(configFile);
            fileOutputStream.write(stringBuilder.toString().getBytes());
            fileOutputStream.close();
        }
    }
}
