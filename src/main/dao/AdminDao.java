package dao;

import Vo.OrderVo;
import model.Order;

import java.util.List;

public interface AdminDao {
    /**通过手机号查找订单*/
    public List<Order> findOrdersByPhone(Integer readerPhone);
    /**允许订单*/
    public void adpotOrder(Integer orderId);
    /**查找未同意的订单*/
    public List<Order> findOrdersNoAdopt();
    /**查找申请退书的订单*/
    public List<Order> findOrdersNoReturn();
    /**同意订单申请*/
    public void confirmAdopt(Integer orderId);
    /**查找同意且某人的订单详情*/
    public List<Order> findOrdersByPhoneAndAdopt(Integer readerPhone);
}
