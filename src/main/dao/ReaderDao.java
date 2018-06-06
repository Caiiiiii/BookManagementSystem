package dao;

import Vo.OrderVo;
import model.Reader;

public interface ReaderDao {
    /**
     * 通过手机号码查询到该用户信息
     * */
    public Reader findReaderByPhone (Integer readerPhone);

    public boolean findReaderInByPhone (Integer readerphone);
    /**
     * 通过手机号查询到该用户的所有订单
     * */
    public OrderVo findOrderByPhone (Integer readerPhone);
    /**
     * 注册
     * */
    public boolean readerRegister (Reader reader);
    /**
     * 登录
     * */
    public boolean readerLogin(Reader reader);

}
