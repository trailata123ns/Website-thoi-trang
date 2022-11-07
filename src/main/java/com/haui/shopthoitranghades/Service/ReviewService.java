package com.haui.shopthoitranghades.Service;


import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.ReviewEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;
import java.util.Optional;

public interface ReviewService {
    List<ReviewEntity> findByProduct(ProductsEntity product);

    List<ReviewEntity> findByStatus(Boolean status);

    Iterable<ReviewEntity> findAll(Sort sort);

    Page<ReviewEntity> findAll(Pageable pageable);

    <S extends ReviewEntity> S save(S entity);

    <S extends ReviewEntity> Iterable<S> saveAll(Iterable<S> entities);

    Optional<ReviewEntity> findById(Integer integer);

    boolean existsById(Integer integer);

    Iterable<ReviewEntity> findAll();

    Iterable<ReviewEntity> findAllById(Iterable<Integer> integers);

    long count();

    void deleteById(Integer integer);

    void delete(ReviewEntity entity);

    void deleteAllById(Iterable<? extends Integer> integers);

    void deleteAll(Iterable<? extends ReviewEntity> entities);

    void deleteAll();
}
