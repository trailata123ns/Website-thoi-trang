package com.haui.shopthoitranghades.Dto;

import java.math.BigDecimal;

public class CartItem {
	private int productId;
	private String productName;
	private int quanlity;
	private int priceUnit;
	private String productImage;
	private String size;

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

	public int getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(int priceUnit) {
		this.priceUnit = priceUnit;
	}

}
