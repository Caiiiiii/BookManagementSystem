package com.service.impl;

import com.service.CatalogService;
import dao.CatalogDao;
import dao.ReaderDao;
import model.Catalog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class CatalogServiceImpl implements CatalogService {

    @Autowired
    private CatalogDao catalogDao;

    @Override
    public String findBookById(Integer CatalogId) {
        return this.catalogDao.findBookById(CatalogId);
    }

    @Override
    public Catalog findCatalogById(Integer catalogId) {
        return this.catalogDao.findCatalogById(catalogId);
    }

    @Override
    public List<Catalog> findCatalogByName(String catalogName) {
        return this.catalogDao.findCatalogByName(catalogName);
    }

    @Override
    public List<Catalog> findBookByAuthor(String catalogAuthor) {
        List<Catalog> catalog = this.catalogDao.findBookByAuthor(catalogAuthor);
        return catalog;
    }

    @Override
    public void ChangeCanLoanNum(Integer catalogId,Integer catalogCanLoan) {
        this.catalogDao.ChangeCanLoanNum(catalogId,catalogCanLoan);
    }

    @Override
    public Integer findCanLoanNumByCatalogId(Integer catalogId) {
        return this.catalogDao.findCanLoanNumByCatalogId(catalogId);
    }
}
