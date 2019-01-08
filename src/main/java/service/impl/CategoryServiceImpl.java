package service.impl;

import dao.GenericDao;
import model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CategoryService;

@Service
public class CategoryServiceImpl extends GenericServiceImpl<Category,Integer> implements CategoryService {
    @Override
    @Autowired
    void setGenericDao(GenericDao<Category, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}
