package com.haui.shopthoitranghades.Service;

import com.haui.shopthoitranghades.Dto.CategorySearch;
import com.haui.shopthoitranghades.Entity.CategoryEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

public interface CategoryService {
    List<CategoryEntity> findAll(Sort sort);

    Page<CategoryEntity> findAll(Pageable pageable);

    CategoryEntity save(CategoryEntity entity);

    List<CategoryEntity> saveAll(List<CategoryEntity> entities);

    Optional<CategoryEntity> findById(Integer integer);

    boolean existsById(Integer integer);

    Class<CategoryEntity> clazz();

    List<CategoryEntity> findAll();

    List<CategoryEntity> findAllById(List<Integer> integers);

    long count();

    void deleteById(Integer integer);

    void delete(Optional<CategoryEntity> entity);

    void deleteAllById(Iterable<? extends Integer> integers);

    void deleteAll(Iterable<? extends CategoryEntity> entities);

    void deleteAll();

    List<CategoryEntity> search(CategorySearch searchModel);

    List<CategoryEntity> search1(CategorySearch searchModel);

    @Transactional
    CategoryEntity save1(CategoryEntity category);

    @Transactional
    CategoryEntity edit(CategoryEntity category)throws Exception;
}
