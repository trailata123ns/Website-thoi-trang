package com.haui.shopthoitranghades.Service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import com.haui.shopthoitranghades.Entity.BaseEntity;
import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.UserEntity;
import org.springframework.stereotype.Service;


@Service
public abstract class BaseService<E extends BaseEntity> {

	public static int SIZE_OF_PAGE = 9;
	//Hello
	
	@PersistenceContext
	EntityManager entityManager;

    protected abstract Class<E> clazz();

	public E getById(int id) {
		return entityManager.find(clazz(), id);
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findAll() {
		Table tbl = clazz().getAnnotation(Table.class);
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + tbl.name(), clazz()).getResultList();
	}

	@SuppressWarnings("unchecked")
	public Integer getCount() {
		Table tbl = clazz().getAnnotation(Table.class);
		return  (Integer) entityManager.createNativeQuery("SELECT * FROM " +tbl.name()).getSingleResult();
	}
	
	@Transactional
	public E saveOrUpdate(E entity) {
		if (entity.getId() == null || entity.getId() <= 0) {
			entityManager.persist(entity);
			return entity;
		} else {
			return entityManager.merge(entity);
		}
	}

	public void delete(E entity) {
		entityManager.remove(entity);
	}

	public void deleteById(int id) {
		E entity = this.getById(id);
		delete(entity);
	}
	
	@SuppressWarnings("unchecked")
	public List<E> executeNativeSql(String sql, int page) {
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			if(page >=0) {
				query.setFirstResult(page*SIZE_OF_PAGE);
				query.setMaxResults(SIZE_OF_PAGE);
			}
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<E>();
		}
	}

	@SuppressWarnings("unchecked")
	public List<E> executeNativeSql(String sql) {
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<E>();
		}
	}

}
