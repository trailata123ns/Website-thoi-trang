package com.haui.shopthoitranghades.Service;

import com.haui.shopthoitranghades.Entity.ContactEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;
import java.util.Optional;

public interface ContactService {
    List<ContactEntity> findAll(Sort sort);

    Page<ContactEntity> findAll(Pageable pageable);

    ContactEntity  save(ContactEntity entity);

    List<ContactEntity> saveAll(List<ContactEntity> entities);

    Optional<ContactEntity> findById(Integer integer);

    boolean existsById(Integer integer);

    List<ContactEntity> findAll();

    List<ContactEntity> findAllById(List<Integer> integers);

    long count();

    void deleteById(Integer integer);

    void delete(Optional<ContactEntity> entity);

    void deleteAllById(Iterable<? extends Integer> integers);

    void deleteAll(Iterable<? extends ContactEntity> entities);

    void deleteAll();
}
