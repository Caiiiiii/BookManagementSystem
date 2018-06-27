package controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.service.AdminService;
import com.service.BookService;
import com.service.CatalogService;
import com.service.OrderService;
import model.Catalog;
import model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private BookService bookService;

    @Autowired
    private CatalogService catalogService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AdminService adminService;


    @RequestMapping(value = "/submitOrder",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject SubmitOrder(Order order, Catalog catalog, @RequestParam("CatalogId") Integer CatalogId,
                                  @RequestParam("borrowTime") Integer borrowTime,
                                  HttpSession session){

//        System.out.println(CatalogId+"==="+borrowTime);           //测试用代码

        //新建JSON对象
        JSONObject jo = new JSONObject();

        //获取session中的readerPhone
        Integer readerPhone = (Integer) session.getAttribute("READERPHONE");
//        System.out.println(readerPhone);
        //通过目录id查找到书籍名
        String CatalogName = catalogService.findBookById(CatalogId);
        //通过目录id查找到随机一本没有被借的书
        Integer bookId = bookService.BookIsBorrowed(CatalogId);
        //若还有书
        if (bookId != null){
            //获取时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c = Calendar.getInstance();
            String beforeTime = df.format(c.getTime());
            c.add(Calendar.MONTH, borrowTime);
            String afterTime = df.format(c.getTime());

            //数据填入
            order.setReaderPhone(readerPhone);
            order.setBookId(bookId);
            order.setCatalogId(CatalogId);
            order.setCatalogName(CatalogName);
//            System.out.println(CatalogName);
            order.setBookLendTime(beforeTime);
            order.setBookReturnTime(afterTime);
            orderService.createOrder(order);

            //修改目录的图书数量
            int newNum = catalogService.findCanLoanNumByCatalogId(CatalogId) - 1;
//            System.out.println("可节约图书为："+newNum);
            catalogService.ChangeCanLoanNum(CatalogId,newNum);

            //修改图书状态
            bookService.ChangeStatusToYes(bookId);
            //填入index为1,表示借阅成功
            jo.put("index",1);
            return jo;
        }
        //填入index为3，表示借阅失败
        jo.put("index",3);
        return jo;
    }

    @RequestMapping("/adoptSubmitOrder")
    public String AdoptOrder(@RequestParam("OrderId") Integer orderId){
        adminService.adpotOrder(orderId);
        return "WEB-INF/jsp/success";
    }

    @RequestMapping(value = "/applyReturnBook",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject applyReturnBook(Integer orderId){
        JSONObject jo = new JSONObject();
        Order order = orderService.findOrderByOrderId(orderId);
        System.out.println(order.getIsAdopt());
        if (order.getIsAdopt().equals("是")) {
            orderService.applyReturnBook(orderId);
            jo.put("index", 1);
        }else if (order.getIsAdopt().equals("否")){
            jo.put("index",2);
        }
        return jo;
    }

    @RequestMapping(value = "/cancelOrder",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject cancelOrder(Integer orderId){

        JSONObject jo = new JSONObject();
          //删除订单
        Order order = orderService.findOrderByOrderId(orderId);
        Integer CatalogId = order.getCatalogId();
        Integer BookId = order.getBookId();

        //修改目录的图书数量
        int newNum = catalogService.findCanLoanNumByCatalogId(CatalogId) + 1;
        catalogService.ChangeCanLoanNum(CatalogId,newNum);

        //修改图书状态
        bookService.ChangeStatusToNo(BookId);

        //删除订单
        orderService.deleteOrder(orderId);

        jo.put("index",1);

         return jo;
    }


    @RequestMapping(value = "/findOrdersNoAdopt",method = RequestMethod.GET)
    @ResponseBody
    public List<Order> findOrdersNoAdopt(){
        List<Order> orders = adminService.findOrdersNoAdopt();
        return orders;
    }

    @RequestMapping(value = "/findOrdersNoReturn",method = RequestMethod.GET)
    @ResponseBody
    public List<Order> findOrdersNoReturn(){
        List<Order> orders = adminService.findOrdersNoReturn();
        return orders;
    }

    @RequestMapping(value = "/confirmAdopt",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject confirmAdopt(Integer orderId){
        adminService.adpotOrder(orderId);
        JSONObject jo = new JSONObject();
        jo.put("index",1);
        return jo;
    }
}
