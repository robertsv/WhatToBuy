package lv.whattobuy.web;

import java.util.LinkedList;
import java.util.List;

import lv.whattobuy.dao.ItemDao;
import lv.whattobuy.dao.UserDao;
import lv.whattobuy.dto.Item;
import lv.whattobuy.dto.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/itemservice")
public class ItemRestService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private ItemDao itemDao;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void addItem(@ModelAttribute Item item) {
		System.out.println("Item to be added: " + item.getName());
		
		// TODO (RV):
		User currntUser = userDao.findByUserName("robertsv");

		item.setUserId(currntUser.getId());

		itemDao.add(item);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void delete(@PathVariable long itemId) {
	}
	
	@RequestMapping(value = "/changeStatus/{id}/{status}", method = RequestMethod.POST)
	@ResponseBody
	public void changeStatus(@PathVariable long itemId, @PathVariable boolean status) {
		System.out.println("Item to be changes: " + itemId + " item status: " + status);
	}
	
	
	@RequestMapping(value = "/getItems", method = RequestMethod.GET)
	@ResponseBody
	public List<Item> getItems() {
		Item i1 = new Item();
		
		i1.setId(1L);
		i1.setName("name1");
		i1.setStatus(false);
		
		Item i2 = new Item();
		
		i2.setId(2L);
		i2.setName("name2");
		i2.setStatus(true);
		
		
		List<Item> l = new LinkedList<Item>();
		l.add(i1);
		l.add(i2);
		
		return itemDao.getAll();
		
	}
	
	

}
