package com.service.impl;

import com.service.BookService;
import dao.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    @Override
    public Integer BookIsBorrowed(String CatalogName) {
        return this.bookDao.BookIsBorrowed(CatalogName);
    }

    @Override
    public void ChangeStatus(Integer BookId) {
         this.bookDao.ChangeStatus(BookId);
    }
}
