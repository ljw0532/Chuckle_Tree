package com.company.cktree.report;

import java.util.List;
import java.util.Map;

public interface ReportDAO {
	//신고내용 DB에 삽입
	public void insertReport(ReportDTO dto);
	//전체 신고내용 조회
	public List<ReportDTO> selectReportList(Map<String,Object> map);
	//페널티 부여
	public void givePenalty(int m_no);
	//신고리스트 갯수
	public int countReportList();
	//페널티부여후 완료시간 업데이트
	public void completePenaltyDate(int report_no);
	//페널티가 5이상인 회원 비활성
	public void inactiveMember(int m_no);
	
}
