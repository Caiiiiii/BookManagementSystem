package controller;

import com.service.CatalogService;
import model.Catalog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
    @Autowired
    private CatalogService catalogService;

    @RequestMapping("searchBook")
    public String SearchBook(){
        return "search";
    }
    @RequestMapping("/searchCatalogName")
    public String SearchCatalogName(@RequestParam("CatalogName") String CatalogName, Model model){
            Catalog catalog = catalogService.findBookByName(CatalogName);
            model.addAttribute("msg","查到该书籍为"+catalog.getCatalogId());
            return "search";
    }

}
