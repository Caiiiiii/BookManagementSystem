package controller;

import model.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.service.ReaderService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ReaderController {

   @Autowired
   private ReaderService readerService;

   @RequestMapping("/index")
   public String toIndex(){
       return "/index.jsp";
   }

    @RequestMapping("/findReaderByPhone")
    public String findReaderByPhone(@RequestParam("readerPhone") Integer rederPhone, Model model){
         Reader reader = readerService.findReaderByPhone(rederPhone);
         model.addAttribute("reader",reader);
         return "WEB-INF/jsp/reader";
    }

    //获取该用户的session
    @RequestMapping(value = "/findReaderPhoneBySession",method = RequestMethod.GET)
    @ResponseBody
    public Reader findReaderPhoneBySession(Reader reader,HttpServletRequest request){
        HttpSession session = request.getSession();
//        System.out.println(session.getId());
        //获取session中该用户的值
        Integer readerPhone = (Integer) session.getAttribute("READERPHONE");
        String readerName = (String)session.getAttribute("READERNAME");
//        System.out.println(readerPhone+"==="+readerName);
        //如果不为空值 就赋值返回对象
        if (readerName != null && readerName != ""){
            reader.setReaderPhone(readerPhone);
            reader.setReaderName(readerName);
           return reader;
        }
        else{
            return  null;
        }
    }


}
