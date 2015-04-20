package lv.whattobuy.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ItemController {

	@RequestMapping("/item/view")
	public String addItem() {
		return "main";
	}

	@RequestMapping("/loginpage")
	public String doLogin() {
		return "login";
	}

}
