package com.service;

import Vo.OrderVo;
import model.Reader;

public interface ReaderService {
    public Reader findReaderByPhone (Integer readerPhone);
    public boolean findReaderInByPhone (Integer readerphone);
    public OrderVo findOrderByPhone (Integer readerPhone);
    public boolean readerRegister (Reader reader);
    public boolean readerLogin(Reader reader);
    public Reader findReaderInfoByPhone(Integer readerPhone);

}
