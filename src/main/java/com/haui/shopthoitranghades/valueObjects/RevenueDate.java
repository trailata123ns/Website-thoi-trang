package com.haui.shopthoitranghades.valueObjects;

import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RevenueDate {
	private Date date;
	private BigDecimal total;
}
