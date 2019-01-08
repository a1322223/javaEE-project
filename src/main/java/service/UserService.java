package service;

import model.User;

public interface UserService extends GenericService<User,Integer> {

     boolean signUp(User user);

     User signIn(User user);

     User queryUserByEmail(String email);
}
