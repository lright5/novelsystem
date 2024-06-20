package com.xh.controller;

import com.xh.dto.ResultData;
import com.xh.pojo.Admin;
import com.xh.pojo.Author;
import com.xh.pojo.Reader;
import com.xh.service.AdminService;
import com.xh.service.AuthorService;
import com.xh.service.BookService;
import com.xh.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

    @Autowired
    private AuthorService authorService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private BookService bookService;


    @Autowired
    private ReaderService readerService;

    /**
     * 登陆页面
     * @return
     */
    @RequestMapping("/loginPage")
    public String loginPage(){
        return "login";
    }






    /**
     * 登陆操作
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody// 该方法返回的是json字符串
    public ResultData login(Admin admin,HttpServletRequest request){
        request.getSession().setAttribute("currentLoginAuthorId", null);
        // 登陆操作
        ResultData resultData = adminService.login(admin);
        // 判断登陆成功,将用户数据保存到 session中
        // 如何获取session对象?
        if(resultData.getCode() == 200){
            HttpSession session = request.getSession();
            session.setAttribute("admin",resultData.getData());
        }

        return resultData;
    }

    @RequestMapping("/zuozhe")
    public String duzhe() {
        return "loginauthor";
    }

    @RequestMapping("/loginauthor")
    @ResponseBody
    public ResultData login2(Author author, HttpServletRequest request) {
        ResultData resultData = authorService.login2(author);

        try {
            if (resultData.getData() instanceof Author) {
                request.getSession().setAttribute("currentLoginAuthorId", ((Author) resultData.getData()).getAuthorId());
            } else {
                request.getSession().setAttribute("currentLoginAuthorId", null);
            }
            System.out.println("当前登录的作者ID：" + request.getSession().getAttribute("currentLoginAuthorId"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultData;
    }

    @RequestMapping("/loginreader")
    @ResponseBody

    public ResultData login1(Reader reader,HttpServletRequest request){

        request.getSession().setAttribute("currentLoginAuthorId", null);
        // 登陆操作
        ResultData resultData = readerService.login1(reader);
        // 判断登陆成功,将用户数据保存到 session中
        // 如何获取session对象?
        if(resultData.getCode() == 200){
            HttpSession session = request.getSession();
//                System.out.println("\n\n\n\nSession中的Reader：" + session.getAttribute("reader")+"\n\n\n\n");
            session.setAttribute("reader",resultData.getData());

        }
        return resultData;
    }


    @RequestMapping("/rloginPage")
    public String rloginPage(){
        return "front/register";
    }


    /**
     * 退出登陆的方法
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        // 只需要去将保存到session的数据干掉即可
        request.getSession().setAttribute("admin",null);

        // 重定向和转发的区别?
        // 重定向: 1. 客户端行为 2. 两次请求 3. 不能携带前一次请求的数据
        // 转发: 1. 服务器端行为 2. 一次请求 3. 能够携带前一次请求的数据
        return "redirect:/loginPage";
    }
}
