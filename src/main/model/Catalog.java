package model;

public class Catalog {
    private Integer CatalogId;
    private String CatalogAuthor;
    private String CatalogName;
    private String CatalogPublisher;
    private String CatalogPublishTime;
    private Integer CatalogCanLoan;
    private Integer CatalogHadNum;

    public Integer getCatalogHadNum() {
        return CatalogHadNum;
    }

    public void setCatalogHadNum(Integer catalogHadNum) {
        CatalogHadNum = catalogHadNum;
    }

    public Integer getCatalogId() {
        return CatalogId;
    }

    public void setCatalogId(Integer catalogId) {
        CatalogId = catalogId;
    }

    public String getCatalogAuthor() {
        return CatalogAuthor;
    }

    public void setCatalogAuthor(String catalogAuthor) {
        CatalogAuthor = catalogAuthor;
    }

    public String getCatalogName() {
        return CatalogName;
    }

    public void setCatalogName(String catalogName) {
        CatalogName = catalogName;
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

    public Integer getCatalogCanLoan() {
        return CatalogCanLoan;
    }

    public void setCatalogCanLoan(Integer catalogCanLoan) {
        CatalogCanLoan = catalogCanLoan;
    }
}
