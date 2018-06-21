package controller;

import Utils.Md5AddSalt;
import com.alibaba.fastjson.JSONObject;
import com.service.ReaderService;
import model.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        return "WEB-INF/jsp/login";
    }
    /**
     * 登录验证
     * */


    @RequestMapping(value = "/loginIn",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject login(@RequestParam("readerPhone") Integer readerPhone,
                            @RequestParam("readerPassword") String readerPassword,
                            HttpSession session, Reader reader){
        //创建json对象
        JSONObject jo = new JSONObject();
        //查找是否有该用户
        reader = readerService.findReaderByPhone(readerPhone);
        //密码加密
        String saltPassword = Md5AddSalt.getMD5WithSalt(readerPassword);
        //前一个页面的地址
        Object privatePage = session.getAttribute("privatePage");
        //判断用户是否存在或者密码是否正确
        if(reader != null && reader.getReaderPassword().equals(saltPassword)){
            //跳转到普通用户界面
            if(reader.getReaderLevel() == 2){
             //session中添加reader信息
             session.setAttribute("READERPHONE",readerPhone);
             session.setAttribute("READERNAME",reader.getReaderName());
             //将url放入JSONObject中
             jo.put("index",1);
             jo.put("url",privatePage.toString());
             return jo;
            }
            //跳转到管理员页面
            else if (reader.getReaderLevel() == 1){
            session.setAttribute("READER",reader);
            jo.put("index",2);
            return null;
            }

        }
        //index 为3的时候 ‘账号或密码错误’;
        jo.put("index",3);
        return jo;
    }
}
