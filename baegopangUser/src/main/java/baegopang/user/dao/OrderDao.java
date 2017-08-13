package baegopang.user.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import baegopang.user.bean.FoodOrderBean;

public class OrderDao extends SqlSessionDaoSupport{
	
	private SqlSessionFactoryBean sqlSessionFactory;

	public void orderInsert(FoodOrderBean bean){
			this.getSqlSession().insert("orderInsert", bean);
	}
	
	public void updatePang(HashMap<Object, Object>map){
			this.getSqlSession().insert("updatePang", map);
	}
}
