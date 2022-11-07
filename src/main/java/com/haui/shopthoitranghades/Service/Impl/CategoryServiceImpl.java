package com.haui.shopthoitranghades.Service.Impl;

import com.haui.shopthoitranghades.Dto.CategorySearch;
import com.haui.shopthoitranghades.Entity.CategoryEntity;
import com.haui.shopthoitranghades.Responsitory.CategoryResponsitory;
import com.haui.shopthoitranghades.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl extends BaseService<CategoryEntity> implements CategoryService {

    @Autowired(required=false)
    CategoryResponsitory categoryResponsitory;

    @Override
    public List<CategoryEntity> findAll(Sort sort) {
        return (List<CategoryEntity>)categoryResponsitory.findAll(sort);
    }

    @Override
    public Page<CategoryEntity> findAll(Pageable pageable) {
        return categoryResponsitory.findAll(pageable);
    }

    @Override
    public CategoryEntity save(CategoryEntity entity) {
        return categoryResponsitory.save(entity);
    }

    @Override
    public List<CategoryEntity> saveAll(List<CategoryEntity> entities) {
        return (List<CategoryEntity>)categoryResponsitory.saveAll(entities);
    }

    @Override
    public Optional<CategoryEntity> findById(Integer integer) {
        return categoryResponsitory.findById(integer);
    }

    @Override
    public boolean existsById(Integer integer) {
        return categoryResponsitory.existsById(integer);
    }

    @Override
    public Class<CategoryEntity> clazz() {
        // TODO Auto-generated method stub
        return CategoryEntity.class; // trả về class của cái entity
    }

    @Override
    public List<CategoryEntity> findAll() {
        return (List<CategoryEntity>)categoryResponsitory.findAll();
    }

    @Override
    public List<CategoryEntity> findAllById(List<Integer> integers) {
        return (List<CategoryEntity>)categoryResponsitory.findAllById(integers);
    }

    @Override
    public long count() {
        return categoryResponsitory.count();
    }

    @Override
    public void deleteById(Integer integer) {
        categoryResponsitory.deleteById(integer);
    }

    @Override
    public void delete(Optional<CategoryEntity> entity) {
        categoryResponsitory.delete(entity.get());
    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> integers) {
        categoryResponsitory.deleteAllById(integers);
    }

    @Override
    public void deleteAll(Iterable<? extends CategoryEntity> entities) {
        categoryResponsitory.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        categoryResponsitory.deleteAll();
    }


    @Override
    public List<CategoryEntity> search(CategorySearch searchModel) {

        String sql = "SELECT  * FROM tbl_category c  WHERE 1=1";

        if (!StringUtils.isEmpty(searchModel.getKeyword())) {
            sql += " and (c.name like '%" + searchModel.getKeyword() + "%')";
        }

        return executeNativeSql(sql,searchModel.getPage());
    }
    @Override
    public List<CategoryEntity> search1(CategorySearch searchModel) {

        // khởi tạo câu lệnh
        String sql = "SELECT  * FROM tbl_category c  WHERE 1=1";

        // tim kiem san pham theo seachText
        if (!StringUtils.isEmpty(searchModel.getKeyword())) {
            sql += " and (c.name like '%" + searchModel.getKeyword() + "%'" + " or c.description like '%"
                    + searchModel.getKeyword() + "%')";
        }
        return executeNativeSql(sql,searchModel.getPage());
    }


    @Override
    @Transactional
    public CategoryEntity save1(CategoryEntity category){

        return super.saveOrUpdate(category);
    }

    @Override
    @Transactional
    public CategoryEntity edit(CategoryEntity category)throws Exception {

        CategoryEntity categoryOnDb = super.getById(category.getId());

        return super.saveOrUpdate(category);
    }

}
