package com.haui.shopthoitranghades.Service.Impl;

import com.haui.shopthoitranghades.Entity.SaleOrderEntity;
import com.haui.shopthoitranghades.Responsitory.SaleOrderResponsitory;
import com.haui.shopthoitranghades.Service.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class SaleOrderServiceImpl extends BaseService<SaleOrderEntity> implements SaleOrderService{
    @Autowired(required=false)
    SaleOrderResponsitory saleOrderResponsitory;

    @Override
    public List<SaleOrderEntity> findAll(Sort sort) {
        return (List<SaleOrderEntity>)saleOrderResponsitory.findAll(sort);
    }

    @Override
    public Page<SaleOrderEntity> findAll(Pageable pageable) {
        return saleOrderResponsitory.findAll(pageable);
    }

    @Override
    public  SaleOrderEntity save(SaleOrderEntity entity) {
        return saleOrderResponsitory.save(entity);
    }

    @Override
    public List<SaleOrderEntity> saveAll(List<SaleOrderEntity> entities) {
        return (List<SaleOrderEntity>)saleOrderResponsitory.saveAll(entities);
    }

    @Override
    public Optional<SaleOrderEntity> findById(Integer integer) {
        return saleOrderResponsitory.findById(integer);
    }

    @Override
    public boolean existsById(Integer integer) {
        return saleOrderResponsitory.existsById(integer);
    }

    @Override
    public Class<SaleOrderEntity> clazz() {
        return SaleOrderEntity.class;
    }

    @Override
    public List<SaleOrderEntity> findAll() {
        return (List<SaleOrderEntity>)saleOrderResponsitory.findAll();
    }

    @Override
    public List<SaleOrderEntity> findAllById(List<Integer> integers) {
        return (List<SaleOrderEntity>)saleOrderResponsitory.findAllById(integers);
    }

    @Override
    public long count() {
        return saleOrderResponsitory.count();
    }

    @Override
    public void deleteById(Integer integer) {
        saleOrderResponsitory.deleteById(integer);
    }

    @Override
    public void delete(Optional<SaleOrderEntity> entity) {
        saleOrderResponsitory.delete(entity.get());
    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> integers) {
        saleOrderResponsitory.deleteAllById(integers);
    }

    @Override
    public void deleteAll(Iterable<? extends SaleOrderEntity> entities) {
        saleOrderResponsitory.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        saleOrderResponsitory.deleteAll();
    }

    @Override
    @Transactional
    public SaleOrderEntity saveOrUpdate(SaleOrderEntity entity) {
        if (entity.getId() == null || entity.getId() <= 0) {
            entityManager.persist(entity);
            return entity;
        } else {
            return entityManager.merge(entity);
        }
    }

    @Override
    public List<SaleOrderEntity> saleOrderEntityListByUser(String email ) {

        String sql = "SELECT  * FROM tbl_saleorder c  WHERE c.cutomer_email = '"+email+"'";

        return executeNativeSql(sql);
    }

    @Override
    public void deleteId(int id ) {
        String sql = "DELETE FROM tbl_saleorder where id = '"+id+"'";
        executeNativeSql(sql);
    }
}
