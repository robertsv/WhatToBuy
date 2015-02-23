package lv.whattobuy.dao;

import lv.whattobuy.dto.User;


public interface UserDao extends CrudDao<User> {
	User findByUserName(String userName);
}
