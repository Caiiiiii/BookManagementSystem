package dao;

public interface BookDao {
    public Integer BookIsBorrowed(Integer CatalogId);
    public void ChangeStatus(Integer BookId);
}
