package baegopang.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import baegopang.user.bean.ZipcodeBean;

public class ZipCodeDao extends SqlSessionDaoSupport {
	private SqlSessionFactoryBean sqlSessionFactory;
	
	public List<ZipcodeBean> searchAddress(String dong){
		return this.getSqlSession().selectList("searchAddress", dong);
	}
}