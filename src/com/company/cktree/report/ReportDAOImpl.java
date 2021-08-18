package com.company.cktree.report;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("ReportDAO")
public class ReportDAOImpl implements ReportDAO {

	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public void insertReport(ReportDTO dto) {
		sqlSession.insert("report.insertReport",dto);
	}

	@Override
	public List<ReportDTO> selectReportList(Map<String,Object> map) {
		return sqlSession.selectList("report.selectReportList", map);
	}

	@Override
	public void givePenalty(int m_no) {
		sqlSession.update("report.givePenalty", m_no);
	}

	@Override
	public int countReportList() {
		return sqlSession.selectOne("report.countReportList");
	}

	@Override
	public void completePenaltyDate(int report_no) {
		sqlSession.update("report.completePenaltyDate", report_no);
		
	}

	@Override
	public void inactiveMember(int m_no) {
		sqlSession.update("report.inactiveMember", m_no);
		
	}

}
