package com.service.impl;

import Vo.OrderVo;
import dao.ReaderDao;
import model.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.service.ReaderService;
import javax.transaction.Transactional;

@Service
@Transactional
public class ReaderServiceImpl implements ReaderService {

    @Autowired
    private ReaderDao readerDao;

    @Override
    public Reader findReaderByPhone(Integer readerPhone) {
        return this.readerDao.findReaderByPhone(readerPhone);
    }

    @Override
    public boolean findReaderInByPhone(Integer readerphone) {
        return this.readerDao.findReaderInByPhone(readerphone);
    }

    @Override
    public OrderVo findOrderByPhone(Integer readerPhone) {
        return null;
    }

    @Override
    public boolean readerRegister(Reader reader) {
        return this.readerDao.readerRegister(reader);
}

    @Override
    public boolean readerLogin(Reader reader) {
        return true;
    }
}
