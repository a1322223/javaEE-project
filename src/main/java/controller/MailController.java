package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import model.Mail;
import service.MailService;

@Controller
@RequestMapping("mail")
public class MailController {

    private MailService mailService;

    @Autowired
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }

    @RequestMapping("send")
    @ResponseBody
    private void send() {
        Mail mail = new Mail();
        mail.setEmailFrom("1351248201@qq.com");
        mail.setToEmails("1351248201@qq.com");
        mail.setSubject("测试邮件标题...");
        mail.setContent("测试邮件正文...");
        mailService.sendAttachMail(mail);
    }
}