package controller;

import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserInfoService;

@Controller
@RequestMapping("userInfo")
public class UserInfoController extends BaseController {
    private UserInfoService userInfoService;

    @Autowired
    public void setUserInfoService(UserInfoService userInfoService) {
        this.userInfoService = userInfoService;
    }

    @RequestMapping("queryAll")
    private String queryAll(){
        User user = (User) session.getAttribute("user");
        session.setAttribute("userInfo", userInfoService.queryOne("queryUserInfoByUserId",user.getId()));
        return "redirect:/portal/userInfo.jsp";
    }

    @RequestMapping("modify")
    private String modify(){

        return "redirect:/index.jsp";
    }
}
