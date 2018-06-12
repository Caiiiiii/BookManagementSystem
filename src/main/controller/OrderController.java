package controller;

import com.service.AdminService;
import com.service.BookService;
import com.service.OrderService;
import model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@Controller
public class OrderController {

    @Autowired
    private BookService bookService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AdminService adminService;


    @RequestMapping("/submitOrder")
    public String SubmitOrder(Order order, @RequestParam("CatalogName") String CatalogName,
                              @RequestParam("borrowTime") Integer borrowTime,
                              Model model , HttpSession session){
        Integer readerPhone = (Integer) session.getAttribute("readerPhone");

        Integer bookId = bookService.BookIsBorrowed(CatalogName);
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
            order.setBookLendTime(beforeTime);
            order.setBookReturnTime(afterTime);
            orderService.createOrder(order);

            //修改图书状态
            bookService.ChangeStatus(bookId);
            return "success";
        }
        model.addAttribute("msg1","借阅失败");
        return "search";
    }

    @RequestMapping("/adoptSubmitOrder")
    public String AdoptOrder(@RequestParam("OrderId") Integer orderId){
        adminService.adpotOrder(orderId);
        return "success";
    }

}
