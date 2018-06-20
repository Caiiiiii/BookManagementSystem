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
public class RegisterController {

    @Autowired
    private ReaderService readerService;


    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String toRegister(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("privatePage", request.getHeader("Referer"));
        return "WEB-INF/jsp/register";
    }

    /**
     * 注册个人用户
     * */
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject register(Reader reader, @RequestParam("readerPhone") Integer readerPhone,
                               @RequestParam("readerName") String readerName,
                               @RequestParam("readerPassword") String readerPassword , HttpSession session){
        //加密密码
        String saltPassword = Md5AddSalt.getMD5WithSalt(readerPassword);

        //创建json对象
        JSONObject jo = new JSONObject();
        //获取前一个页面的链接
        Object privatePage =  session.getAttribute("privatePage");
        //判断该电话号码是否存在
        if (readerService.findReaderByPhone(readerPhone) == null){

            //填写入数据库
            reader.setReaderPhone(readerPhone);
            reader.setReaderName(readerName);
            reader.setReaderPassword(saltPassword);
            readerService.readerRegister(reader);

            //添加该用户的session
            session.setAttribute("readerPhone",readerPhone);
            //放入json
            jo.put("index",1);
            jo.put("url",privatePage.toString());
            return jo;
        }else{
            //index为3时,'电话已经存在'
            jo.put("index",3);
            return jo;
        }


    }
}
