package controller;

import model.OrderProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.OrderProductService;

@Controller
@RequestMapping("orderProduct")
public class OrderProductController extends BaseController {
    private OrderProductService orderProductService;

@Autowired
    public void setOrderProductService(OrderProductService orderProductService) {
        this.orderProductService = orderProductService;
    }

    public String create(OrderProduct orderProduct){
    orderProductService.create(orderProduct);
    return "redirect:";
    }
}
