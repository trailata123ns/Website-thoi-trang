package com.haui.shopthoitranghades.Controller.user;

import com.haui.shopthoitranghades.Dto.Cart;
import com.haui.shopthoitranghades.Dto.CartItem;
import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderEntity;
import com.haui.shopthoitranghades.Entity.SaleOrderProductsEntity;
import com.haui.shopthoitranghades.Service.ProductService;
import com.haui.shopthoitranghades.Service.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController extends BaseController {

	@Autowired
	ProductService productService;
	
	@Autowired(required = false)
	SaleOrderService saleOrderService;

	@Autowired
	JavaMailSender mailSender;


	public void sendMail(String form, String to, String userName , int total , Date createdDate) throws Exception {

		MimeMessage message = mailSender.createMimeMessage();
		message.setContent(message, "text/html; charset=utf-8");
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

		String htmlMsg = "<div>Dear " + userName + " !</div> <br/><br/>";
		htmlMsg += "<div>Cảm ơn bạn đã sử dụng dịch vụ tại: <b>Hades</b>!</div> <br/>";
		htmlMsg += "<div>Bạn vừa đặt hàng vào lúc: "+createdDate+"</div> <br/>";
		htmlMsg += "<div>Tổng trị giá đơn hàng của bạn là: "+total +" VNĐ </div><br/>";
		htmlMsg += "<div style=\"color: chartreuse;\"><b>Hades</b></div><br/>";
		message.setFrom(form);
		message.setContent(htmlMsg, "text/html; charset=utf-8");
		helper.setTo(to);
		helper.setSubject("Hades Store");

		mailSender.send(message);

	}
	
	@RequestMapping(value = { "/cart/finish" }, method = RequestMethod.POST) // -> action
	public String cartFinish(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws Exception {
		
		String customerName = request.getParameter("customerName");
		String customerAddress = request.getParameter("customerAddress");
		String customerPhone = request.getParameter("customerPhone");
		String customerEmail = request.getParameter("customerEmail");
		
		//Tạo hóa đơn
		SaleOrderEntity saleOrderEntity = new SaleOrderEntity();
		saleOrderEntity.setCode(String.valueOf(System.currentTimeMillis()));
		saleOrderEntity.setCustomerName(customerName);
		saleOrderEntity.setCustomerAddress(customerAddress);
		saleOrderEntity.setCustomerPhone(customerPhone);
		saleOrderEntity.setCustomerEmail(customerEmail);
		saleOrderEntity.setStatus(false);

		LocalDateTime current = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formatted = current.format(formatter);
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(formatted);
		saleOrderEntity.setCreatedDate(date);

		if(isLogined()) {
			saleOrderEntity.setUser(getUserLogined());
		}
		
		//Lấy các sản phẩm cho vào trong hóa đơn
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");

		int tottal = 0;
		for(CartItem cartItem:cart.getCartItems()) {
			ProductsEntity productsEntity = productService.findById(cartItem.getProductId()).get();
			SaleOrderProductsEntity saleOrderProductsEntity = new SaleOrderProductsEntity();
			saleOrderProductsEntity.setProduct(productService.findById(cartItem.getProductId()).get());
			saleOrderProductsEntity.setQuality(cartItem.getQuanlity());
			saleOrderProductsEntity.setSize(cartItem.getSize());
			saleOrderProductsEntity.setCreatedDate(date);
			tottal += cartItem.getQuanlity() * cartItem.getPriceUnit();
			saleOrderEntity.addRelationProduct(saleOrderProductsEntity);
			productsEntity.setQuantity(productsEntity.getQuantity() - cartItem.getQuanlity());
		}

		saleOrderEntity.setTotal(tottal);

		saleOrderService.saveOrUpdate(saleOrderEntity);

		model.addAttribute("thongbao", "Cảm ơn bạn đã đặt hàng");
		
		session.setAttribute("cart", null);

//		StringBuilder sb = new StringBuilder();
//		sb.append("<div> Cảm ơn bạn đã đặt hàng </div> <br />");
//		sb.append("<div> Email đặt hàng: '"+ customerEmail +"'</div> <br />");
//		sb.append("<div> Địa chỉ nhận hàng: '"+ customerAddress +"' </div> <br />");
//		sb.append("Tổng giá trị đơn hàng: '"+tottal+"'<br />");

//		sendMail("henny112603@gmail.com",customerEmail,"Đơn hàng từ Hades shop",sb.toString());

//		sendMail("henny112603@gmail.com",customerEmail,customerName,tottal,date);
		
		return "redirect:/home"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/cart/view" }, method = RequestMethod.GET) // -> action
	public String cartView(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException , NullPointerException {

		try{
			HttpSession httpSession = request.getSession();

			Cart cart = (Cart) httpSession.getAttribute("cart");

			List<CartItem> cartItems = cart.getCartItems();

			int totalPrice = 0;

			for (CartItem item : cartItems) {
				totalPrice += item.getPriceUnit() * item.getQuanlity();
			}

			httpSession.setAttribute("totalPrice", totalPrice);
		}catch (NullPointerException e){
			model.addAttribute("thongbao2","Giỏ hàng trống");
		}

		return "user/shopping-cart";
	}

	@RequestMapping(value = { "/checkout" }, method = RequestMethod.GET) // -> action
	public String checkOut(final Model model,
						   final HttpServletRequest request,
						   final HttpServletResponse response)
			throws IOException {

		return "user/checkout";
	}
	
	@RequestMapping(value = { "/cart/add" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem newItem) {

		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == newItem.getProductId() && item.getSize().equals(newItem.getSize())) {
				if(item.getQuanlity() < productService.findById(item.getProductId()).get().getQuantity()){
					isExists = true;
					item.setQuanlity(item.getQuanlity() + newItem.getQuanlity());
				}
				else{
					model.addAttribute("thongbao" ,"Số lượng không đủ");
				}
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			if(newItem.getQuanlity() > productService.findById(newItem.getProductId()).get().getQuantity()){
				model.addAttribute("thongbao" ,"Số lượng không đủ");
			}
			else{
				ProductsEntity productInDb = productService.findById(newItem.getProductId()).get();
				newItem.setProductName(productInDb.getTitle());
				newItem.setPriceUnit(productInDb.getPriceSale());
				newItem.setProductImage(productInDb.getAvatar());
				newItem.setSize(newItem.getSize());
				cart.getCartItems().add(newItem);
			}
		}
		
		// trả kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("message", "Thêm vào giỏ hàng thành công");

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

	private int getTotal(final HttpServletRequest request){
		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getPriceUnit();
		}
		return total;
	}



	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}
	@RequestMapping(value = { "/cart-delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteItemInCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem cartItem) {
		HttpSession httpSession = request.getSession();

		Cart cart = (Cart) httpSession.getAttribute("cart");

		List<CartItem> cartItems = cart.getCartItems();
		int totalPrice = 0;

		for (int i = 0; i < cartItems.size(); i++) {
			if (cartItems.get(i).getProductId() == cartItem.getProductId()) {
				cartItems.remove(i);
				break;
			}
		}
		for (CartItem item : cartItems) {
			totalPrice += item.getPriceUnit();
		}

		httpSession.setAttribute("totalItems", getTotalItems(request));
		httpSession.setAttribute("totalPrice", totalPrice);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}


	@RequestMapping(value = { "/cart/update" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updateCart(final ModelMap model, final HttpServletRequest request,
														 final HttpServletResponse response, @RequestBody CartItem newItem) {

		HttpSession session = request.getSession();
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		}

		List<CartItem> cartItems = cart.getCartItems();

		System.out.println(newItem.getProductId());


		for(int i = 0 ; i < cartItems.size(); i++){
			if(cartItems.get(i).getProductId() == newItem.getProductId()){
				cartItems.get(i).setQuanlity(newItem.getQuanlity());
				break;
			}
		}
		// trả kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("total" , getTotal(request));
		jsonResult.put("message", "Thay đổi thành công");

		session.setAttribute("totalItems", getTotalItems(request));

		session.setAttribute("totalPrice" , getTotal(request));

		return ResponseEntity.ok(jsonResult);
	}

	
}
