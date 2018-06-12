package controller;

import Utils.Md5AddSalt;
import com.service.ReaderService;
import model.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private ReaderService readerService;

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String toLogin(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("privatePage", request.getHeader("Referer"));
        return "login";
    }
    /**
     * 登录验证
     * */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(Reader reader, @RequestParam("readerPhone") Integer readerPhone,
                        @RequestParam("readerPassword") String readerPassword,
                        Model model, HttpServletRequest request, HttpSession session ){

        reader = readerService.findReaderByPhone(readerPhone);
        String saltPassword = Md5AddSalt.getMD5WithSalt(readerPassword);
        Object privatePage = session.getAttribute("privatePage");

        if(reader != null && reader.getReaderPassword().equals(saltPassword)){
            if(reader.getReaderLevel() == 2)
            //跳转到普通用户界面
            session.setAttribute("READER",reader);
            {  return "redirect:"+privatePage.toString();   }
        }else if (reader.getReaderLevel() == 1){
            //跳转到管理员管理页面
            session.setAttribute("READER",reader);
            return "success";
        }

        model.addAttribute("msg","账号密码错误");
        return "login";
    }
}
