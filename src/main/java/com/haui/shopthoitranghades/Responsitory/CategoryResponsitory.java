package com.haui.shopthoitranghades.Responsitory;

import com.haui.shopthoitranghades.Entity.CategoryEntity;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CategoryResponsitory extends PagingAndSortingRepository<CategoryEntity,Integer> {
}
