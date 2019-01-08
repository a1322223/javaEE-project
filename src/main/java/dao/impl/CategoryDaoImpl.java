package dao.impl;

import dao.CategoryDao;
import model.Category;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl extends GenericDaoImpl<Category,Integer> implements CategoryDao {
}
