package dao;

import model.Catalog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CatalogDao {
    public String findBookById(Integer catalogId);
    public Catalog findCatalogById(Integer catalogId);
    public List<Catalog> findCatalogByName(String catalogName);
    public List<Catalog> findBookByAuthor(String catalogAuthor);
    public void ChangeCanLoanNum(Integer catalogId, Integer catalogCanLoan);
    public Integer findCanLoanNumByCatalogId(Integer catalogId);
}
