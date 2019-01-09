package service.impl;

import dao.GenericDao;
import model.OrderProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.OrderProductService;
@Service
public class OrderProductServiceImpl extends GenericServiceImpl<OrderProduct, Integer> implements OrderProductService {
    @Override
    @Autowired
    void setGenericDao(GenericDao<OrderProduct, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}
