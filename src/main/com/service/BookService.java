package com.service;

public interface BookService {
    public Integer BookIsBorrowed(Integer CatalogId);
    public void ChangeStatusToYes(Integer BookId);
    public void ChangeStatusToNo(Integer BookId);
}
