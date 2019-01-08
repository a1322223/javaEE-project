package dao.impl;

import dao.UserInfoDao;
import model.UserInfo;
import org.springframework.stereotype.Repository;

@Repository
public class UserInfoImpl extends GenericDaoImpl<UserInfo,Integer> implements UserInfoDao {
}
