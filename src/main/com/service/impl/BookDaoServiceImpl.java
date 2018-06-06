package com.service.impl;

import com.service.BookDaoService;
import com.sun.deploy.panel.ITreeNode;
import com.sun.org.apache.bcel.internal.util.ByteSequence;
import dao.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class BookDaoServiceImpl implements BookDaoService {

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
