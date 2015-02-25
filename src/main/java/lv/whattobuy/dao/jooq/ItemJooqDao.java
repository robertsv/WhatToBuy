package lv.whattobuy.dao.jooq;

import java.util.List;

import lv.whattobuy.dao.ItemDao;
import lv.whattobuy.dto.Item;
import lv.whattobuy.dto.User;
import lv.whattobuy.mappers.jooq.ItemRecordMapper;
import lv.whattobuy.mappers.jooq.UserRecordMapper;

import org.jooq.DSLContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import static lv.whattobuy.domain.tables.Item.ITEM;
import static lv.whattobuy.domain.tables.User.USER;

@Repository
public class ItemJooqDao implements ItemDao {

	@Autowired
	private DSLContext create;

	public Item findById(Item enity) {
		throw new UnsupportedOperationException("Not implemented!");
	}

	public long add(Item entity) {
		return (Long) create
				.insertInto(ITEM, ITEM.NAME, ITEM.STATUS, ITEM.USER_ID)
				.values(entity.getName(), entity.getStatus(),
						entity.getUserId()).returning(ITEM.ID).fetchOne()
				.getValue(0);
	}

	public void save(Item entity) {
		throw new UnsupportedOperationException("Not implemented!");
	}

	public List<Item> getAll() {
		List<Item> items = create.select().from(ITEM).fetch().into(ITEM)
				.map(new ItemRecordMapper());

		return items;
	}

}
