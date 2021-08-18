package com.company.cktree.notifications;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service("NotifyService")
public class NotifyServiceImpl implements NotifyService {
	
	@Inject
	NotifyDAO notifyDAO;
	
	@Override
	public void insertNotify(Map<String, Object> map) {
		notifyDAO.insertNotify(map);

	}

	@Override
	public void updateReadDate(int n_no) {
		notifyDAO.updateReadDate(n_no);

	}

	@Override
	public NotifyDTO selectNotifyOne(int n_no) {
		return notifyDAO.selectNotifyOne(n_no);
	}

	@Override
	public void deleteNotify(int n_no) {
		notifyDAO.deleteNotify(n_no);
		
	}

}
