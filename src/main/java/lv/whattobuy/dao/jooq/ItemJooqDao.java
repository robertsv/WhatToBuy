package lv.whattobuy.dao.jooq;

import static lv.whattobuy.domain.tables.Item.ITEM;

import java.util.List;

import lv.whattobuy.dao.ItemDao;
import lv.whattobuy.dto.Item;
import lv.whattobuy.dto.User;
import lv.whattobuy.mappers.jooq.ItemRecordMapper;

import org.jooq.DSLContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemJooqDao implements ItemDao {

	@Autowired
	private DSLContext create;

	public Item findById(long id) {
		List<Item> items = create.select().from(ITEM).where(ITEM.ID.equal(id))
				.fetch().into(ITEM).map(new ItemRecordMapper());

		return items.get(0);
	}

	public long add(Item entity) {
		return (Long) create
				.insertInto(ITEM, ITEM.NAME, ITEM.STATUS, ITEM.USER_ID)
				.values(entity.getName(), entity.getStatus(),
						entity.getUserId()).returning(ITEM.ID).fetchOne()
				.getValue(0);
	}

	public void update(Item entity) {
		create.update(ITEM).set(ITEM.NAME, entity.getName())
				.set(ITEM.STATUS, entity.getStatus())
				.set(ITEM.USER_ID, entity.getUserId()).where(ITEM.ID.equal(entity.getId())).execute();
	}

	public List<Item> getAll() {
		List<Item> items = create.select().from(ITEM).orderBy(ITEM.ID).fetch().into(ITEM)
				.map(new ItemRecordMapper());

		return items;
	}

	public void delete(Item entity) {
		create.delete(ITEM).where(ITEM.ID.equal(entity.getId())).execute();
	}
	
	public List<Item> getByUser(User user) {
		List<Item> items = create.select().from(ITEM).where(ITEM.USER_ID.equal(user.getId())).orderBy(ITEM.ID).fetch().into(ITEM)
				.map(new ItemRecordMapper());

		return items;
	}
	

}
