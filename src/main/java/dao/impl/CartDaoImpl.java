package dao.impl;

import model.Cart;
import dao.CartDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl extends GenericDaoImpl<Cart, Integer> implements CartDao {
}