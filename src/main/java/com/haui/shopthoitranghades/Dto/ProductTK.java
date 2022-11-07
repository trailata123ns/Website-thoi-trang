package com.haui.shopthoitranghades.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

public class ProductTK {
    private int productId;
    private String productImage;
    private String productName;
    private int quantity;
    private int price;
    private int total;
    private Date createdDate;

    public ProductTK() {

    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public ProductTK(int productId, String productImage, String productName, int quantity, int price, int total, Date createdDate) {
        this.productId = productId;
        this.productImage = productImage;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
        this.total = total;
        this.createdDate = createdDate;
    }
}
