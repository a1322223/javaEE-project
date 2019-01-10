package controller;

import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.AddressService;
import service.OrderService;

import java.util.ArrayList;
import java.util.List;

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
    @RequestMapping("addOrder/{adressId}")
    @ResponseBody
    public String addOrder(@PathVariable("adressId") int addressId){
        User user = (User) session.getAttribute("user");
      //  List<Cart> cartList = (List<Cart>) session.getAttribute("list");
//        List<OrderProduct> orderProductList = new ArrayList<>();
//
//        double totalPrice = (double) session.getAttribute("totalPrice");
//        double totalDiscount = (double) session.getAttribute("totalPrice");
//
//        Order order = new Order();
//        order.setOrderProducts(orderProductList);
//        order.setTotalPrice(totalPrice-totalDiscount);
//        order.setStatus(0);
//        order.setAddressId(addressId);
//        order.setUserId(user.getId());
//        System.out.println("创建的订单测试："+order);
//        return order;
        return "";
    }
}
