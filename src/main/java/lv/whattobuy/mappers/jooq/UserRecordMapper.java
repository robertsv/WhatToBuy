package lv.whattobuy.mappers.jooq;

import lv.whattobuy.domain.tables.records.UserRecord;
import lv.whattobuy.dto.User;

import org.jooq.RecordMapper;

public class UserRecordMapper implements RecordMapper<UserRecord, User> {

	public User map(UserRecord record) {
		
		User user = new User();
		
		user.setId(record.getId());
		user.setName(record.getName());
		user.setUsername(record.getUsername());
		user.setPassword(record.getPassword());
		
		return user;
	}

}
