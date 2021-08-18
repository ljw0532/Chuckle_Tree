package com.company.cktree.board;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.company.cktree.notifications.NotifyDAO;
import com.company.cktree.util.Pager;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	private BoardDAO boardDAO;
	@Inject
	private BoardService boardService;
	//프로젝트 내부 upload경로
	@Resource(name = "uploadPath")
	String uploadPath;
	
	//배포 디렉토리 경로
	String path="C:\\project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Chuckle_Tree\\resources\\upload\\";
	
	private String uploadFile(String fileName, byte[] fileData) throws Exception {
		/*
		 * UUID uid = UUID.randomUUID(); String savedName = uid.toString() + "_" +
		 * fileName;
		 */
		File target = new File(uploadPath, fileName);
		FileCopyUtils.copy(fileData, target);
		return fileName;
	}

	//fun게시판리스트
	@RequestMapping(value="/funBoardList", method=RequestMethod.GET)
	public String funBoardList(@RequestParam(defaultValue="1")int curPage, @RequestParam(defaultValue="all")String searchOption,
			@RequestParam(defaultValue="")String keyword, Model model) {
		int count =	boardService.pagingList(searchOption,keyword);
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<BoardDTO> list = boardService.funBoardList(searchOption,keyword, start, end);
		model.addAttribute("list", list);
		model.addAttribute("pager",pager);
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyword", keyword);
		return "board/funBoardList";

	}
	//글쓰기폼으로 이동
	@RequestMapping(value="/boardWrite", method=RequestMethod.GET)
	public String boardWriteForm() {
		return "board/boardWrite";
	}
	
	//글쓰기
	@RequestMapping(value="/boardWrite", method=RequestMethod.POST)
	public String boardWrite(@ModelAttribute("board")BoardDTO board,Model model,MultipartHttpServletRequest request)throws Exception {
	String fileName="-";
	//프론트에서 보내준 fileList
	List<MultipartFile> fileList = request.getFiles("file");
	//스크립트단에서 생성된 uuid+filename
	String uuidFileName[] = board.getUuidFileName();
	String str = "";

	//if 시작
	if(!board.getFile().isEmpty()) {			
		for(int i=0; i < fileList.size(); i++) {	
				String savedName = uuidFileName[i];
				fileName= uploadFile(savedName, fileList.get(i).getBytes());				
				// 배포 디렉토리에 저장 하는 로직
				try {
					new File(path).mkdir();
					fileList.get(i).transferTo(new File(path + fileName));
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e);
				}
		}
		//DB에 한줄로 저장하기 위한 for문
		for(int i=0; i<fileList.size();i++) {
			str += uuidFileName[i];
			if(i < fileList.size()-1) {
			str += ",";
			}	
		}
	}//if 끝
		board.setB_file(str);
		board.setFile_count(fileList.size());
		model.addAttribute("b_no", board.getB_no());
		boardService.boardWrite(board);
		return "alert/loding";
	}
	
	//상세페이지
	@RequestMapping(value="/funBoardDetail/{b_no}", method=RequestMethod.GET)
	public ModelAndView funBoardDetail(@PathVariable int b_no,HttpServletRequest request) {
		boardService.detailCnt(b_no);
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();
		map.put("b_no",b_no);
		map.put("m_no",request.getSession().getAttribute("session_m_no"));
		Map<String,Object> result = boardService.funBoardDetail(map);
	
		mav.addObject("detail", result.get("detail"));
		mav.addObject("likeit", result.get("likeit"));
		mav.addObject("countLikeit", result.get("countLikeit"));
		mav.addObject("dislike", result.get("dislike"));
		mav.addObject("countDislike", result.get("countDislike"));
		mav.addObject("countCmt", result.get("countCmt"));
		 

		mav.setViewName("board/funBoardDetail");
		return mav;
	}
	
	//게시글 수정 폼
	@RequestMapping(value="/boardUpdateForm")
	public String boardUpdateForm(Model model,HttpServletRequest request){
		int b_no = Integer.parseInt(request.getParameter("b_no"));	
		Map<String,Object> map = new HashMap<>();
		Map<String,Object> detail = boardDAO.funBoardDetail(b_no);
		map.put("detail", detail);
		model.addAttribute("detail", map.get("detail"));		
		return "board/boardUpdateForm";
	}
	
	
	//게시글 수정  
	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(@ModelAttribute("board")BoardDTO board,Model model, MultipartHttpServletRequest request) throws Exception {
	String fileName="-";
	  List<MultipartFile> fileList = request.getFiles("file");
	  String uuidFileName[] = board.getUuidFileName();
	  String str = ""; 
	 
	  if(!board.getFile().isEmpty()){ 
		  	for(int i=0; i < fileList.size();i++) {
		  		String savedName = uuidFileName[i]; 
		  		fileName= uploadFile(savedName,
				 fileList.get(i).getBytes());
		  		try {
		  			new File(path).mkdir();
		  			fileList.get(i).transferTo(new File(path + fileName));
		  			}
		  		catch (Exception e){
		  			e.printStackTrace(); System.out.println(e); 
		  		} 
		  	}
		  	for(int i = 0;i<fileList.size();i++){
		  		str += uuidFileName[i];
		  		if (i < fileList.size() - 1) {
		  		str += ",";
		  		}
		  	}
	}// if 끝
	board.setB_file(str);
	board.setFile_count(fileList.size());
	boardService.boardUpdate(board);
	model.addAttribute("b_no",board.getB_no());
	return"alert/loding";
	}
	 
	
	//게시글 삭제
	@RequestMapping(value="/boardDelete/{b_no}", method=RequestMethod.GET)
	public String boardDelete(@PathVariable int b_no) {
		boardService.boardDelete(b_no);
		return "redirect:/board/funBoardList";
	}
	
	//좋아요
	@ResponseBody
	@RequestMapping(value="/insertLikeit", method=RequestMethod.POST)
	public Map<String,Object> insertLikeit(int b_no, int m_no){
		Map<String,Object> map = new HashMap<>();
		Map<String,Object> result = new HashMap<>();		
		map.put("b_no", b_no);
		map.put("m_no", m_no);		
		int n = boardService.insertLikeit(map);
		result.put("likeit", n);
		return result;
	}
	
	//좋아요 갯수
	@ResponseBody
	@RequestMapping("countLikeit")
	public int countLikeit(int b_no) {
		int result = boardService.countLikeit(b_no);
		return result;
	}
	
	//좋아요 추가시 싫어요 취소
	@ResponseBody
	@RequestMapping("deleteDislike")
	public Map<String,Object> deleteDislike(int b_no, int m_no){
		Map<String,Object> map = new HashMap<>();
		Map<String,Object> result = new HashMap<>();
		map.put("b_no", b_no);
		map.put("m_no", m_no);
		int n = boardService.deleteDislike(map);
		
		result.put("result", n);
		return result;
	}
	
	//싫어요
	@ResponseBody
	@RequestMapping(value="/insertDislike", method=RequestMethod.POST)
	public Map<String,Object> insertDislike(int b_no, int m_no){
		Map<String,Object> result = new HashMap<>();
		Map<String,Object> map = new HashMap<>();
		map.put("b_no", b_no);
		map.put("m_no", m_no);
		int n = boardService.insertDislike(map);
		result.put("dislike",n);
		return result;
	}
	
	//싫어요 갯수
	@ResponseBody
	@RequestMapping("countDislike")
		public int countDislike(int b_no) {
			int result = boardService.countDislike(b_no);
			return result;
		}
	
	//싫어요 시 좋아요 취소
	@ResponseBody
	@RequestMapping("deleteLikeit")
	public Map<String,Object> deleteLikeit(int b_no, int m_no){
		Map<String,Object> map = new HashMap<>();
		Map<String,Object> result = new HashMap<>();
		map.put("b_no", b_no);
		map.put("m_no", m_no);
		int n = boardService.deleteLikeit(map);
		
		result.put("result", n);
		return result;
	}
	
	//댓글 작성
	@ResponseBody
	@RequestMapping("writeComments")
	public void writeComments(int b_no, int m_no, String c_content, String c_writer,int c_parent,int c_group) {
		Map<String,Object> map = new HashMap<>();
		map.put("b_no", b_no);
		map.put("m_no", m_no);
		map.put("c_content", c_content);
		map.put("c_writer", c_writer);
		map.put("c_parent", c_parent);
		if(c_parent != 0) {	
			   map.put("c_group",c_group);
		}
		boardService.writeComments(map);
	}
	
	//댓글 리스트
	@ResponseBody
	@RequestMapping("commentsList")
	public Map<String,Object> commentsList(int b_no,int end){
		Map<String,Object> map = new HashMap<>();
		map.put("b_no",b_no);
		map.put("end", end);
		return boardService.commentsList(map);
	}
	
	//댓글 수정
	@ResponseBody
	@RequestMapping("commentsUpdate")
	public Map<String,Object> commentsUpdate(int c_no, String c_content){
		Map<String,Object> map = new HashMap<>();
		Map<String,Object> result = new HashMap<>();
		map.put("c_content",c_content);	
		map.put("c_no",c_no);
		result.put("result",boardService.commentsUpdate(map));
		return result;
	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping("commentsDelete")
	public void commentsDelete(int c_no, int c_parent, int c_group) {
		Map<String,Object> map = new HashMap<>();
		map.put("c_no", c_no);
		map.put("c_parent", c_parent);
		map.put("c_group", c_group);
		boardService.commentsDelete(map);
	}
	
	//베스트 게시물 리스트
	@RequestMapping("/BestBoardList")
	public String bestBoardList(@RequestParam(defaultValue="1")int curPage, @RequestParam(defaultValue="all")String searchOption,
			@RequestParam(defaultValue="")String keyword, Model model) {
		int count =	boardService.countBestBoardList(searchOption,keyword);
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		model.addAttribute("list", boardService.bestBoardList(searchOption,keyword, start, end));
		model.addAttribute("pager",pager);
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyword", keyword);
		return "board/bestBoardList";
	}
	
	//워스트 게시물 리스트
	@RequestMapping("/WorstBoardList")
	public String worstBoardList(@RequestParam(defaultValue="1")int curPage, @RequestParam(defaultValue="all")String searchOption,
				@RequestParam(defaultValue="")String keyword, Model model) {
		int count =	boardService.countWorstBoardList(searchOption,keyword);
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		model.addAttribute("list", boardService.worstBoardList(searchOption,keyword, start, end));
		model.addAttribute("pager",pager);
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyword", keyword);
		return "board/worstBoardList";
	}
	
	
}