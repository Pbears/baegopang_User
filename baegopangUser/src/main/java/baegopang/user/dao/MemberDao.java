package baegopang.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import baegopang.user.bean.MemberBean;

public class MemberDao extends SqlSessionDaoSupport {
	
	private SqlSessionFactoryBean sqlSessionFactory;
	
	public boolean idCheck(String id){
		String userId = this.getSqlSession().selectOne("idCheck", id);
		return id.equals(userId)?true:false;
	}
	
	public boolean pwCheck(String id, String pw){
		String userPw = this.getSqlSession().selectOne("pwCheck", id);
		return pw.equals(userPw)?true:false;
	}
	
	public void memberInsert(MemberBean bean){
		this.getSqlSession().insert("memberInsert", bean);
	}
	
	public MemberBean selectMember(String id) throws Exception{
		return this.getSqlSession().selectOne("selectMember", id);
	}
	
	public void updateMember(MemberBean bean){
		this.getSqlSession().update("memberUpdate", bean);
	}
	
}