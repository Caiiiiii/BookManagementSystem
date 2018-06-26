package dao;

import model.Order;

public interface OrderDao {
    public boolean createOrder(Order order);
    public void deleteOrder(Integer orderId);
    public Integer findCatalogIdByOrderId(Integer orderId);
    public Order findOrderByOrderId(Integer orderId);
    public void applyReturnBook(Integer orderId);
}
