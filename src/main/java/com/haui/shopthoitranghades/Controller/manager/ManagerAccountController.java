package com.haui.shopthoitranghades.Controller.manager;

import com.haui.shopthoitranghades.Controller.user.BaseController;
import com.haui.shopthoitranghades.Entity.ReviewEntity;
import com.haui.shopthoitranghades.Entity.UserEntity;
import com.haui.shopthoitranghades.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class ManagerAccountController extends BaseController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "admin/account" , method = RequestMethod.GET)
    public String reviewList(Model model){

        model.addAttribute("accounts" , userService.findAll());

        return "manager/account-list";
    }

    @RequestMapping(value = { "/admin/changeStatusAccount" }, method = RequestMethod.GET) // -> action
    public String changeStatusProduct(final Model model,
                                      final HttpServletRequest request,
                                      final HttpServletResponse response,
                                      @RequestParam("id") Integer id)
            throws IOException {

        UserEntity user = userService.getById(id);

        if(user.getStatus() == true){
            user.setStatus(false);
        }else{
            user.setStatus(true);
        }

        userService.save(user);

        return "redirect:/admin/account";
    }

}
