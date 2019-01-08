package controller;

import model.Address;
import model.Category;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import model.Cart;
import service.AddressService;
import service.CartService;
import service.CategoryService;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("cart")
public class CartController extends BaseController {

    private final CartService cartService;

    private AddressService addressService;
    private CategoryService categoryService;

    @Autowired
    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    @Autowired
    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }
    @RequestMapping("create")
    @ResponseBody
    private Map<String, Boolean> create(Cart cart) {
        User user = (User) session.getAttribute("user");
        cart.setUserId(user.getId());
        Integer cartId = (Integer) cartService.query("queryCartId", cart);
        if (cartId == null) {
            cartService.create(cart);
        } else {
            cartService.modify("updateNumberById", cart);
        }
        Map<String, Boolean> map = new HashMap();
        map.put("result", true);
        return map;
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        cartService.remove(id);
        return "redirect:/cart/queryAll";
    }

    @RequestMapping("modifyNumber")
    @ResponseBody
    private Map<String, Boolean> modify(@RequestParam int productId, @RequestParam int number) {
        User user = (User) session.getAttribute("user");
        Cart cart = new Cart();
        cart.setUserId(user.getId());
        cart.setNumber(number);
        cart.setProductId(productId);
        cartService.modify("updateNumberById", cart);
        Map<String, Boolean> map = new HashMap();
        map.put("result", true);
        return map;
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        User user = (User) session.getAttribute("user");
        Integer cartNumber = (Integer) cartService.query("queryCartNumber", user.getId());
        if (cartNumber != null) {
            session.setAttribute("cartNumber", cartNumber);
        } else {
            session.setAttribute("cartNumber", 0);
        }
        session.setAttribute("list", cartService.queryList("queryAll", user.getId()));
        return "redirect:/cart.jsp";
    }

    @RequestMapping("resetCartPage")
    private void resetCartPage() {
        User user = (User) session.getAttribute("user");
        session.setAttribute("list", cartService.queryList("queryAll", user.getId()));
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("cart", cartService.queryById(id));
        return "redirect:/cart/edit.jsp";
    }

    @RequestMapping("queryCartNumber")
    @ResponseBody
    private Map<String, Object> queryCartNumber() {
        User user = (User) session.getAttribute("user");
        int cartNumber = 0;
        if (user != null) {
            cartNumber = (int) cartService.query("queryCartNumber", user.getId());
        }
        Map<String, Object> map = new HashMap<>();
        map.put("cartNumber", cartNumber);
        List<Category> categories = categoryService.queryList("queryCategoryTree", null);
        map.put("categories", categories);

        return map;
    }

    @RequestMapping("batchRemove")
    private String batchRemove(@RequestParam int[] productIds) {
        System.out.println(Arrays.toString(productIds));
        for (int productId : productIds) {
            removeByProductId(productId);
        }
        return "redirect:/cart/queryAll";
    }
    private void removeByProductId(int productId) {
        cartService.remove(productId);
    }

    @RequestMapping("orderConfirm")
    @ResponseBody
    private Map<String, Boolean> orderConfirm(@RequestParam("ids[]") List<Integer> ids) {
        User user = (User) session.getAttribute("user");
        Map<String,Object> paraMap = new HashMap<>();
        paraMap.put("id",user.getId());
        paraMap.put("list",ids);
        List<Cart> list = cartService.queryList("orderConfirm", paraMap);
        session.setAttribute("list",list);
        System.out.println(list);
        if(addressService.queryOne("queryDefaultAddress", user.getId())!=null){
            Address address = addressService.queryOne("queryDefaultAddress", user.getId()) ;
            session.setAttribute("address", address);
        }else {
            Address address = addressService.queryOne("queryFirstAddress", user.getId()) ;
            session.setAttribute("address", address);
        }

        Map<String, Boolean> map = new HashMap<>();
        map.put("result", true);
        return map;
    }

    @RequestMapping("confirmOrder")
    @ResponseBody
    private Map<String, Boolean> confirmOrder(@RequestParam("ids[]") List<Integer> ids) {
        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("id", userId);
        paramMap.put("list", ids);
        session.setAttribute("list", cartService.queryList("confirmOrder", paramMap));

        session.setAttribute("address", addressService.queryOne("queryDefaultAddress", userId));

        Map<String, Boolean> map = new HashMap<>();
        map.put("result", true);
        return map;
    }
}