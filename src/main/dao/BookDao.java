package dao;

public interface BookDao {
    public Integer BookIsBorrowed(String CatalogName);
    public void ChangeStatus(Integer BookId);
}
