package com.haui.shopthoitranghades.Service;

import com.haui.shopthoitranghades.Entity.BlogEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

public interface BlogService {
    Iterable<BlogEntity> findAll(Sort sort);

    Page<BlogEntity> findAll(Pageable pageable);

    <S extends BlogEntity> S save(S entity);

    <S extends BlogEntity> Iterable<S> saveAll(Iterable<S> entities);

    Optional<BlogEntity> findById(Integer integer);

    boolean existsById(Integer integer);

    List<BlogEntity> findAll();

    Iterable<BlogEntity> findAllById(Iterable<Integer> integers);

    long count();

    void deleteById(Integer integer);

    void delete(BlogEntity entity);

    void deleteAllById(Iterable<? extends Integer> integers);

    void deleteAll(Iterable<? extends BlogEntity> entities);

    void deleteAll();

    boolean isEmptyUploadFile(MultipartFile image);

    @Transactional
    BlogEntity save(BlogEntity blog, MultipartFile inputAvatar) throws Exception;
}
