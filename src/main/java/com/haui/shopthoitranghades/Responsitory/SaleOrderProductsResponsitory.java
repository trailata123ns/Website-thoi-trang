package com.haui.shopthoitranghades.Responsitory;

import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.ReviewEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderProductsEntity;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface SaleOrderProductsResponsitory extends PagingAndSortingRepository<SaleOrderProductsEntity,Integer> {
    List<SaleOrderProductsEntity> findByProduct(SaleOrderEntity saleOrder);
}
