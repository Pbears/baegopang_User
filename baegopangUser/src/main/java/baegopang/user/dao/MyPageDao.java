package baegopang.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import baegopang.user.bean.FoodOrderBean;
import gopang.bean.ReplyBean;

public class MyPageDao extends SqlSessionDaoSupport{
	
	private SqlSessionFactoryBean sqlSessionFactory;
	
	public List<FoodOrderBean> selectMemberFoodOrder(String id){
		return this.getSqlSession().selectList("selectMemberFoodOrder", id);
	}
	
	public List<FoodOrderBean> selectMemberPoint(String id){
		return this.getSqlSession().selectList("selectMemberPoint", id);
	}
	
	public List<ReplyBean> selectMemberReply(String id){
		return this.getSqlSession().selectList("selectMemberReply", id);
	}
	
}
