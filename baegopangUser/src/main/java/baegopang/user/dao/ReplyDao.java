package baegopang.user.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import baegopang.user.bean.ReplyBean;

public class ReplyDao extends SqlSessionDaoSupport {

	public void insertReply(ReplyBean bean){
			this.getSqlSession().insert("insertReply", bean);
	}
	
	public Integer selectRepSeq()throws Exception{
		return this.getSqlSession().selectOne("selectRepSeq");
	}
	
	public List<ReplyBean> selectReply(String storeName){
		return this.getSqlSession().selectList("selectReply", storeName);
	}
	
	public List<ReplyBean> selectReplyCheck(int pnum){
		return this.getSqlSession().selectList("selectReplyCheck", pnum);
	}
}
