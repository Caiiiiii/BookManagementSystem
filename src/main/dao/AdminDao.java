package dao;

import Vo.OrderVo;

public interface AdminDao {
    public OrderVo findOrdersByPhone(Integer readerPhone);
}
