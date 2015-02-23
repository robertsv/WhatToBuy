package lv.whattobuy.dao.jooq;

import static lv.whattobuy.domain.tables.User.USER;

import java.util.List;

import lv.whattobuy.dao.UserDao;
import lv.whattobuy.domain.tables.records.UserRecord;
import lv.whattobuy.dto.User;
import lv.whattobuy.mappers.jooq.UserRecordMapper;

import org.jooq.DSLContext;
import org.jooq.RecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class UserJooqDao implements UserDao {
	
	@Autowired
    private DSLContext create;

	public User findByUserName(String userName) {
		List<User> users = create.select().from(USER).where(USER.USERNAME.equal(userName)).fetch().into(USER).map( new UserRecordMapper());
		
		return users.get(0);
	}

	public User findById(User enity) {
		throw new RuntimeException("Not implemented!");
	}

}
