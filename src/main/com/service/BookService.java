package com.service;

public interface BookService {
    public Integer BookIsBorrowed(String CatalogName);
    public void ChangeStatus(Integer BookId);
}
