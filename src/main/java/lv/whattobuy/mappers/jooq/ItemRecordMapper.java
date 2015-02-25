package lv.whattobuy.mappers.jooq;

import lv.whattobuy.domain.tables.records.ItemRecord;
import lv.whattobuy.dto.Item;

import org.jooq.RecordMapper;

public class ItemRecordMapper implements RecordMapper<ItemRecord, Item> {

	public Item map(ItemRecord record) {
		
		Item item = new Item();
		
		item.setId(record.getId());
		item.setName(record.getName());
		item.setStatus(record.getStatus());
		item.setUserId(record.getUserId());
		
		return item;
	}

}
