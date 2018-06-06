package model;

public class Book {
    private Integer BookId;
    private Integer BookBorrowStatus;
    private Integer CatalogId;

    public Integer getBookId() {
        return BookId;
    }

    public void setBookId(Integer bookId) {
        BookId = bookId;
    }

    public Integer getBookBorrowStatus() {
        return BookBorrowStatus;
    }

    public void setBookBorrowStatus(Integer bookBorrowStatus) {
        BookBorrowStatus = bookBorrowStatus;
    }

    public Integer getCatalogId() {
        return CatalogId;
    }

    public void setCatalogId(Integer catalogId) {
        CatalogId = catalogId;
    }
}
