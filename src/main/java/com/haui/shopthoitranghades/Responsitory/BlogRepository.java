package com.haui.shopthoitranghades.Responsitory;

import com.haui.shopthoitranghades.Entity.BlogEntity;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BlogRepository extends PagingAndSortingRepository<BlogEntity,Integer> {
}
