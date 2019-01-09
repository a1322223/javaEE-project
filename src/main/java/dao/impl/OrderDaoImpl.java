package dao.impl;

import dao.OrderDao;
import model.Order;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDaoImpl extends GenericDaoImpl<Order, Integer> implements OrderDao {
}
