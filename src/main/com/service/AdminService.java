package com.service;

import Vo.OrderVo;
import model.Order;

import java.util.List;

public interface AdminService {
    public List<Order> findOrdersByPhone(Integer readerPhone);
    public void adpotOrder(Integer orderId);
    public List<Order> findOrdersNoAdopt();
}
