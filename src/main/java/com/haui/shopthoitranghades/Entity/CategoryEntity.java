package com.haui.shopthoitranghades.Entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tbl_category")
public class CategoryEntity extends BaseEntity {
    @Column(name = "name", length = 100, nullable = false)
    private String name;

    @Column(name = "description", length = 100, nullable = false)
    private String description;

	@Column(name ="parent_id", nullable = true)
	private Integer parentId;

    @Column(name = "seo", length = 1000, nullable = true)
    private String seo;

    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY, mappedBy = "categories")
    private Set<ProductsEntity> products = new HashSet<ProductsEntity>();

    /**
     * them  1 san pham vao danh sach @OneToMany
     * @param product
     */
    public void addRelationProduct(ProductsEntity product) {
        products.add(product);
        product.setCategories(this);
    }

    /**
     * xoa san pham khoi danh sach @OneToMany
     * @param product
     */
    public void deleteRelationProduct(ProductsEntity product) {
        products.remove(product);
        product.setCategories(null);
    }

    public Set<ProductsEntity> getProducts() {
        return products;
    }

    public void setProducts(Set<ProductsEntity> products) {
        this.products = products;
    }

    public String getName() {
        return this.name;

    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSeo() {
        return this.seo;
    }

    public void setSeo(String seo) {
        this.seo = seo;
    }
}
