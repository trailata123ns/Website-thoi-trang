package com.haui.shopthoitranghades.valueObjects;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Component
public class CustomerOrder {
	private String name;
	private String address;
	private String phone;
	private String email;
}
