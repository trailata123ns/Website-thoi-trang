package com.haui.shopthoitranghades.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "tbt_reviews")

public class ReviewEntity extends BaseEntity {

	@Column(name = "content", length = 1000, nullable = false)
	private String content;

	@Column(name = "number_star", nullable = false)
	private Integer numberStar;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private ProductsEntity product;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer_id")
	private UserEntity user;

	public ReviewEntity() {

	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getNumberStar() {
		return numberStar;
	}

	public void setNumberStar(Integer numberStar) {
		this.numberStar = numberStar;
	}

	public ProductsEntity getProduct() {
		return product;
	}

	public void setProduct(ProductsEntity product) {
		this.product = product;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public ReviewEntity(String content, Integer numberStar, ProductsEntity product, UserEntity user) {
		this.content = content;
		this.numberStar = numberStar;
		this.product = product;
		this.user = user;
	}
}
