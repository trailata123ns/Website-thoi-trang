package com.haui.shopthoitranghades.Responsitory;

import com.haui.shopthoitranghades.Entity.ContactEntity;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ContactResponsitory extends PagingAndSortingRepository<ContactEntity , Integer> {
}
