package com.service;

import Vo.OrderVo;
import model.Order;

import java.util.List;

public interface AdminService {
    public List<Order> findOrdersByPhone(Integer readerPhone);
    public void adpotOrder(Integer orderId);
    public List<Order> findOrdersNoAdopt();
    public List<Order> findOrdersNoReturn();
    public List<Order> findOrdersByPhoneAndAdopt(Integer readerPhone);
}
