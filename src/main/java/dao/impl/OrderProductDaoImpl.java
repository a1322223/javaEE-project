package dao.impl;

import dao.OrderProductDao;
import model.OrderProduct;
import org.springframework.stereotype.Repository;

@Repository
public class OrderProductDaoImpl extends GenericDaoImpl<OrderProduct, Integer> implements OrderProductDao {
}
