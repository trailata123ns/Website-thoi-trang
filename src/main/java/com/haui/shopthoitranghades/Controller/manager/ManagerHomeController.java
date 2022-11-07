package com.haui.shopthoitranghades.Controller.manager;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haui.shopthoitranghades.Controller.user.BaseController;
import com.haui.shopthoitranghades.Dto.ProductTK;
import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderProductsEntity;
import com.haui.shopthoitranghades.Service.CategoryService;
import com.haui.shopthoitranghades.Service.ProductService;
import com.haui.shopthoitranghades.Service.SaleOrderProductService;
import com.haui.shopthoitranghades.Service.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ManagerHomeController extends BaseController {

	@Autowired
	private ProductService productService;

	@Autowired
	private SaleOrderService orderService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private SaleOrderProductService saleOrderProductService;

	public void swap(ProductTK a , ProductTK b){
		ProductTK tg = a;
		a = b;
		b = tg;
	}

	@RequestMapping(value = { "/admin/index" }, method = RequestMethod.GET)

	public String home(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response ,
					   @RequestParam(required = false) Map<String , String> params)
			throws Exception {

		//Thong ke doanh thu theo sản phẩm
		List<ProductTK> listProductTk = new ArrayList<ProductTK>();
		List<ProductTK> listProductTk1 = new ArrayList<ProductTK>();
		List<SaleOrderProductsEntity> listSalePro = saleOrderProductService.findAll();

		for(int i = 0 ; i< listSalePro.size() ; i++){
			ProductTK pr = new ProductTK();
			pr.setProductId(listSalePro.get(i).getProduct().getId());
			pr.setProductName(listSalePro.get(i).getProduct().getTitle());
			pr.setQuantity(listSalePro.get(i).getQuality());
			pr.setProductImage(listSalePro.get(i).getProduct().getAvatar());
			pr.setPrice(listSalePro.get(i).getProduct().getPriceSale());
			pr.setCreatedDate(listSalePro.get(i).getCreatedDate());
			pr.setQuantity(listSalePro.get(i).getQuality());
			pr.setTotal(pr.getQuantity() * pr.getPrice());
			listProductTk.add(pr);
		}
		Collections.sort(listProductTk, new Comparator<ProductTK>() {
			@Override
			public int compare(ProductTK o1, ProductTK o2) {
				return o1.getProductId() - (o2.getProductId());
			}
		});

		for(int j = 0 ; j < listProductTk.size() -1; j++){
			if(listProductTk.get(j).getProductId() == listProductTk.get(j+1).getProductId()){
				listProductTk.get(j).setQuantity(listProductTk.get(j).getQuantity() + listProductTk.get(j+1).getQuantity());
				listProductTk.get(j).setTotal(listProductTk.get(j).getQuantity() * listProductTk.get(j+1).getPrice());
				listProductTk.remove(j+1);
			}
		}

		for(int i = 0 ; i < listProductTk.size() ; i++){
			System.out.println(listProductTk.get(i).getProductId());
		}

		for(int j = 0 ; j < listProductTk.size() -1; j++){
			if(listProductTk.get(j).getProductId() == listProductTk.get(j+1).getProductId()){
				listProductTk.get(j).setQuantity(listProductTk.get(j).getQuantity() + listProductTk.get(j+1).getQuantity());
				listProductTk.get(j).setTotal(listProductTk.get(j).getQuantity() * listProductTk.get(j+1).getPrice());
				listProductTk.remove(j+1);
			}
		}

		for(int j = 0 ; j < listProductTk.size() -1; j++){
			if(listProductTk.get(j).getProductId() == listProductTk.get(j+1).getProductId()){
				listProductTk.get(j).setQuantity(listProductTk.get(j).getQuantity() + listProductTk.get(j+1).getQuantity());
				listProductTk.get(j).setTotal(listProductTk.get(j).getQuantity() * listProductTk.get(j+1).getPrice());
				listProductTk.remove(j+1);
				break;
			}
		}

		System.out.println("hahah");

		for(int i = 0 ; i < listProductTk.size() ; i++){
			System.out.println(listProductTk.get(i).getProductId());
		}

		model.addAttribute("listProductTk",listProductTk);

		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");

		LocalDateTime current = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formatted = current.format(formatter);
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(formatted);

		Date toDate = date;
		Date fromDate = date;

		try {
			String from = params.getOrDefault("fromDate" , null);
			if(from != null)
				fromDate = f.parse(from);

			String to = params.getOrDefault("toDate" , null);
				if(to != null)
					toDate = f.parse(to);
		}catch(ParseException ex){
			ex.printStackTrace();
		}

		List<SaleOrderEntity> list = orderService.findAll();
		List<ProductTK> list1 = new ArrayList<ProductTK>();
		List<SaleOrderProductsEntity> saleOrderProductsEntityList = new ArrayList<SaleOrderProductsEntity>();

		for (int i = 0 ; i < listProductTk.size() ; i++){
			if(listProductTk.get(i).getCreatedDate() != null){
				if (listProductTk.get(i).getCreatedDate().before(toDate) && listProductTk.get(i).getCreatedDate().after(fromDate)){
					list1.add(listProductTk.get(i));
				}
			}
		}

		model.addAttribute("listSaleOrderByDate" , list1);

		model.addAttribute("listCate",categoryService.findAll());

		List<ProductsEntity> productsEntities = productService.findAll();
		model.addAttribute("countProduct",productsEntities.size());

		int dem = 0;

		List<SaleOrderEntity> saleOrderEntityList = orderService.findAll();
		for (SaleOrderEntity saleOrder: saleOrderEntityList
			 ) {
			if (saleOrder.getStatus() == false && saleOrder.getUpdatedBy() == null){
				dem++;
			}
		}

		model.addAttribute("dem",dem);

		model.addAttribute("countOrder",saleOrderEntityList.size());

		Double total = 0d;
		for(int i = 0 ; i < saleOrderEntityList.size() ; i++){
			total += saleOrderEntityList.get(i).getTotal();
		}

		List<ProductsEntity> listProduct = productService.findAll();

		List<ProductsEntity> listHotProduct = new ArrayList<ProductsEntity>();
		for (ProductsEntity pro : listProduct ){
			if(pro.getIsHot() == true){
				listHotProduct.add(pro);
			}
		}

		model.addAttribute("listHotProduct",listHotProduct);

		model.addAttribute("sum",total);



		return "manager/index";
	}
}
