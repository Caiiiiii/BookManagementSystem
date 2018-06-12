package dao;

import model.Catalog;

import java.util.List;

public interface CatalogDao {
    public String findBookById(Integer catalogId);
    public Catalog findCatalogByName(String catalogName);
    public List<Catalog> findBookByAuthor(String catalogAuthor);
}
