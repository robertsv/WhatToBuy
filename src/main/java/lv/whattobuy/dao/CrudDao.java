package lv.whattobuy.dao;

import java.util.List;

public interface CrudDao<T> {

	T findById(T enity);
	
	long add(T entity);
	
	void save(T entity);
	
	List<T> getAll();
	
}
