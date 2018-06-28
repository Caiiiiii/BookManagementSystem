package com.service.impl;

import Vo.OrderVo;
import com.service.AdminService;
import dao.AdminDao;
import model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public List<Order> findOrdersByPhone(Integer readerPhone) {
        List<Order> order = adminDao.findOrdersByPhone(readerPhone);
        return order;
    }

    @Override
    public void adpotOrder(Integer orderId) {
        this.adminDao.adpotOrder(orderId);
    }

    @Override
    public List<Order> findOrdersNoAdopt() {
        return this.adminDao.findOrdersNoAdopt();
    }

    @Override
    public List<Order> findOrdersNoReturn() {
        return this.adminDao.findOrdersNoReturn();
    }

    @Override
    public List<Order> findOrdersByPhoneAndAdopt(Integer readerPhone) {
        return this.adminDao.findOrdersByPhoneAndAdopt(readerPhone);
    }
}
