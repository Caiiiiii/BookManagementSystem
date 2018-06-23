package com.service;

import model.Catalog;

import java.util.List;

public interface CatalogService {
    public String findBookById(Integer CatalogId);
    public Catalog findCatalogById(Integer catalogId);
    public List<Catalog> findCatalogByName(String catalogName);
    public List<Catalog> findBookByAuthor(String catalogAuthor);
    public void ChangeCanLoanNum(Integer catalogId,Integer catalogCanLoan);
    public Integer findCanLoanNumByCatalogId(Integer catalogId);
}
