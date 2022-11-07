package com.haui.shopthoitranghades.Controller.user;

import com.haui.shopthoitranghades.Entity.SaleOrderEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderProductsEntity;
import com.haui.shopthoitranghades.Entity.UserEntity;
import com.haui.shopthoitranghades.Service.SaleOrderProductService;
import com.haui.shopthoitranghades.Service.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
public class OrderController extends BaseController{

    @Autowired(required = false)
    SaleOrderService saleOrderService;

    @Autowired
    SaleOrderProductService saleOrderProductService;

    @RequestMapping(value = { "/user/order" }, method = RequestMethod.GET)
    public String listSaleOrder(
                                final HttpServletRequest request,
                                final Model model
    )
            throws IOException {

        if(isLogined()){
            UserEntity user = getUserLogined();
            List<SaleOrderEntity> list = saleOrderService.saleOrderEntityListByUser(getUserLogined().getEmail());
            model.addAttribute("listOrder",list);
        }

        else{
            String keyword = request.getParameter("keyword");

            List<SaleOrderEntity> list = saleOrderService.saleOrderEntityListByUser(keyword);

            model.addAttribute("listOrder",list);
        }

        return "user/orderuser";
    }

    @RequestMapping(value = "/user/detailOrderUser/{id}" , method = RequestMethod.GET)
    public String detail(final Model model,
                         @PathVariable("id") Integer id)
            throws IOException {

        SaleOrderEntity saleOrderEntity = saleOrderService.findById(id).get();

        model.addAttribute("saleOrder",saleOrderEntity);

        List<SaleOrderProductsEntity> list = saleOrderProductService.saleOrderProductsEntityList(id);

        model.addAttribute("list",list);

        return "user/detailOrderUser";
    }

}
