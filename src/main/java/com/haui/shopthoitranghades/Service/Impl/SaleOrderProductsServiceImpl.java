package com.haui.shopthoitranghades.Service.Impl;

import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.ReviewEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderProductsEntity;
import com.haui.shopthoitranghades.Responsitory.SaleOrderProductsResponsitory;
import com.haui.shopthoitranghades.Service.SaleOrderProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SaleOrderProductsServiceImpl extends BaseService<SaleOrderProductsEntity> implements SaleOrderProductService {

    @Autowired(required = false)
    SaleOrderProductsResponsitory saleOrderProductsResponsitory;

    @Override
    public Iterable<SaleOrderProductsEntity> findAll(Sort sort) {
        return saleOrderProductsResponsitory.findAll(sort);
    }

    @Override
    public Page<SaleOrderProductsEntity> findAll(Pageable pageable) {
        return saleOrderProductsResponsitory.findAll(pageable);
    }

    @Override
    public List<SaleOrderProductsEntity> findByProduct(SaleOrderEntity product) {
        return saleOrderProductsResponsitory.findByProduct(product);
    }

    @Override
    public <S extends SaleOrderProductsEntity> S save(S entity) {
        return saleOrderProductsResponsitory.save(entity);
    }

    @Override
    public <S extends SaleOrderProductsEntity> Iterable<S> saveAll(Iterable<S> entities) {
        return saleOrderProductsResponsitory.saveAll(entities);
    }

    @Override
    public Optional<SaleOrderProductsEntity> findById(Integer integer) {
        return saleOrderProductsResponsitory.findById(integer);
    }

    @Override
    public boolean existsById(Integer integer) {
        return saleOrderProductsResponsitory.existsById(integer);
    }

    @Override
    public List<SaleOrderProductsEntity> findAll() {
        return (List<SaleOrderProductsEntity>)saleOrderProductsResponsitory.findAll();
    }

    @Override
    public Iterable<SaleOrderProductsEntity> findAllById(Iterable<Integer> integers) {
        return saleOrderProductsResponsitory.findAllById(integers);
    }

    @Override
    public long count() {
        return saleOrderProductsResponsitory.count();
    }

    @Override
    public void deleteById(Integer integer) {
        saleOrderProductsResponsitory.deleteById(integer);
    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> integers) {
        saleOrderProductsResponsitory.deleteAllById(integers);
    }

    @Override
    public void deleteAll(Iterable<? extends SaleOrderProductsEntity> entities) {
        saleOrderProductsResponsitory.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        saleOrderProductsResponsitory.deleteAll();
    }

    @Override
    protected Class<SaleOrderProductsEntity> clazz() {
        // TODO Auto-generated method stub
        return SaleOrderProductsEntity.class;
    }

    @Override
    public List<SaleOrderProductsEntity> saleOrderProductsEntityList(Integer id) {

        String sql = "SELECT  * FROM tbl_saleorder_products c  WHERE c.saleorder_id = '"+id+"'";

        return executeNativeSql(sql);
    }


}
