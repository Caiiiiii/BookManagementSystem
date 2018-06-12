package controller;

import Vo.OrderVo;
import com.service.AdminService;
import model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ShoppingCartController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/adminSearchOrders")
    public String adminSearchOrder(){
        return "admin";
    }

    @RequestMapping("/findOrdersByPhone")
    public String findOrderByPhone(@RequestParam("readerPhone") Integer readerPhone){
       List<Order> orders = adminService.findOrdersByPhone(readerPhone);
        for (Order order: orders
             ) {
            System.out.println(order.getOrderId());
        }
         return "admin" ;
    }
}
