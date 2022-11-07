package com.haui.shopthoitranghades.Responsitory;

import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.ReviewEntity;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends PagingAndSortingRepository<ReviewEntity , Integer> {

    List<ReviewEntity> findByProduct(ProductsEntity product);

    List<ReviewEntity> findByStatus(Boolean status);
}
