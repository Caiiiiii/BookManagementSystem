package dao;

import Vo.OrderVo;
import model.Order;

import java.util.List;

public interface AdminDao {
    public List<Order> findOrdersByPhone(Integer readerPhone);
    public void adpotOrder(Integer orderId);
    public List<Order> findOrdersNoAdopt();
    public List<Order> findOrdersNoReturn();
    public void confirmAdopt(Integer orderId);
}
