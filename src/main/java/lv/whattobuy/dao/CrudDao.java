package lv.whattobuy.dao;

import java.util.List;

public interface CrudDao<T> {

	T findById(long id);
	
	long add(T entity);
	
	void update(T entity);
	
	List<T> getAll();
	
}
