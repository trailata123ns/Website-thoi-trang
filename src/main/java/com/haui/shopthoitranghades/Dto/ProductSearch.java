package com.haui.shopthoitranghades.Dto;

public class ProductSearch {
	private int page;
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String keyword;

	public int orderBy;

	public void setOrderBy(int orderBy) {
		this.orderBy = orderBy;
	}

	public String name;

	public String price;
	
	public String title;

	public Integer category_id;

	public Integer getCategory_id() {
		return category_id;
	}

	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getName() {
		return name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getOrderBy() {
		return orderBy;
	}

}
