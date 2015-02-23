package lv.whattobuy.dao;

public interface CrudDao<T> {

	T findById(T enity);
	
}
