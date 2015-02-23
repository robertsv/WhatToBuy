package lv.whattobuy.web;

import lv.whattobuy.dao.UserDao;
import lv.whattobuy.dto.Item;
import lv.whattobuy.dto.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping("/view")
	public String addItem() {
		return "main";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public String addItem(@ModelAttribute Item item) {
		
		System.out.println("Item to be added: " + item.getName());
		
		User currntUser = userDao.findByUserName("robertsv");
		
		System.out.println(currntUser.getName());
		
		return "ok";
	}
	
	@RequestMapping("/delete/{id}")
	public void addDelete(@PathVariable long itemId) {
	}
	
	

}
