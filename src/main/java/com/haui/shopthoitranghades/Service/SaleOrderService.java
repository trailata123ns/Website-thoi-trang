package com.haui.shopthoitranghades.Service;

import com.haui.shopthoitranghades.Entity.ContactEntity;
import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderProductsEntity;
import com.haui.shopthoitranghades.Service.Impl.BaseService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

public interface SaleOrderService {

	List<SaleOrderEntity> findAll(Sort sort);

	Page<SaleOrderEntity> findAll(Pageable pageable);

	SaleOrderEntity save(SaleOrderEntity entity);

	List<SaleOrderEntity> saveAll(List<SaleOrderEntity> entities);

	Optional<SaleOrderEntity> findById(Integer integer);

	boolean existsById(Integer integer);

	Class<SaleOrderEntity> clazz();

	List<SaleOrderEntity> findAll();

	List<SaleOrderEntity> findAllById(List<Integer> integers);

	long count();

	void deleteById(Integer integer);

	void delete(Optional<SaleOrderEntity> entity);

	void deleteId(int id );

	void delete(SaleOrderEntity entity);

	void deleteAllById(Iterable<? extends Integer> integers);

	void deleteAll(Iterable<? extends SaleOrderEntity> entities);

	void deleteAll();

	@Transactional
	SaleOrderEntity saveOrUpdate(SaleOrderEntity entity);

	public List<SaleOrderEntity> saleOrderEntityListByUser(String email ) ;

}
