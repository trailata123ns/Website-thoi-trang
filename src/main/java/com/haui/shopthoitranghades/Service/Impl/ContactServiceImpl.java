package com.haui.shopthoitranghades.Service.Impl;

import com.haui.shopthoitranghades.Entity.ContactEntity;
import com.haui.shopthoitranghades.Responsitory.ContactResponsitory;
import com.haui.shopthoitranghades.Service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ContactServiceImpl implements ContactService {

    @Autowired(required = false)
    ContactResponsitory contactResponsitory;

    @Override
    public List<ContactEntity> findAll(Sort sort) {
        return (List<ContactEntity>)contactResponsitory.findAll(sort);
    }

    @Override
    public Page<ContactEntity> findAll(Pageable pageable) {
        return contactResponsitory.findAll(pageable);
    }

    @Override
    public ContactEntity  save(ContactEntity entity) {
        return contactResponsitory.save(entity);
    }

    @Override
    public List<ContactEntity> saveAll(List<ContactEntity> entities) {
        return (List<ContactEntity>)contactResponsitory.saveAll(entities);
    }

    @Override
    public Optional<ContactEntity> findById(Integer integer) {
        return contactResponsitory.findById(integer);
    }

    @Override
    public boolean existsById(Integer integer) {
        return contactResponsitory.existsById(integer);
    }

    @Override
    public List<ContactEntity> findAll() {
        return (List<ContactEntity>)contactResponsitory.findAll();
    }

    @Override
    public List<ContactEntity> findAllById(List<Integer> integers) {
        return (List<ContactEntity>)contactResponsitory.findAllById(integers);
    }

    @Override
    public long count() {
        return contactResponsitory.count();
    }

    @Override
    public void deleteById(Integer integer) {
        contactResponsitory.deleteById(integer);
    }

    @Override
    public void delete(Optional<ContactEntity> entity) {
        contactResponsitory.delete(entity.get());
    }

    @Override
    public void deleteAllById(Iterable<? extends Integer> integers) {
        contactResponsitory.deleteAllById(integers);
    }

    @Override
    public void deleteAll(Iterable<? extends ContactEntity> entities) {
        contactResponsitory.deleteAll(entities);
    }

    @Override
    public void deleteAll() {
        contactResponsitory.deleteAll();
    }
}
