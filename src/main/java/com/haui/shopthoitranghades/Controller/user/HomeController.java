package com.haui.shopthoitranghades.Controller.user;

import com.haui.shopthoitranghades.Dto.Cart;
import com.haui.shopthoitranghades.Entity.CategoryEntity;
import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Service.CategoryService;
import com.haui.shopthoitranghades.Service.ProductService;
import com.haui.shopthoitranghades.Service.SaleOrderProductService;
import com.haui.shopthoitranghades.Service.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class HomeController extends BaseController{
    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "/home" , method = RequestMethod.GET)
    public String getAllProduct(final Model model ,
                                final HttpServletRequest request,
                                @RequestParam("p") Optional<Integer> p

    ) throws Exception {

        List<ProductsEntity> hotProducts = productService.findTop8ProductHot();

        List<ProductsEntity> listProduct = productService.findAll();

        int dem = 0;
        List<ProductsEntity> listHotProduct = new ArrayList<ProductsEntity>();
        for (ProductsEntity pro : listProduct ){
            if(pro.getIsHot() == true){
                listHotProduct.add(pro);
                dem++;
            }
            if (dem == 8)
                break;
        }

        model.addAttribute("listHotProduct",listHotProduct);

        Pageable pageCategory = PageRequest.of(p.orElse(0),6);
        Page<ProductsEntity> listCategory = productService.findAll(pageCategory);
        model.addAttribute("listCategory",listCategory);

        //Pagination
        Pageable pageable = PageRequest.of(p.orElse(0),4);
        Page<ProductsEntity> page = productService.findAll(pageable);

        model.addAttribute("listProduct",page);
        return "user/home";
    }
}
