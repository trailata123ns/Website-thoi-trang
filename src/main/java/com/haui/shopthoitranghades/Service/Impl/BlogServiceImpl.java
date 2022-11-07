package com.haui.shopthoitranghades.Service.Impl;

import com.haui.shopthoitranghades.Entity.BlogEntity;
import com.haui.shopthoitranghades.Responsitory.BlogRepository;
import com.haui.shopthoitranghades.Service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.util.List;
import java.util.Optional;

import static com.haui.shopthoitranghades.Dto.Constants.UPLOAD_FILE_ROOT;

@Service
public class BlogServiceImpl extends BaseService<BlogEntity> implements BlogService {

    @Autowired(required = false)
    BlogRepository blogRepository;

    @Override
    public Iterable<BlogEntity> findAll(Sort sort) {
        return blogRepository.findAll(sort);
    }

    @Override
    public Page<BlogEntity> findAll(Pageable pageable) {
        return blogRepository.findAll(pageable);
    }

    @Override
    public <S extends BlogEntity> S save(S entity) {
        return blogRepository.save(entity);
    }

    @Override
    public <S extends BlogEntity> Iterable<S> saveAll(Iterable<S> entities) {
        return blogRepository.saveAll(entities);
    }

    @Override
    public Optional<BlogEntity> findById(Integer integer) {
        return blogRepository.findById(integer);
    }

    @Override
    public boolean existsById(Integer integer) {
        return blogRepository.existsById(integer);
    }

    @Override
    protected Class<BlogEntity> clazz() {
        return BlogEntity.class;
    }

    @Override
    public List<BlogEntity> findAll() {
        return (List<BlogEntity>)blogRepository.findAll();
    }

    @Override
    public Iterable<BlogEntity> findAllById(Iterable<Integer> integers) {
        return blogRepository.findAllById(integers);
    }

    @Override
    public long count() {
        return blogRepository.count();
    }

    @Override
    public void deleteById(Integer integer) {
        blogRepository.deleteById(integer);
    }

    @Override
    public void delete(BlogEntity entity) {
        blogRepository.delete(entity);
    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> integers) {
        blogRepository.deleteAllById(integers);
    }

    @Override
    public void deleteAll(Iterable<? extends BlogEntity> entities) {
        blogRepository.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        blogRepository.deleteAll();
    }


    @Override
    public boolean isEmptyUploadFile(MultipartFile image) {
        return image == null || image.getOriginalFilename().isEmpty();
    }

    @Override
    @Transactional
    public BlogEntity save(BlogEntity blog, MultipartFile inputAvatar) throws Exception {
        //Có đẩy avatar lên không
        if(!isEmptyUploadFile(inputAvatar)) {
            inputAvatar.transferTo(new File( UPLOAD_FILE_ROOT +"blogs/"+inputAvatar.getOriginalFilename()));
            blog.setAvatar("blogs/" +inputAvatar.getOriginalFilename());
        }

        return super.saveOrUpdate(blog);
    }

}
