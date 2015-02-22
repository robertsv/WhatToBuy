package lv.whattobuy.web;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.table;

import java.util.concurrent.Callable;

import lv.whattobuy.domain.tables.Item;
import lv.whattobuy.domain.tables.User;

import org.jooq.DSLContext;
import org.jooq.Record;
import org.jooq.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Async
public class ExampleController {
	
	@Autowired
    DSLContext create;

	@RequestMapping("/login")
	public String doLogin() {
		System.out.println(create.select(field("name")).from(table("item")).getSQL());
		
		Result<Record> result = create.select().from(Item.ITEM).join(User.USER).on(User.USER.ID.equal(Item.ITEM.USER_ID)).fetch();
		for (Record record : result) {
			System.out.println(record.toString());
		}
		
		return "login";
	}
	
	@RequestMapping("/main")
	public String doMain() {
		
		return "main";
	}
	
	@RequestMapping("/test")
	public String doTest() {
		
		return "test";
	}
	
	@RequestMapping("/testAsync1")
	public Callable<String> doTestAsync1() {
		return new Callable<String>() {
	        public String call() throws Exception {
	        	for (int i = 0; i < 5; i++) {
	        		System.out.println(i);
	        		Thread.sleep(1000);
				}
	            return "test";
	        }
	    };
	}
	
	

}
