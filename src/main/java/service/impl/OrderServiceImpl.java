package service.impl;

import dao.GenericDao;
import model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.OrderService;
@Service
public class OrderServiceImpl extends GenericServiceImpl<Order, Integer> implements OrderService {
    @Override
    @Autowired
    void setGenericDao(GenericDao<Order, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}
