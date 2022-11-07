package com.haui.shopthoitranghades.Controller.user;

import com.haui.shopthoitranghades.Dto.Contact;
import com.haui.shopthoitranghades.Entity.CategoryEntity;
import com.haui.shopthoitranghades.Entity.ContactEntity;
import com.haui.shopthoitranghades.Entity.ProductsEntity;
import com.haui.shopthoitranghades.Service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Controller
public class ContactController extends BaseController{

    @Autowired
    ContactService contactService;

    @RequestMapping(value = "/contact" , method = RequestMethod.GET)
    public String getAllProduct(final Model model
    ){
        model.addAttribute("contactTiki", new Contact());
        return "user/contact";
    }

    @RequestMapping(value = { "/contactTiki-ajax" }, method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> contactAjax(final Model model ,
                                                           final HttpServletRequest request,
                                                           final HttpServletResponse response,
                                                           final @RequestBody Contact contact) {
        Map<String, Object> jsonResult = new HashMap<String, Object>();

        ContactEntity contactEntity = new ContactEntity();
        contactEntity.setEmail(contact.getTxtEmail());
        contactEntity.setMessage(contact.getTxtComments());
        contactEntity.setFirstName(contact.getTxtName());
        contactEntity.setLastName(contact.getTxtName());
        contactEntity.setRequestType(contact.getTxtTitle());

        contactService.save(contactEntity);

        jsonResult.put("code", 200);
        jsonResult.put("message", "Gửi hỗ trợ thành công với địa chỉ email"+ contact.getTxtEmail());
        return ResponseEntity.ok(jsonResult);
    }


}
