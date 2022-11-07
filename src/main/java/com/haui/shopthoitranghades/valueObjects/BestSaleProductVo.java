package com.haui.shopthoitranghades.valueObjects;

import lombok.*;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class BestSaleProductVo {
	private String avatar;
	private String name;
	private Long totalSale;
	private BigDecimal totalMoney;
}
