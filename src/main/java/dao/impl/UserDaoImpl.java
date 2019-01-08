package dao.impl;

import dao.UserDao;
import model.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl extends GenericDaoImpl<User,Integer> implements UserDao {
}
