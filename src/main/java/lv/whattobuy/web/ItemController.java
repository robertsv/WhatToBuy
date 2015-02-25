package lv.whattobuy.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/item")
public class ItemController {

	@RequestMapping("/view")
	public String addItem() {
		return "main";
	}

}
