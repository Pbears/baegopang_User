package baegopang.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import baegopang.user.bean.BrandBean;
import baegopang.user.bean.MenuBean;
import baegopang.user.bean.StoreBean;


public class TotalDao extends SqlSessionDaoSupport{
	private SqlSessionFactoryBean sqlSessionFactory;
	
	public List<BrandBean>selectStoreByBrand(int brandNo)throws Exception{
		int brandCheck = brandNo/100;
		return this.getSqlSession().selectList("selectStoreByBrand",brandCheck);			
	}
	
	public List<StoreBean> selectStoreInfo(String StoreName) throws Exception{
		return this.getSqlSession().selectList("selectStoreInfo", StoreName);
	}
	
	public List<MenuBean> selectMenuByStore(String storeName){
		return this.getSqlSession().selectList("selectMenuByStore", storeName);
	}
	/*
	public List<MenuBean> selectDefaultMenuByStore(String brandno){
	      SqlSession sqlSession = null;
	      try {
	         sqlSession = sqlSessionFactory.openSession();
	         return sqlSessionFactory.openSession().selectList("selectDefaultMenuByStore", brandno);
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	         return null;
	      } finally {
	         closeSqlSession(sqlSession);
	      }
	   }
	*/
	
}
