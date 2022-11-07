package com.haui.shopthoitranghades.valueObjects;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserRequest {

	private Integer currentPage;
	private Integer sizeOfPage;
	private String keySearch;
	private Integer idParent;
	private Boolean status;

}
