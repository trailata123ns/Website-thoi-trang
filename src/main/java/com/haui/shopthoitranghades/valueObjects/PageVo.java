package com.haui.shopthoitranghades.valueObjects;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PageVo<E> {

	private List<E> content;
	private Integer currentPage;
	private Integer totalPage;

}
