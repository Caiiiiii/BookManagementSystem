package controller;

import model.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.service.ReaderService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReaderController {

   @Autowired
   private ReaderService readerService;

    @RequestMapping("/findReaderByPhone")
    public String findReaderByPhone(@RequestParam("readerPhone") Integer rederPhone, Model model){
         Reader reader = readerService.findReaderByPhone(rederPhone);
         model.addAttribute("reader",reader);
         return "reader";
    }


}
