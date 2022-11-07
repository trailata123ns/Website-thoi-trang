package com.haui.shopthoitranghades.Controller.user;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.haui.shopthoitranghades.Entity.UserEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


public abstract class BaseController {

	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page")) - 1;
		}catch (Exception e) {
			// TODO: handle exception
			return -1;
		}
	}
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}

	@ModelAttribute("userLogined")
	public UserEntity getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (UserEntity) userLogined;
		return null;
	}
	
	
	@ModelAttribute("projectTitle")
	public String projectTitle() {
		return "Hades";
	}


}
