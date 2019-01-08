package dao.impl;

import dao.ProductDao;
import model.Product;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl extends GenericDaoImpl<Product,Integer> implements ProductDao {
}
