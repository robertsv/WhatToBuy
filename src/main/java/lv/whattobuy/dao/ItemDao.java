package lv.whattobuy.dao;

import java.util.List;

import lv.whattobuy.dto.Item;
import lv.whattobuy.dto.User;


public interface ItemDao extends CrudDao<Item> {
	
	List<Item> getByUser(User user);
}
