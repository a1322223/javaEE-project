package service.impl;

import dao.CartDao;
import model.Cart;
import service.CartService;
import dao.GenericDao;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

@Service
public class CartServiceImpl extends GenericServiceImpl<Cart, Integer> implements CartService {
    @Override
    @Autowired
    void setGenericDao(GenericDao<Cart, Integer> genericDao) {
        super.genericDao = genericDao;
    }

}