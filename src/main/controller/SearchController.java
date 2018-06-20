package controller;

import com.service.CatalogService;
import model.Catalog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SearchController {
    @Autowired
    private CatalogService catalogService;

    @RequestMapping("searchBook")
    public String SearchBook(){
        return "WEB-INF/jsp/search";
    }


    @RequestMapping(value = "/searchCatalog",method = RequestMethod.GET)
    @ResponseBody
    public List<Catalog> SearchCatalogName( @RequestParam("CatalogSelect") Integer CatalogSelect,
                                          @RequestParam("CatalogInput")  String CatalogInput, Model model){
        System.out.println(CatalogSelect+"==="+CatalogInput);

            if (CatalogSelect == 1){
                //查询书名
                Catalog catalog = catalogService.findCatalogByName(CatalogInput);
//                System.out.println(catalog.getCatalogId());
            }else if(CatalogSelect == 2){
                //查询作者
                List<Catalog> catalogs = catalogService.findBookByAuthor(CatalogInput);
                for (Catalog catalog: catalogs
                     ) {
                    System.out.println(catalog.getCatalogId());
                }
                return catalogs;
//
            }

//            model.addAttribute("msg","查到该书籍为"+catalog.getCatalogId());
            return null;
    }



}
