package com.haui.shopthoitranghades.Controller.user;

import com.haui.shopthoitranghades.Entity.RoleEntity;
import com.haui.shopthoitranghades.Entity.UserEntity;
import com.haui.shopthoitranghades.Service.UserService;
import com.haui.shopthoitranghades.Untils.Utility;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginController extends BaseController{
	@Autowired
	UserService userService;

	@Autowired
	MailSender mailSender;


	public void sendMail(String recipientEmail, String link){

		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setFrom("henny112603@gmail.com");
		mailMessage.setTo(recipientEmail);

		String subject = "Here's the link to reset your password";

		String content = "<p>Hello,</p>"
				+ "You have requested to reset your password."
				+ "Click the link below to change your password:"
				+ "<a href=\"" + link + "\">Change my password</a>"
				+ "<br>";

		mailMessage.setSubject(subject);
		mailMessage.setText(content);

		mailSender.send(mailMessage);

	}
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET) // -> action
	public String login(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {

		return "login";
	}
	@RequestMapping(value = { "/register" }, method = RequestMethod.GET) // -> action
	public String register(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
			
		model.addAttribute("regis", new UserEntity());

		return "register";
	}
	@RequestMapping(value = { "/register" }, method = RequestMethod.POST) // -> action
	public String saveContact(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @ModelAttribute("regis") UserEntity regis)
			throws IOException {

		List<UserEntity> list = new ArrayList<UserEntity>();
		list = userService.findAll();

		for(int i = 0 ; i < list.size(); i++){
			if(list.get(i).getEmail().equals(regis.getEmail()) == true || list.get(i).getUsername().equals(regis.getUsername()) == true ){
				model.addAttribute("thongbao1", "Đăng ký không thành công");
				return "register";
			}
		}

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    String encodedPassword = passwordEncoder.encode(regis.getPassword());
	    regis.setPassword(encodedPassword);
	    RoleEntity role = new RoleEntity();
	    role.setName("GUEST");
	    role.setDescription("GUEST");
	    regis.addRoles(role);
		userService.save(regis);
		model.addAttribute("thongbao1", "Đăng ký thành công");
		
		return "register";
	}

	@RequestMapping(value = {"/forgot_password"}, method = RequestMethod.GET)
	public String forgotPassword(final Model model,
						   final HttpServletRequest request,
						   final HttpServletResponse response)
			throws IOException {

		return "user/forgot_password";
	}

	@RequestMapping(value = { "/forgot_password" }, method = RequestMethod.POST)
	public String forgotPasswordP(final Model model,
								 final HttpServletRequest request,
								 final HttpServletResponse response)
			throws IOException {

		String email = request.getParameter("email");
		String token = RandomString.make(45);

		try {
			userService.updateResetPasswordToken(token, email);
			String resetPasswordLink = Utility.getSiteURL(request) + "/reset_password?token=" + token;
			sendMail(email, resetPasswordLink);
			model.addAttribute("message", "We have sent a reset password link to your email. Please check.");

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return "user/forgot_password";
	}

	@RequestMapping(value = { "/reset_password" }, method = RequestMethod.GET)
	public String resetPassword(final Model model,
								  final HttpServletRequest request,
								  final HttpServletResponse response ,
								  @Param(value = "token") String token)
			throws IOException {

		UserEntity customer = userService.getByResetPasswordToken(token);
		model.addAttribute("token", token);

		if (customer == null) {
			model.addAttribute("message", "Invalid Token");
			return "message";
		}

		return "user/reset_password";
	}

	@RequestMapping(value = { "/reset_password" }, method = RequestMethod.POST)
	public String resetPasswordP(final Model model,
								  final HttpServletRequest request,
								  final HttpServletResponse response)
			throws IOException {

		String token = request.getParameter("token");
		String password = request.getParameter("password");

		UserEntity customer = userService.getByResetPasswordToken(token);
		model.addAttribute("title", "Reset your password");

		if (customer == null) {
			model.addAttribute("message", "Invalid Token");
			return "message";
		} else {
			userService.updatePassword(customer, password);

			model.addAttribute("message", "You have successfully changed your password.");
		}

		return "redirect:/login";
	}

	@RequestMapping(value = {"/customerInfo"}, method = RequestMethod.GET)
	public String customerInfo(final Model model,
								 final HttpServletRequest request,
								 final HttpServletResponse response)
			throws IOException {

		return "user/customerInfo";
	}

	@RequestMapping(value = {"/customerInfo"}, method = RequestMethod.POST)
	public String updateCustomerInfo(final Model model,
							   final HttpServletRequest request,
							   final HttpServletResponse response)
			throws IOException {

		String userName = request.getParameter("customerName");
		String email = request.getParameter("customerEmail");
		String address = request.getParameter("customerAddress");
		String phone = request.getParameter("customerPhone");

		UserEntity user = userService.loadUserByUserName(userName);

		if(user.getId() != null){
			user.setEmail(email);
			user.setAddress(address);
			user.setPhone(phone);
			userService.save(user);
			model.addAttribute("thongbao","Cập nhật thông tin thành công");
		}
		return "redirect:/home";
	}

}
