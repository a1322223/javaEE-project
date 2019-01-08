package service.impl;

import dao.GenericDao;
import dao.UserDao;
import model.User;
import model.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserInfoService;
@Service
public class UserInfoServiceImpl  extends GenericServiceImpl<UserInfo,Integer> implements UserInfoService {

    @Override
    @Autowired
    void setGenericDao(GenericDao<UserInfo, Integer> genericDao) {
        super.genericDao = genericDao;

    }


}
