package dao;

public interface BookDao {
    public Integer BookIsBorrowed(Integer CatalogId);
    public void ChangeStatusToYes(Integer BookId);
    public void ChangeStatusToNo(Integer BookId);
}
