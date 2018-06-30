package dao;

import model.Order;

public interface OrderDao {
    /**新建订单*/
    public boolean createOrder(Order order);
    /**删除订单*/
    public void deleteOrder(Integer orderId);
    /**通过订单号查找到书目录*/
    public Integer findCatalogIdByOrderId(Integer orderId);
    /**通过订单号查找到订单*/
    public Order findOrderByOrderId(Integer orderId);
    /**申请还书*/
    public void applyReturnBook(Integer orderId);
}
