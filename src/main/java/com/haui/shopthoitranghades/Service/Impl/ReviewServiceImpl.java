package com.haui.shopthoitranghades.Service.Impl;

import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.ReviewEntity;
import com.haui.shopthoitranghades.Responsitory.ReviewRepository;
import com.haui.shopthoitranghades.Service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {

    @Autowired(required=false)
    ReviewRepository reviewRepository;

    @Override
    public List<ReviewEntity> findByProduct(ProductsEntity product) {
        return reviewRepository.findByProduct(product);
    }

    @Override
    public List<ReviewEntity> findByStatus(Boolean status) {
        return reviewRepository.findByStatus(status);
    }

    @Override
    public Iterable<ReviewEntity> findAll(Sort sort) {
        return reviewRepository.findAll(sort);
    }

    @Override
    public Page<ReviewEntity> findAll(Pageable pageable) {
        return reviewRepository.findAll(pageable);
    }

    @Override
    public <S extends ReviewEntity> S save(S entity) {
        return reviewRepository.save(entity);
    }

    @Override
    public <S extends ReviewEntity> Iterable<S> saveAll(Iterable<S> entities) {
        return reviewRepository.saveAll(entities);
    }

    @Override
    public Optional<ReviewEntity> findById(Integer integer) {
        return reviewRepository.findById(integer);
    }

    @Override
    public boolean existsById(Integer integer) {
        return reviewRepository.existsById(integer);
    }

    @Override
    public Iterable<ReviewEntity> findAll() {
        return reviewRepository.findAll();
    }

    @Override
    public Iterable<ReviewEntity> findAllById(Iterable<Integer> integers) {
        return reviewRepository.findAllById(integers);
    }

    @Override
    public long count() {
        return reviewRepository.count();
    }

    @Override
    public void deleteById(Integer integer) {
        reviewRepository.deleteById(integer);
    }

    @Override
    public void delete(ReviewEntity entity) {
        reviewRepository.delete(entity);
    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> integers) {
        reviewRepository.deleteAllById(integers);
    }

    @Override
    public void deleteAll(Iterable<? extends ReviewEntity> entities) {
        reviewRepository.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        reviewRepository.deleteAll();
    }
}
