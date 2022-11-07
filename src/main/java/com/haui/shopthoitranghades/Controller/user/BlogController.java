package com.haui.shopthoitranghades.Controller.user;

import com.haui.shopthoitranghades.Entity.BlogEntity;
import com.haui.shopthoitranghades.Service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class BlogController extends BaseController{

    @Autowired
    BlogService blogService;

    @RequestMapping(value = "blog" , method = RequestMethod.GET)
    public String aboutUs(
            final Model model
            ){

        List<BlogEntity> list = new ArrayList<BlogEntity>();

        list = (List<BlogEntity>) blogService.findAll();

        model.addAttribute("blogs",list);

        return "user/aboutus";
    }
}
