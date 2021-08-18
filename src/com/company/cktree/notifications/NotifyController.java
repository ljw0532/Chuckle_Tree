package com.company.cktree.notifications;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NotifyController {
	@Inject
	private NotifyService notifyService;
	@Inject
	private NotifyDAO notifyDAO;
	
	//알림 리스트
	@ResponseBody
	@RequestMapping("notifyList")
	public Map<String,Object> notifyList(int m_no, int end){
		Map<String,Object> result = new HashMap<>();
		List<NotifyDTO> list = notifyDAO.selectNotify(m_no,end);
		int count = notifyDAO.countNotify(m_no);
		result.put("notify_list", list);
		result.put("notify_count", count);
		return result;
	}
	
	//알림 발생
	@ResponseBody
	@RequestMapping("insertNotify")
	public void insertNotify(int n_index, int m_no, int gen_m_no, 
			String gen_m_name, int b_no, String n_content) {
		Map<String,Object> map = new HashMap<>();	
		map.put("n_index",n_index);
		map.put("m_no",m_no);
		map.put("gen_m_no",gen_m_no);
		map.put("gen_m_name",gen_m_name);
		map.put("b_no",b_no);
		map.put("n_content",n_content);
		
		notifyService.insertNotify(map);
	}
	
	//알림 읽기
	@RequestMapping("/readNotify")
	public String readNotify(HttpServletRequest request,HttpSession session) {
		int n_no = Integer.parseInt(request.getParameter("n_no").toString());

		notifyService.updateReadDate(n_no);
		NotifyDTO dto = notifyService.selectNotifyOne(n_no);
		return "redirect:/board/funBoardDetail/"+dto.getB_no();
	}
	
	//세션에 알림정보 업데이트
	@ResponseBody
	@RequestMapping("sessionUpdate")
	public void sessionAutoUpdate(HttpSession session) {
		
	}
	

	//알림 삭제
	@ResponseBody
	@RequestMapping("deleteNotify")
	public void deleteNotify(int n_no,HttpSession session) {
		notifyService.deleteNotify(n_no);
		
	}
}
