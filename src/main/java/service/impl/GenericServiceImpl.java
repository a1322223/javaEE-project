package service.impl;

import dao.GenericDao;
import org.springframework.beans.factory.annotation.Autowired;
import service.GenericService;
import util.Pagination;

import java.io.Serializable;
import java.util.List;

public abstract class GenericServiceImpl<T extends Serializable, ID extends Number> implements GenericService<T, ID> {

    GenericDao<T, ID> genericDao;


    abstract void setGenericDao(GenericDao<T, ID> genericDao);

    public GenericDao<T, ID> getGenericDao() {
        return genericDao;
    }

    @Override
    public void create(T t) {
        genericDao.create(t);
    }

    @Override
    public List<T> queryAll() {
        return genericDao.queryAll();
    }

    @Override
    public T queryById(ID id) {
        return genericDao.queryById(id);
    }

    @Override
    public void modify(T t) {
        genericDao.modify(t);
    }

    @Override
    public void remove(ID id) {
        genericDao.remove(id);
    }

    @Override
    public void create(String sqlId, Object parameter) {
        genericDao.create(sqlId, parameter);
    }

    @Override
    public T queryOne(String sqlId, Object parameter) {
        return genericDao.queryOne(sqlId, parameter);
    }

    @Override
    public void modify(String sqlId, Object parameter) {
        genericDao.modify(sqlId, parameter);
    }

    @Override
    public List<T> queryList(String sqlId, Object parameter) {
        return genericDao.queryList(sqlId, parameter);
    }

    @Override
    public Pagination<T> queryAll(int currentPage) {
        return genericDao.queryAll(currentPage);
    }

    @Override
    public Pagination<T> query(String sqlId, Object parameter, int currentPage) {
        return genericDao.query(sqlId, parameter, currentPage);
    }
    @Override
    public Object query(String sqlId, Object parameter) {
        return genericDao.query(sqlId, parameter);
    }
}
