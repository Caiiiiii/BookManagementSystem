package model;

public class Order {
    private  Integer OrderId;
    private Integer BookId;
    private String CatalogName;
    private Integer ReaderPhone;
    private String BookLendTime;
    private String BookReturnTime;

    public Integer getOrderId() {
        return OrderId;
    }

    public void setOrderId(Integer orderId) {
        OrderId = orderId;
    }

    public Integer getBookId() {
        return BookId;
    }

    public void setBookId(Integer bookId) {
        BookId = bookId;
    }

    public Integer getReaderPhone() {
        return ReaderPhone;
    }

    public void setReaderPhone(Integer readerPhone) {
        ReaderPhone = readerPhone;
    }

    public String getBookLendTime() {
        return BookLendTime;
    }

    public void setBookLendTime(String bookLendTime) {
        BookLendTime = bookLendTime;
    }

    public String getBookReturnTime() {
        return BookReturnTime;
    }

    public void setBookReturnTime(String bookReturnTime) {
        BookReturnTime = bookReturnTime;
    }

    public String getCatalogName() {
        return CatalogName;
    }

    public void setCatalogName(String catalogName) {
        CatalogName = catalogName;
    }
}
