package dao;

public interface BookDao {
    /**查找书是否被借了*/
    public Integer BookIsBorrowed(Integer CatalogId);
    /**改变状态为是*/
    public void ChangeStatusToYes(Integer BookId);
    /**改变状态为否*/
    public void ChangeStatusToNo(Integer BookId);
}
