package controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginUpController {

    @RequestMapping(value = "/loginUp",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject LoginUp(HttpSession session,HttpServletRequest request){
//        System.out.println("注销前："+session.getId());
        request.getSession().invalidate();
//        System.out.println("注销后："+session.getId());

        JSONObject jo = new JSONObject();
        jo.put("index",1);
        return jo;

    }
}
