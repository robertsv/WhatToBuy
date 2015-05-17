package lv.whattobuy.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import lv.whattobuy.dao.ItemDao;
import lv.whattobuy.dao.UserDao;
import lv.whattobuy.dto.Item;
import lv.whattobuy.dto.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/itemservice")
public class ItemRestService {

	private String CURRENT_USER = "user";

	@Autowired
	private UserDao userDao;

	@Autowired
	private ItemDao itemDao;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void addItem(@ModelAttribute Item item, HttpSession session) {
		User currentUser = initUser(session);
		item.setUserId(currentUser.getId());
		itemDao.add(item);
	}

	@RequestMapping(value = "/delete/{itemId}", method = RequestMethod.POST)
	@ResponseBody
	public void delete(@PathVariable long itemId) {
		Item item = itemDao.findById(itemId);
		itemDao.delete(item);
	}

	@RequestMapping(value = "/changeStatus/{itemId}/{status}", method = RequestMethod.POST)
	@ResponseBody
	public void changeStatus(@PathVariable long itemId,
			@PathVariable boolean status) {
		Item item = itemDao.findById(itemId);
		item.setStatus(status);
		itemDao.update(item);
	}

	@RequestMapping(value = "/getItems", method = RequestMethod.GET)
	@ResponseBody
	public List<Item> getItems(HttpSession session) {
		User currentUser = initUser(session);
		return itemDao.getByUser(currentUser);
	}

	private User initUser(HttpSession session) {
		User currentUser = (User) session.getAttribute(CURRENT_USER);

		if (currentUser == null) {
			org.springframework.security.core.userdetails.User springSecUser = (org.springframework.security.core.userdetails.User) SecurityContextHolder
					.getContext().getAuthentication().getPrincipal();
			String name = springSecUser.getUsername();
			currentUser = userDao.findByUserName(name);
			session.setAttribute(CURRENT_USER,
					session.getAttribute(CURRENT_USER));
		}
		return currentUser;
	}

}
