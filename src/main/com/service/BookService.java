package com.service;

public interface BookService {
    public Integer BookIsBorrowed(Integer CatalogId);
    public void ChangeStatus(Integer BookId);
}
