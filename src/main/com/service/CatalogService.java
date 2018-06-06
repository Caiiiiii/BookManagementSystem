package com.service;

import model.Catalog;

public interface CatalogService {
    public Catalog findBookByName(String catalogName);
}
