package com.service;

import model.Catalog;

import java.util.List;

public interface CatalogService {
    public Catalog findBookByName(String catalogName);
    public List<Catalog> findBookByAuthor(String catalogAuthor);
}
