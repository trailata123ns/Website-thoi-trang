package com.haui.shopthoitranghades.Controller.manager;

import com.haui.shopthoitranghades.Controller.user.BaseController;
import com.haui.shopthoitranghades.Entity.ContactEntity;
import com.haui.shopthoitranghades.Service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Optional;

@Controller
public class ManagerContactController extends BaseController {
    @Autowired
    ContactService contactService;

    @Autowired
    JavaMailSender mailSender;


    public void sendMail(String form, String to,  String content , String des) throws Exception {

        MimeMessage message = mailSender.createMimeMessage();
        message.setContent(message, "text/html; charset=utf-8");
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        String htmlMsg = "<div>Dear " + to + " !</div> <br/><br/>";
        htmlMsg += "<div>"+content+"</div> <br/>";
        htmlMsg += "<div> "+des +" </div><br/>";
        htmlMsg += "<div style=\"color: chartreuse;\"><b>Hades</b></div><br/>";
        message.setFrom(form);
        message.setContent(htmlMsg, "text/html; charset=utf-8");
        helper.setTo(to);
        helper.setSubject("Hades Store");

        mailSender.send(message);

    }


    @RequestMapping(value = "admin/contact" , method = RequestMethod.GET)
    public String getContact(Model model,
                             @RequestParam("p") Optional<Integer> p
    ){
        //Pagination
        Pageable pageable = PageRequest.of(p.orElse(0),5);
        Page<ContactEntity> page = contactService.findAll(pageable);

        model.addAttribute("contactList",page);

        return "manager/contact";
    }

    @RequestMapping(value = { "/admin/del-contact/{contactId}" }, method = RequestMethod.GET) // -> action
    public String deleteCategory(final Model model,
                                 final HttpServletRequest request,
                                 final HttpServletResponse response,
                                 @PathVariable("contactId") int contactId
    )
            throws Exception {
        Optional<ContactEntity> categoriesDelete = contactService.findById(contactId);
        contactService.delete(categoriesDelete);
        return "redirect:/admin/contact";
    }

    @RequestMapping(value = "admin/reply-category/{id}" , method = RequestMethod.GET)
    public String repContact(
            Model model ,
            @RequestParam("email") String email,
            @RequestParam("id") Integer id
    ){
        ContactEntity contactEntity = contactService.findById(id).get();

        model.addAttribute("contact",contactEntity);

        return "manager/repContact";
    }

    @RequestMapping(value = "admin/reply-category/{id}" , method = RequestMethod.POST)
    public String sendContact(
            Model model ,
            final HttpServletRequest request
    ) throws Exception {

        String email = request.getParameter("email");
        String title = request.getParameter("rep");
        String content = request.getParameter("description");

        sendMail("henny112603@gmail.com",email,title,content);

        return "redirect:/admin/contact";
    }

}
