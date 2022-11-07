package com.haui.shopthoitranghades.valueObjects;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserRequestToProduct {
	private String keySearch;
	private BigDecimal minPrice;
	private BigDecimal maxPrice;
	private Integer typeOrder;
	private Integer idCategory;
	private Integer currentPage;
	private Integer sizeOfPage;
	private Boolean status;
}
