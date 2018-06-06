package dao;

import model.Catalog;

public interface CatalogDao {
    public Catalog findBookByName(String catalogName);
}
