package com.beiyou.servlet;

import com.beiyou.entity.Ad;
import com.beiyou.entity.PageBean;
import com.beiyou.service.AdService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/admin/ad")
@MultipartConfig
public class AdAdmin extends BeanServlet{
    //添加轮播
    public void adAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String url = request.getParameter("url");
        System.out.println(title + url);

        Part part = request.getPart("img");
        String fn = part.getSubmittedFileName();
        String ext = fn.substring(fn.lastIndexOf(".")).toLowerCase();
        //指定上传的路径在哪里

        String path = getServletContext().getRealPath("/uploads/ad/");
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
        String fnn = UUID.randomUUID().toString() + ext;
        part.write(path + fnn);

        AdService adService = new AdService();
        boolean b = adService.insertAdAdd(title, url, fnn);

        response.sendRedirect("/admin/ad?method=adAll");
    }

    //删除轮播
    public void adDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        AdService adService = new AdService();
        adService.deleteAd(id);
        response.sendRedirect("/admin/ad?method=adAll");
    }


    //修改轮播图
    public void adEditor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String url = request.getParameter("url");
        String adimg = request.getParameter("ad");
        System.out.println(adimg);
        AdService adService = new AdService();
        Part part = request.getPart("img");
        if (part.getSize() > 0) {
            String path = getServletContext().getRealPath("/uploads/ad/");
            part.write(path + adimg);
        }
        //修改轮播图
        adService.editorAd(id, title, url);
        response.sendRedirect("/admin/ad?method=adAll");
    }

    //修改轮播图之前回显操作
    public void adEditorId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        AdService adService = new AdService();
        Ad ad = adService.findAdId(id);

        request.setAttribute("ad", ad);
        request.getRequestDispatcher("/admin/adeditor.jsp").forward(request, response);
    }

    //查询轮播图
    public void adAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentPages = request.getParameter("currentPage");
        AdService adService = new AdService();
        if (currentPages == null) {
            currentPages = "1";
        }
        int currentPage = Integer.parseInt(currentPages);
        int currentCount = 5;
        //获取轮播图信息
        PageBean pageBean = adService.findAdAllList(currentPage, currentCount);
        request.setAttribute("pageBean", pageBean);

        request.getRequestDispatcher("/admin/site.jsp").forward(request, response);
    }
}
