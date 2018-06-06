package com.service.impl;

import com.service.CatalogService;
import dao.CatalogDao;
import dao.ReaderDao;
import model.Catalog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class CatalogServiceImpl implements CatalogService {

    @Autowired
    private CatalogDao catalogDao;

    @Override
    public Catalog findBookByName(String catalogName) {
        return this.catalogDao.findBookByName(catalogName);
    }
}
