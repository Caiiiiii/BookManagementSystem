package com.service;

import model.Catalog;

import java.util.List;

public interface CatalogService {
    public String findBookById(Integer CatalogId);
    public Catalog findCatalogByName(String catalogName);
    public List<Catalog> findBookByAuthor(String catalogAuthor);
}
