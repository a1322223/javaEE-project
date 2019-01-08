package service.impl;

import dao.GenericDao;
import dao.UserDao;
import dao.UserInfoDao;
import model.User;
import model.UserInfo;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class UserServiceImpl extends GenericServiceImpl<User, Integer> implements UserService {
    private UserDao userDao;
    private UserInfoDao userInfoDao;
    private HttpServletRequest request;

    @Autowired
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Autowired
    public void setUserInfoDao(UserInfoDao userInfoDao) {
        this.userInfoDao = userInfoDao;
    }

    @Override
    @Autowired
    void setGenericDao(GenericDao<User, Integer> genericDao) {
        super.genericDao = genericDao;
        userDao = (UserDao) genericDao;
    }

     public User queryUserByEmail(String email) {
        return userDao.queryOne("queryUserByEmail", email);
    }

    @Override
    public boolean signUp(User user) {
        if (queryUserByEmail(user.getEmail()) != null) {
            return false;
        }
        StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
        user.setPassword(strongPasswordEncryptor.encryptPassword(user.getPassword()));
        userDao.create(user);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = simpleDateFormat.format(new Date());
        int userId = user.getId();
        UserInfo userInfo = new UserInfo(createTime, userId);
        userInfoDao.create(userInfo);
        return true;
    }

    @Override
    public User signIn(User user) {
        String plainPassword = user.getPassword();
        user = queryUserByEmail(user.getEmail());
        if (user != null) {
            String encryptedPassword = user.getPassword();
            StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
            if (strongPasswordEncryptor.checkPassword(plainPassword, encryptedPassword)) {
                UserInfo userInfo = user.getUserInfo();
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String updateTime = simpleDateFormat.format(new Date());
                String updateIp = request.getRemoteAddr();
                userInfo.setUpdateTime(updateTime);
                userInfo.setUpdateIp(updateIp);
                userInfoDao.modify("signInUpdate", userInfo);
                user.setUserInfo(userInfo);
                return user;
            }
        }
        return null;
    }

}
