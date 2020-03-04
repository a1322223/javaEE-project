package controller;

import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import model.Address;
import service.AddressService;

import java.util.List;

@Controller
@RequestMapping("address")
public class AddressController extends BaseController {

    private final AddressService addressService;

    @Autowired
    public AddressController(AddressService addressService) {
        this.addressService = addressService;
    }

    @RequestMapping("create")
    private String create(Address address,@RequestParam("isOrder") int isOrder) {
        User user = (User) session.getAttribute("user");
        address.setUserId(user.getId());
        addressService.create(address);
        if (address.getStatus() == 1) {
            unsetDefaultAddress(address.getId());
        }
        if(isOrder==1){
            return "redirect:/order-confirm.jsp";
        }
        return "redirect:/address/queryAll";
    }

    @RequestMapping("setDefault/{id}")
    private String setDefault(@PathVariable int id) {
        unsetDefaultAddress(id);
        setDefaultAddress(id);
        return "redirect:/address/queryAll";
    }

    private void setDefaultAddress(int id) {
        addressService.modify("setDefaultAddress", id);
    }

    private void unsetDefaultAddress(int id) {
        addressService.modify("unsetDefaultAddress", id);
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        addressService.remove(id);
        return "redirect:/address/queryAll";
    }

    @RequestMapping("modify/{isOrder}")
    private String modify(Address address, @PathVariable("isOrder") int isOrder) {
        addressService.modify(address);
        if (address.getStatus() == 1) {
            unsetDefaultAddress(address.getId());
        }
        if(isOrder == 1){
            return "redirect:/order-confirm.jsp";
        }
        return "redirect:/address/queryAll";
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        User user = (User) session.getAttribute("user");
        session.setAttribute("list", addressService.queryList("queryAll", user.getId()));
        return "redirect:/portal/address/list.jsp";
    }

    @RequestMapping("queryAllList")
    @ResponseBody
    private List<Address> queryAllList(){
        User user = (User) session.getAttribute("user");
        List<Address> addressList =  addressService.queryList("queryAll", user.getId());
        return addressList;
    }

    @RequestMapping("queryById/{id}/{isOrder}")
    private String queryById(@PathVariable("id") Integer id, @PathVariable("isOrder") Integer isOrder) {
        session.setAttribute("address", addressService.queryById(id));
        return "redirect:/portal/address/edit.jsp?isOrder="+isOrder;
    }

    @RequestMapping("queryById/{id}")
    @ResponseBody
    private Address queryById(@PathVariable("id") Integer id){
        Address address = addressService.queryById(id);
        return address;
    }
}