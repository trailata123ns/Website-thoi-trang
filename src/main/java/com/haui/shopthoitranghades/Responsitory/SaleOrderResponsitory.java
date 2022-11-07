package com.haui.shopthoitranghades.Responsitory;

import com.haui.shopthoitranghades.Entity.SaleOrderEntity;
import com.haui.shopthoitranghades.valueObjects.BestSaleProductVo;
import com.haui.shopthoitranghades.valueObjects.OrderStatistical;
import com.haui.shopthoitranghades.valueObjects.RevenueDate;
import com.haui.shopthoitranghades.valueObjects.RevenueVo;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface SaleOrderResponsitory extends PagingAndSortingRepository<SaleOrderEntity,Integer> {


}
