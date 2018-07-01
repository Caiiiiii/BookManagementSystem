package model;

public class Order {
    private Integer OrderId;
    private Integer BookId;
    private Integer CatalogId;
    private String CatalogName;
    private String CatalogAuthor;
    private String CatalogPublisher;
    private String CatalogPublishTime;
    private Integer ReaderPhone;
    private String ReaderName;
    private String BookLendTime;
    private String BookReturnTime;
    private String isAdopt;
    private Integer applyReturn;

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

    public Integer getCatalogId() {
        return CatalogId;
    }

    public void setCatalogId(Integer catalogId) {
        CatalogId = catalogId;
    }

    public String getIsAdopt() {
        return isAdopt;
    }

    public void setIsAdopt(String isAdopt) {
        this.isAdopt = isAdopt;
    }

    public Integer getApplyReturn() {
        return applyReturn;
    }

    public void setApplyReturn(Integer applyReturn) {
        this.applyReturn = applyReturn;
    }

    public String getCatalogName() {
        return CatalogName;
    }

    public void setCatalogName(String catalogName) {
        CatalogName = catalogName;
    }

    public String getReaderName() {
        return ReaderName;
    }

    public void setReaderName(String readerName) {
        ReaderName = readerName;
    }

    public String getCatalogAuthor() {
        return CatalogAuthor;
    }

    public void setCatalogAuthor(String catalogAuthor) {
        CatalogAuthor = catalogAuthor;
    }

    public String getCatalogPublisher() {
        return CatalogPublisher;
    }

    public void setCatalogPublisher(String catalogPublisher) {
        CatalogPublisher = catalogPublisher;
    }

    public String getCatalogPublishTime() {
        return CatalogPublishTime;
    }

    public void setCatalogPublishTime(String catalogPublishTime) {
        CatalogPublishTime = catalogPublishTime;
    }
}
