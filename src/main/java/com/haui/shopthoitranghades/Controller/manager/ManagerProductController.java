package com.haui.shopthoitranghades.Controller.manager;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.haui.shopthoitranghades.Controller.user.BaseController;
import com.haui.shopthoitranghades.Dto.Cart;
import com.haui.shopthoitranghades.Dto.CartItem;
import com.haui.shopthoitranghades.Dto.ProductSearch;
import com.haui.shopthoitranghades.Entity.CategoryEntity;
import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Service.CategoryService;
import com.haui.shopthoitranghades.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class ManagerProductController extends BaseController {
	
	@Autowired
	private ProductService productService;

	@Autowired
	CategoryService categoriesService;

	public static int SIZE_OF_PAGE = 5;
	
	@RequestMapping(value = { "/admin/list-product" }, method = RequestMethod.GET) // -> action
	public String home(final Model model,
			final HttpServletRequest request,
			Integer page,
			final HttpServletResponse response)
			throws IOException {
	//	int page = getCurrentPage(request);
		if(page == null)
		{
			page=1;
		}
	//	long listCount = 15;
		String keyword = request.getParameter("keyword");
		ProductSearch ps = new ProductSearch();
		ps.setKeyword(keyword);
		ps.setPage(page-1);

		//Lấy full bản ghi không theo key
		long list = productService.count();

		//Lấy tổng số bản ghi
		int listCount = (int) list;

		//Số trang
		int totalPage=(Integer)listCount/SIZE_OF_PAGE +(listCount % SIZE_OF_PAGE == 0?0:1);

		List<Integer> listPage=new ArrayList<Integer>();
		for(int i=1;i<=totalPage;i++)
		{
			listPage.add(i);
		}
		model.addAttribute("listPage",listPage);

		model.addAttribute("products", productService.search(ps));

		return "manager/list-product"; // -> duong dan toi VIEW.
	}

	@RequestMapping(value = { "/admin/list-product"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final ModelMap model, final HttpServletRequest request,
														 final HttpServletResponse response,

														 @RequestParam("status") Boolean status ,
														 @RequestParam("id") Integer id) {
		// trả kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");

		return ResponseEntity.ok(jsonResult);
	}


	@RequestMapping(value = { "/admin/add-product" }, method = RequestMethod.GET) // -> action
	public String addProduct(final Model model,
							 final HttpServletRequest request,
							 final HttpServletResponse response)
			throws IOException {

		List<CategoryEntity> categories = categoriesService.findAll();

		model.addAttribute("categories",categories);

		model.addAttribute("product",new ProductsEntity());

		return "manager/add-product";
	}

	@RequestMapping(value = { "/admin/edit-product/{productId}" }, method = RequestMethod.GET) // -> action
	public String editProduct(final Model model,
							  final HttpServletRequest request,
							  final HttpServletResponse response,
							  @PathVariable("productId") int productId)
			throws IOException {

		//Lấy sp từ db
		Optional<ProductsEntity> product = productService.findById(productId);

		List<CategoryEntity> categories = categoriesService.findAll();

		model.addAttribute("categories",categories);

		model.addAttribute("product", product.get());

		return "manager/add-product";
	}


	@RequestMapping(value = { "/admin/add-product" }, method = RequestMethod.POST) // -> action
	public String addProduct(
							 final @Validated @ModelAttribute("product") ProductsEntity product,
							 BindingResult bindingResult,
							 final Model model,
							 @RequestParam("inputAvatar") MultipartFile inputAvatar,
							 @RequestParam("inputPictures") MultipartFile[] inputPictures,
							 final HttpServletRequest request,
							 final HttpServletResponse response)
			throws Exception {
		if (bindingResult.hasErrors()) {
			return "redirect:/admin/add-product";
		}else{
			if(product.getId() == null || product.getId() <= 0) {
				//Luu product vao db
				productService.save(product, inputAvatar, inputPictures);
			}else {
				productService.edit(product, inputAvatar, inputPictures);
			}
		}

		return "redirect:/admin/list-product";
	}

	@RequestMapping(value = { "/admin/delete/{productId}" }, method = RequestMethod.GET) // -> action
	public String deleteProduct(final Model model,
								final HttpServletRequest request,
								final HttpServletResponse response,
								@PathVariable("productId") int productId)
			throws IOException {

		Optional<ProductsEntity> product = productService.findById(productId);
		productService.delete(product);

		return "redirect:/admin/list-product";
	}


	@RequestMapping(value = { "/admin/changeStatusProduct" }, method = RequestMethod.GET) // -> action
	public String changeStatusProduct(final Model model,
								final HttpServletRequest request,
								final HttpServletResponse response,
								@RequestParam("id") Integer id)
			throws IOException {

		ProductsEntity productsEntity = productService.findById(id).get();

		if(productsEntity.getStatus() == true){
			productsEntity.setStatus(false);
		}else{
			productsEntity.setStatus(true);
		}

		productService.save(productsEntity);

		return "redirect:/admin/list-product";
	}


}
