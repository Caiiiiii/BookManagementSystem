package dao;

import model.Catalog;

import java.util.List;

public interface CatalogDao {
    public Catalog findBookByName(String catalogName);
    public List<Catalog> findBookByAuthor(String catalogAuthor);
}
