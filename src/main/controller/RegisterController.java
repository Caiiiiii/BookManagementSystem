package controller;

import Utils.Md5AddSalt;
import com.service.ReaderService;
import model.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class RegisterController {

    @Autowired
    private ReaderService readerService;


    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String toRegister(){ return "register"; }

    /**
     * 注册个人用户
     * */
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(Reader reader, @RequestParam("readerPhone") Integer readerPhone,
                           @RequestParam("readerName") String readerName,
                           @RequestParam("readerPassword") String readerPassword , Model model, HttpSession session){
        //加密密码
        String saltPassword = Md5AddSalt.getMD5WithSalt(readerPassword);

        reader.setReaderPhone(readerPhone);
        reader.setReaderName(readerName);
        reader.setReaderPassword(saltPassword);

        if (readerService.findReaderByPhone(readerPhone) == null){
            readerService.readerRegister(reader);
            session.setAttribute("readerPhone",readerPhone);
            return "success";
        }else{
            model.addAttribute("msg","此电话号码已存在");
            return "register";
        }


    }
}
