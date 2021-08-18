package com.company.cktree.notifications;

import java.util.List;
import java.util.Map;

public interface NotifyDAO {
	//알림 발생
	public void insertNotify(Map<String,Object> map);
	//회원번호에 해당하는 알림 조회
	public List<NotifyDTO> selectNotify(int m_no, int end);
	//알림을 읽은 시간
	public void updateReadDate(int n_no);
	//알림 고유번호에 해당하는 알림조회
	public NotifyDTO selectNotifyOne(int n_no);
	//알림 갯수
	public int countNotify(int m_no);
	//알림 삭제
	public void deleteNotify(int n_no);
	
}
