package controller;

import com.alibaba.fastjson.JSONObject;
import com.service.AdminService;
import model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ShoppingCartController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/confirmIsLogin",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject confirmIsLogin(HttpSession session){
        //创建json对象
        JSONObject jo = new JSONObject();
        if (session.getAttribute("READERPHONE") != null){
            jo.put("index",1);
            return jo;
        }else{
            jo.put("index",3);
            return jo;
        }
    }

    @RequestMapping(value = "/toShoppingCart")
    public String toShoppingCart(){
        return "WEB-INF/jsp/shoppingCart";
    }

    @RequestMapping("/adminSearchOrders")
    public String adminSearchOrder(){
        return "WEB-INF/jsp/admin";
    }

    @RequestMapping(value = "/findOrdersByPhone",method = RequestMethod.POST)
    public List<Order> findOrderByPhone(@RequestParam("readerPhone") Integer readerPhone){
       List<Order> orders = adminService.findOrdersByPhone(readerPhone);
        for (Order order: orders
             ) {
            System.out.println(order.getOrderId());
        }
        if (orders.size() > 0){
            return orders;
        }else{
            return null;
        }
    }
}
