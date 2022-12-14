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
		htmlMsg += "<div>C???m ??n b???n ???? s??? d???ng d???ch v??? t???i: <b>Hades</b>!</div> <br/>";
		htmlMsg += "<div>B???n v???a ?????t h??ng v??o l??c: "+createdDate+"</div> <br/>";
		htmlMsg += "<div>T???ng tr??? gi?? ????n h??ng c???a b???n l??: "+total +" VN?? </div><br/>";
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
		
		//T???o h??a ????n
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
		
		//L???y c??c s???n ph???m cho v??o trong h??a ????n
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

		model.addAttribute("thongbao", "C???m ??n b???n ???? ?????t h??ng");
		
		session.setAttribute("cart", null);

//		StringBuilder sb = new StringBuilder();
//		sb.append("<div> C???m ??n b???n ???? ?????t h??ng </div> <br />");
//		sb.append("<div> Email ?????t h??ng: '"+ customerEmail +"'</div> <br />");
//		sb.append("<div> ?????a ch??? nh???n h??ng: '"+ customerAddress +"' </div> <br />");
//		sb.append("T???ng gi?? tr??? ????n h??ng: '"+tottal+"'<br />");

//		sendMail("henny112603@gmail.com",customerEmail,"????n h??ng t??? Hades shop",sb.toString());

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
			model.addAttribute("thongbao2","Gi??? h??ng tr???ng");
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

		// L???y th??ng tin gi??? h??ng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// L???y danh s??ch s???n ph???m c?? trong gi??? h??ng
		List<CartItem> cartItems = cart.getCartItems();

		// ki???m tra n???u c?? trong gi??? h??ng th?? t??ng s??? l?????ng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == newItem.getProductId() && item.getSize().equals(newItem.getSize())) {
				if(item.getQuanlity() < productService.findById(item.getProductId()).get().getQuantity()){
					isExists = true;
					item.setQuanlity(item.getQuanlity() + newItem.getQuanlity());
				}
				else{
					model.addAttribute("thongbao" ,"S??? l?????ng kh??ng ?????");
				}
			}
		}

		// n???u s???n ph???m ch??a c?? trong gi??? h??ng
		if (!isExists) {
			if(newItem.getQuanlity() > productService.findById(newItem.getProductId()).get().getQuantity()){
				model.addAttribute("thongbao" ,"S??? l?????ng kh??ng ?????");
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
		
		// tr??? k???t qu???
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("message", "Th??m v??o gi??? h??ng th??nh c??ng");

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
		// tr??? k???t qu???
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("total" , getTotal(request));
		jsonResult.put("message", "Thay ?????i th??nh c??ng");

		session.setAttribute("totalItems", getTotalItems(request));

		session.setAttribute("totalPrice" , getTotal(request));

		return ResponseEntity.ok(jsonResult);
	}

	
}
