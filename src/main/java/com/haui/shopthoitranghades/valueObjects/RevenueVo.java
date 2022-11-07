package com.haui.shopthoitranghades.valueObjects;

import lombok.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RevenueVo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Date date;
	private Long numOfOrder;
	private Long numOfCancelOrder;
	private Long numOfProduct;
	private BigDecimal totalRevenue;
}
