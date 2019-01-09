package controller;

import model.Order;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.AddressService;
import service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController extends BaseController {
    private OrderService orderService;

@Autowired
public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @RequestMapping("create")
    public String create(Order order){
        orderService.create(order);
        return "redirect:";
    }
    @RequestMapping("remove")
    public String remove(Integer id){
        orderService.remove(id);
        return "redirect:";
    }
    @RequestMapping("queryById")
    public String queryById(){
        User user = (User) session.getAttribute("user");
        orderService.queryList("queryById", user.getId());
        return "redirect:";
    }
}
