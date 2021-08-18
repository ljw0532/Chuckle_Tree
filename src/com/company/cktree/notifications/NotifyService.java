package com.company.cktree.notifications;

import java.util.Map;

public interface NotifyService {
		//알림 발생
		public void insertNotify(Map<String,Object> map);
		//알림을 읽은 시간
		public void updateReadDate(int n_no);
		//알림고유번호에 해당하는 알림조회
		public NotifyDTO selectNotifyOne(int n_no);
		//알림 삭제
		public void deleteNotify(int n_no);
}
