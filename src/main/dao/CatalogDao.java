package dao;

import model.Catalog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CatalogDao {
    /**通过id查找书本*/
    public String findBookById(Integer catalogId);
    /**通过目录id查找到目录对象*/
    public Catalog findCatalogById(Integer catalogId);
    /**通过目录名查找到目录集合*/
    public List<Catalog> findCatalogByName(String catalogName);
    /**通过作者查找到目录集合*/
    public List<Catalog> findBookByAuthor(String catalogAuthor);
    /**修改可借阅数目*/
    public void ChangeCanLoanNum(Integer catalogId, Integer catalogCanLoan);
    /**查找可借阅数目*/
    public Integer findCanLoanNumByCatalogId(Integer catalogId);
}
