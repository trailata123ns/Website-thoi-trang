package com.haui.shopthoitranghades.Service;

import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderProductsEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;
import java.util.Optional;

public interface SaleOrderProductService {

    List<SaleOrderProductsEntity> saleOrderProductsEntityList(Integer id);

    Iterable<SaleOrderProductsEntity> findAll(Sort sort);

    Page<SaleOrderProductsEntity> findAll(Pageable pageable);

    List<SaleOrderProductsEntity> findAll();

    List<SaleOrderProductsEntity> findByProduct(SaleOrderEntity product);

    <S extends SaleOrderProductsEntity> S save(S entity);

    <S extends SaleOrderProductsEntity> Iterable<S> saveAll(Iterable<S> entities);

    Optional<SaleOrderProductsEntity> findById(Integer integer);

    boolean existsById(Integer integer);

    Iterable<SaleOrderProductsEntity> findAllById(Iterable<Integer> integers);

    long count();

    void deleteById(Integer integer);

    void deleteAllById(Iterable<? extends Integer> integers);

    void deleteAll(Iterable<? extends SaleOrderProductsEntity> entities);

    void deleteAll();
}
