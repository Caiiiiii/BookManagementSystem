package Interceptor;

import model.Reader;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {
        String url  = request.getRequestURI();
        if(url.indexOf("/login")>=0 || url.indexOf("/register")>=0){
            return true;
        }

        HttpSession session = request.getSession();
        Reader reader  = (Reader)session.getAttribute("READER_SESSION");

        if (reader != null){
            return true;
        }

        request.setAttribute("msg","你还没有登录，请登录！");
        System.out.println("你还没有登录，请登录！");
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

    }
}
