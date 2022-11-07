package com.haui.shopthoitranghades.Entity;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;


@Entity
@Table(name ="tbl_products")
public class ProductsEntity extends BaseEntity{

	@NotNull(message = "Tiêu đề không được trống")
	@Column(name ="title", length = 1000, nullable = false)
	private String title;

	@NotNull(message = "Giá bán không được trống")
	@Column(name = "price",precision = 13, scale = 2,  nullable = false)
	private int price;

	@NotNull(message = "Giá sale không được trống")
	@Column(name = "price_sale",precision = 13, scale = 2,  nullable = false)
	private int priceSale;

	@NotNull(message = "Mô tả không được trống")
	@Column(name ="short_description", length = 1000, nullable = false)
	private String shortDescription;

	@NotNull(message = "Mô tả không được trống")
	@Lob // Kiểu long text
	@Column(name = "detail_description", nullable = false, columnDefinition = "LONGTEXT")
	private String details;
	
	@Column(name ="avatar", length = 200, nullable = true)
	private String avatar;
	
	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	
	@Column(name = "is_hot", nullable = false)
	private Boolean isHot = Boolean.TRUE;

	@Column(name ="size", nullable = true)
	private String size;

	@NotNull(message = "Số lượng không được trống")
	@Column(name ="quantity", nullable = false)
	private int quantity;


	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id") // Tên khóa phụ trong bảng products
	private CategoryEntity categories; // đây là cái mappedBy
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY, mappedBy = "productsEntity")
	private Set<ProductsImagesEntity> productsImages = new HashSet<ProductsImagesEntity>();
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY, mappedBy = "product")
	//Cái giá trị mappedBy sẽ được lấy theo cái tên bên class product
	private Set<SaleOrderProductsEntity> sale = new HashSet<SaleOrderProductsEntity>();
	
	public Set<ProductsImagesEntity> getProductsImages() {
		return productsImages;
	}

	public void setProductsImages(Set<ProductsImagesEntity> productsImages) {
		this.productsImages = productsImages;
	}
	

	public Set<SaleOrderProductsEntity> getSale() {
		return sale;
	}

	public void setSale(Set<SaleOrderProductsEntity> sale) {
		this.sale = sale;
	}
	public void addRelationProduct2(SaleOrderProductsEntity saleOrderProduct) {
		sale.add(saleOrderProduct);
		saleOrderProduct.setProduct(this);
	}

	/**
	 * xoa san pham khoi danh sach @OneToMany
	 * @param
	 */
	public void deleteRelationProduct2(SaleOrderProductsEntity saleOrderProduct) {
		sale.remove(saleOrderProduct);
		saleOrderProduct.setProduct(null);
	}
	
	
	public void addRelationProduct(ProductsImagesEntity product) {
		productsImages.add(product);
		product.setProductsEntity(this);
	}

	/**
	 * xoa san pham khoi danh sach @OneToMany
	 * @param product
	 */
	public void deleteRelationProduct(ProductsImagesEntity product) {
		productsImages.remove(product);
		product.setProductsEntity(null);
	}
	
	
	public CategoryEntity getCategories() {
		return categories;
	}

	public void setCategories(CategoryEntity categories) {
		this.categories = categories;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(int priceSale) {
		this.priceSale = priceSale;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public Boolean getHot() {
		return isHot;
	}

	public void setHot(Boolean hot) {
		isHot = hot;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
	private List<ReviewEntity> reviews = new ArrayList<>();

	public void addReview(ReviewEntity review) {
		reviews.add(review);
		review.setProduct(this);
	}

	public void removeReview(ReviewEntity review) {
		reviews.remove(review);
		review.setProduct(null);
	}
	
}
