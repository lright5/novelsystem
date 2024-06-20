package com.xh.interceptor;

import com.xh.pojo.Admin;
import com.xh.pojo.Author;
import com.xh.pojo.Reader;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginInterceptor implements HandlerInterceptor {
    /**
     *
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return  true:放行, false: 拦截不放行
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        // 先去获取session对象
//       HttpSession session = httpServletRequest.getSession();
//        // 判断session对象中是否保存了 登陆的用户信息?
//        Admin admin = (Admin) session.getAttribute("admin");
//        Reader reader = (Reader) session.getAttribute("reader");
//        Author author = (Author) session.getAttribute("author");
//        String requestURI = httpServletRequest.getRequestURI();
//        if (AllowedWithoutLogin(requestURI)) {
//            return true;
//        }
//        if(admin == null&&reader == null&&author == null){
//            // session中没有 用户登陆的信息
//            // 重定向到 登陆页面
//            // 如何重定向呢?
//            String contextPath = httpServletRequest.getContextPath();
//            httpServletResponse.sendRedirect(contextPath+"/book/getByType?bookType=1");
//            return false;
//        }

        return true;
    }



//    private boolean AllowedWithoutLogin(String requestURI) {
//        // 在这里添加允许未登录访问的页面URL
//        String[] allowedURIs = {"/book/getByType","/shiduPage","/duzhe","/loginPage","/zuozhe","/novelPage"};
//        for (String allowedURI : allowedURIs) {
//            if (requestURI.contains(allowedURI)) {
//                return true;
//            }
//        }
//        return false;
//    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
