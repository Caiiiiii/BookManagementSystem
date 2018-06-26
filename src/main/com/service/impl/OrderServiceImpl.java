package com.service.impl;

import com.service.OrderService;
import dao.OrderDao;
import model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public boolean createOrder(Order order) {
        return this.orderDao.createOrder(order);
    }

    @Override
    public void deleteOrder(Integer orderId) {
         this.orderDao.deleteOrder(orderId);
    }

    @Override
    public Integer findCatalogIdByOrderId(Integer orderId) {
        return this.orderDao.findCatalogIdByOrderId(orderId);
    }

    @Override
    public Order findOrderByOrderId(Integer orderId) {
        return this.orderDao.findOrderByOrderId(orderId);
    }

    @Override
    public void applyReturnBook(Integer orderId) {
        this.orderDao.applyReturnBook(orderId);
    }
}
