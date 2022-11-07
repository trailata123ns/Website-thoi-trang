package com.haui.shopthoitranghades.Dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Cart {

	private int totalPrice;
	private List<CartItem> cartItems = new ArrayList<CartItem>();

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

}
