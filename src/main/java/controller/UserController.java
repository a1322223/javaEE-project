package controller;

import model.*;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import service.*;
import org.apache.commons.codec.digest.DigestUtils;

import java.util.*;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    private UserService userService;

    private UserInfoService userInfoService;

    private MailService mailService;

    private CartService cartService;

    private RecordService recordService;

    private ProductService productService;


    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    @Autowired
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }

    @Autowired
    public void setUserInfoService(UserInfoService userInfoService) {
        this.userInfoService = userInfoService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setRecordService(RecordService recordService) {
        this.recordService = recordService;
    }

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping(value = "checkEmail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> checkEmail(String email) {
        Map<String, Boolean> data = new HashMap<>();
        data.put("emailExisted", false);
        if (userService.queryUserByEmail(email) != null) {
            data.put("emailExisted", true);
        }
        return data;
    }

    @RequestMapping("checkEmailForReset")
    private String checkEmailForReset(@RequestParam String email) {
        User user = userService.queryUserByEmail(email);
        if (user != null) {
            StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
            String token = strongPasswordEncryptor.encryptPassword(email);
            token = DigestUtils.md5Hex(token);
            long tokenTime = System.currentTimeMillis();
            UserInfo userInfo = new UserInfo();
            userInfo.setToken(token);
            userInfo.setTokenTime(tokenTime);
            userInfo.setUserId(user.getId());
            userInfoService.modify("modifyToken", userInfo);
            Mail mail = new Mail();
            mail.setEmailFrom("1351248201@qq.com");
            mail.setToEmails(email);
            mail.setSubject("重置密码");
            String link = " link: http://localhost:8080/user/resetPassword/" + user.getId() + "/" + token;
            mail.setContent(link);
            mailService.sendAttachMail(mail);
            System.out.println(link);
            session.setAttribute("message", "邮件已经发送");
            return "redirect:/email.jsp";
        }
        request.setAttribute("errorMessage", "邮箱不存在");
        return "/email.jsp";
    }

    @RequestMapping("resetPassword/{id}/{token}")
    private String resetPassword(@PathVariable int id, @PathVariable String token) {
        UserInfo userInfo = userInfoService.queryOne("queryUserInfoByUserId", id);
        long tokenTime = userInfo.getTokenTime();
        long currentTime = System.currentTimeMillis();
        int hour = (int) ((currentTime - tokenTime) / 1000 / 60 / 60);
        if (hour < 1) {
            if (token.equals(userInfo.getToken())) {
                session.setAttribute("id", userInfo.getUserId());
                return "redirect:/reset-password.jsp";
            }
        }
        session.setAttribute("message", "时间超时，请重试");
        return "/email.jsp";
    }

    @RequestMapping("resetPassword")
    private String resetPassword() {
        int id = (int) session.getAttribute("id");
        User user = userService.queryOne("queryUserById", id);
        String password = request.getParameter("password");
        StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
        user.setPassword(strongPasswordEncryptor.encryptPassword(password));
        userService.modify("resetPassword", user);
        return "redirect:/sign-in.jsp";
    }

    @RequestMapping("signUp")
    public String signUp(User user) {
        if (userService.signUp(user)) {
            return "redirect:/sign-in.jsp";
        }
        request.setAttribute("message", "邮箱已经存在！");
        return "/sign-up.jsp";
    }

    @RequestMapping("signIn")
    public String signIn(User user) {
        user = userService.signIn(user);
        if (user != null) {
            session.setAttribute("user", user);


            List<Record> recordList = recordService.queryList("queryFiveByUserId", user.getId());
            System.out.println("recordList : "+recordList);
            Set<Integer> uLoveSet = new HashSet<>();
            List<Integer> uLoveList = new LinkedList<>();

            for (Record r : recordList) {
                List<Product> list = productService.queryList("findFiveBySameCategoryId", r.getCategoryId());

                for (Product p:list) {
                    uLoveSet.add(p.getProductId());
                }
            }

            for (Integer i:uLoveSet) {
                uLoveList.add(i);
                if (uLoveList.size() == 5) {
                    break;
                }
            }

            System.out.println("uloveList : "+uLoveList);
            session.setAttribute("uLove",uLoveList);

            Integer cartNumber = (Integer) cartService.query("queryCartNumber", user.getId());
            if (cartNumber != null) {
                session.setAttribute("cartNumber", cartNumber);
            } else {
                session.setAttribute("cartNumber", 0);
            }
            return "redirect:/index.jsp";
        }
        request.setAttribute("message", "邮箱或者密码错误，请重新输入！");
        return "/sign-in.jsp";
    }

    @RequestMapping("signOut")
    public String signOut() {
        session.invalidate();
        return "redirect:/index.jsp";
    }
}
