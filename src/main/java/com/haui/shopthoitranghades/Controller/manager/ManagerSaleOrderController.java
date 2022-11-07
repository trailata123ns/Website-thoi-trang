package com.haui.shopthoitranghades.Controller.manager;

import com.haui.shopthoitranghades.Controller.user.BaseController;
import com.haui.shopthoitranghades.Dto.ProductTK;
import com.haui.shopthoitranghades.Entity.*;
import com.haui.shopthoitranghades.Service.ProductService;
import com.haui.shopthoitranghades.Service.SaleOrderProductService;
import com.haui.shopthoitranghades.Service.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.*;

@Controller
public class ManagerSaleOrderController extends BaseController {

    @Autowired(required = false)
    SaleOrderService saleOrderService;

    @Autowired
    SaleOrderProductService saleOrderProductService;

    @Autowired
    ProductService productService;

    @RequestMapping(value = { "/admin/order" }, method = RequestMethod.GET)
    public String listSaleOrder(final Model model,
                                @RequestParam("p") Optional<Integer> p
                             )
            throws IOException {

        //Pagination
        Pageable pageable = PageRequest.of(p.orElse(0),10 , Sort.by("createdDate").descending());

        Page<SaleOrderEntity> page = saleOrderService.findAll(pageable);

        model.addAttribute("listOrder",page);

        return "manager/order";
    }

    @RequestMapping(value = { "/admin/orderConf" }, method = RequestMethod.GET)
    public String listSaleOrderCònirm(final Model model,
                                @RequestParam("p") Optional<Integer> p
    )
            throws IOException {

        //Pagination
        Pageable pageable = PageRequest.of(p.orElse(0),10 , Sort.by("createdDate").descending());

        Page<SaleOrderEntity> page = saleOrderService.findAll(pageable);

        model.addAttribute("listOrder",page);

        return "manager/orderConfirm";
    }

    @RequestMapping(value = { "/admin/deleteSl/{id}" }, method = RequestMethod.GET)
    public String delete(final Model model,
                         @PathVariable("id") int id)
            throws IOException {

        SaleOrderEntity saleOrderEntity = saleOrderService.findById(id).get();
        saleOrderEntity.setUpdatedBy(1);
        saleOrderService.save(saleOrderEntity);

        return "redirect:/admin/orderConf";
    }


    @RequestMapping(value = "/admin/detailOrder/{id}" , method = RequestMethod.GET)
    public String detail(final Model model,
                         @PathVariable("id") Integer id)
            throws IOException {

        SaleOrderEntity saleOrderEntity = saleOrderService.findById(id).get();

            model.addAttribute("saleOrder",saleOrderEntity);

        List<SaleOrderProductsEntity> list = saleOrderProductService.saleOrderProductsEntityList(id);

        model.addAttribute("list",list);

        return "manager/detailOrder";
    }

    @RequestMapping(value = { "/admin/confirmSaleOrder/{id}" }, method = RequestMethod.GET)
    public String confirm(final Model model,
                          @PathVariable("id") Integer id)
            throws IOException {

        Optional<SaleOrderEntity> saleOrderEntity = saleOrderService.findById(id);

        saleOrderEntity.get().setStatus(true);

        saleOrderService.saveOrUpdate(saleOrderEntity.get());

        return "redirect:/admin/orderConf";
    }


}
