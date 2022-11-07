package com.haui.shopthoitranghades.Controller.manager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haui.shopthoitranghades.Controller.user.BaseController;
import com.haui.shopthoitranghades.Dto.CategorySearch;
import com.haui.shopthoitranghades.Entity.CategoryEntity;
import com.haui.shopthoitranghades.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagerCategoryController extends BaseController {
	@Autowired
	private CategoryService categoriesService;

	public static int SIZE_OF_PAGE = 5;

	@RequestMapping(value = { "/admin/categories" }, method = RequestMethod.GET)
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			Integer page)
			throws IOException {

		if(page==null)
		{
			page= 1;
		}

		String keyword =  request.getParameter("keyword");
		CategorySearch categorySearch = new CategorySearch();
		categorySearch.setKeyword(keyword);
		categorySearch.setPage(page - 1);

		long list = categoriesService.count();

		int listCount = (int) list;

		int totalPage =(Integer)listCount/SIZE_OF_PAGE +(listCount % SIZE_OF_PAGE == 0?0:1);

		List<Integer> listPage = new ArrayList<Integer>();
		for(int i = 1; i <=totalPage;i++) {
			listPage.add(i);
		}

		model.addAttribute("listPage", listPage);

		model.addAttribute("categories",categoriesService.search(categorySearch));

		return "manager/categories";
	}

	@RequestMapping(value = { "/admin/add-category" }, method = RequestMethod.GET) // -> action
	public String addCategory(final Model model,
							  final HttpServletRequest request,
							  final HttpServletResponse response)
			throws IOException {

		model.addAttribute("category", new CategoryEntity());

		return "manager/add-category";
	}

	@RequestMapping(value = { "/admin/add-category" }, method = RequestMethod.POST)
	public String saveCategory(final Model model,
							   final HttpServletRequest request,
							   final HttpServletResponse response,
							   final @ModelAttribute("category") CategoryEntity category
	)
			throws Exception {
		if(category.getId() == null|| category.getId() <= 0 ) {
			categoriesService.save(category);
		}else {
			categoriesService.save(category);
		}
		return "redirect:/admin/categories";
	}

	@RequestMapping(value = { "/admin/edit-category/{categoryId}" }, method = RequestMethod.GET) // -> action
	public String editCategory(final Model model,
							   final HttpServletRequest request,
							   final HttpServletResponse response,
							   final @ModelAttribute("category") CategoryEntity category,
							   @PathVariable("categoryId") int categoryId
	)
			throws Exception {

		Optional<CategoryEntity> categories = categoriesService.findById(categoryId);
		model.addAttribute("category", categories.get());

		return "manager/add-category";
	}

	@RequestMapping(value = { "/admin/del-category/{categoryId}" }, method = RequestMethod.GET) // -> action
	public String deleteCategory(final Model model,
								 final HttpServletRequest request,
								 final HttpServletResponse response,
								 @PathVariable("categoryId") int categoryId
	)
			throws Exception {
		Optional<CategoryEntity> categoriesDelete = categoriesService.findById(categoryId);
		categoriesService.delete(categoriesDelete);
		return "redirect:/admin/categories";
	}

}
