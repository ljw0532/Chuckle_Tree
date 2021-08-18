package com.company.cktree.notifications;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("NotifyDAO")
public class NotifyDAOImpl implements NotifyDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertNotify(Map<String, Object> map) {
		sqlSession.insert("notify.insertNotify", map);

	}

	@Override
	public List<NotifyDTO> selectNotify(int m_no, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("m_no", m_no);
		map.put("end", end);
		return sqlSession.selectList("notify.selectNotify",map);
	}

	@Override
	public void updateReadDate(int n_no) {
		sqlSession.update("notify.updateReadDate", n_no);
	}

	@Override
	public NotifyDTO selectNotifyOne(int n_no) {
		return sqlSession.selectOne("notify.selectNotifyOne", n_no);
	}

	@Override
	public int countNotify(int m_no) {
		return sqlSession.selectOne("notify.countNotify", m_no);
	}

	@Override
	public void deleteNotify(int n_no) {
		sqlSession.delete("notify.deleteNotify",n_no);
		
	}

}
