package com.service;

public interface BookDaoService {
    public Integer BookIsBorrowed(String CatalogName);
    public void ChangeStatus(Integer BookId);
}
