package com.haui.shopthoitranghades.valueObjects;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RevenueMonth {
	private String monthName;
	private BigDecimal revenue;
}
