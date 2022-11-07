package com.haui.shopthoitranghades.Responsitory;

import com.haui.shopthoitranghades.Entity.ProductsEntity;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface ProductResponsitory extends PagingAndSortingRepository<ProductsEntity,Integer> {
    List<ProductsEntity> findTop8ByOrderByCreatedDateDesc();

    List<ProductsEntity> findTop8ByIsHot(Boolean isHot);

    ProductsEntity findBySeo(String seo);

    List<ProductsEntity> findByStatus(Boolean status);
}
