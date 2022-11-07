package com.haui.shopthoitranghades.Controller.manager;

import com.haui.shopthoitranghades.Controller.user.BaseController;
import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.ReviewEntity;
import com.haui.shopthoitranghades.Service.BlogService;
import com.haui.shopthoitranghades.Service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class ManagerBlogController extends BaseController {

    @Autowired
    ReviewService reviewService;

    @Autowired
    BlogService blogService;

    @RequestMapping(value = "admin/reviews" , method = RequestMethod.GET)
    public String reviewList(Model model){

        model.addAttribute("reviews" , reviewService.findAll());

        return "manager/reviews";
    }

    @RequestMapping(value = { "/admin/changeStatusReview" }, method = RequestMethod.GET) // -> action
    public String changeStatusProduct(final Model model,
                                      final HttpServletRequest request,
                                      final HttpServletResponse response,
                                      @RequestParam("id") Integer id)
            throws IOException {

        ReviewEntity reviewEntity = reviewService.findById(id).get();

        if(reviewEntity.getStatus() == true){
            reviewEntity.setStatus(false);
        }else{
            reviewEntity.setStatus(true);
        }

        reviewService.save(reviewEntity);

        return "redirect:/admin/reviews";
    }


    @RequestMapping(value = "admin/blogs" , method = RequestMethod.GET)
    public String blogList(Model model){

        model.addAttribute("blogs",blogService.findAll());

        return "manager/blogs";
    }



}
