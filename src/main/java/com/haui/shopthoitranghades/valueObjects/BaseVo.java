package com.haui.shopthoitranghades.valueObjects;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class BaseVo<E> {

	private List<E> listEntity;

	private int currentPage;

	private int totalPage;
}
