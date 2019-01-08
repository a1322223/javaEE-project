package dao.impl;

import dao.GenericDao;
import model.Cart;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import util.Constants;
import util.Pagination;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public class GenericDaoImpl<T extends Serializable, ID extends Number> implements GenericDao<T, ID> {
    private SqlSession sqlSession;
    private String namespace;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public SqlSession getSqlSession() {
        return sqlSession;
    }

    GenericDaoImpl() {
        ParameterizedType parameterizedType = (ParameterizedType) getClass().getGenericSuperclass();
        Class<T> clazz = (Class<T>) parameterizedType.getActualTypeArguments()[0];
        namespace = StringUtils.uncapitalize(clazz.getSimpleName());
    }

    private String getStatement(String sqlId) {
        return namespace.concat(".").concat(sqlId);
    }

    @Override
    public void create(T t) {
        sqlSession.insert(getStatement("create"), t);
    }

    @Override
    public List<T> queryAll() {
        return sqlSession.selectList(getStatement("queryAll"));
    }

    @Override
    public T queryById(ID id) {
        return sqlSession.selectOne(getStatement("queryById"), id);
    }

    @Override
    public void modify(T t) {
        sqlSession.update(getStatement("modify"), t);
    }

    @Override
    public void remove(ID id) {
        sqlSession.delete(getStatement("remove"), id);
    }

    @Override
    public void create(String sqlId, Object parameter) {
        sqlSession.insert(getStatement(sqlId), parameter);
    }

    @Override
    public T queryOne(String sqlId, Object parameter) {
        return sqlSession.selectOne(getStatement(sqlId), parameter);
    }

    @Override
    public void modify(String sqlId, Object parameter) {
        sqlSession.update(getStatement(sqlId), parameter);
        if(parameter instanceof Cart){
            System.out.println("sdfgfdsdfgfdsfds:"+((Cart) parameter).getNumber());
        }
    }

    @Override
    public List<T> queryList(String sqlId, Object parameter) {
        return sqlSession.selectList(getStatement(sqlId), parameter);
    }

    @Override
    public Pagination<T> queryAll(int currentPage) {
        return getPagination("queryAll",null,currentPage);
    }

    @Override
    public Pagination<T> query(String sqlId, Object parameter, int currentPage) {
        return getPagination(sqlId,parameter,currentPage);
    }

    @Override
    public Object query(String sqlId, Object parameter) {
        return sqlSession.selectOne(getStatement(sqlId), parameter);
    }

    private Pagination<T> getPagination(String sqlId,Object parameter,int currentPage) {
        int pageSize = Constants.PAGE_SIZE;
        int totalRows = sqlSession.selectList(getStatement(sqlId),parameter).size();
        int totalPages = (int) Math.ceil(totalRows/(double)pageSize);
        RowBounds rowBounds = new RowBounds(pageSize*(currentPage-1),pageSize);
        List<T> list = sqlSession.selectList(getStatement(sqlId), parameter, rowBounds);
        return new Pagination<>(list, sqlId, pageSize, totalRows, totalPages, currentPage);
    }

}
