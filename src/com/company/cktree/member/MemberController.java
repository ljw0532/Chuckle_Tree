package com.company.cktree.member;

import java.io.File;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.company.cktree.authentications.AuthenDAO;
import com.company.cktree.authentications.AuthenDTO;
import com.company.cktree.board.BoardDTO;
import com.company.cktree.comments.CommentsDTO;
import com.company.cktree.exception.AlreadyExistingEmailException;
import com.company.cktree.exception.AlreadyExistingIdException;
import com.company.cktree.util.Email;
import com.company.cktree.util.EmailSender;
import com.company.cktree.util.Pager;
import com.company.cktree.validator.JoinRequestValidator;
import com.company.cktree.validator.MemberModifyValidator;


@Controller
public class MemberController {
	@Inject
	private MemberService memberService;
	@Inject
	private MemberDAO memberDAO;
	@Inject
	private EmailSender emailSender;
	@Inject
	private Email email;
	
	@Resource(name = "profileImagePath")
	String profileImagePath;
	
	@Inject
	private AuthenDAO authenDAO;
	//배포 디렉토리 경로
	String path="C:\\project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Chuckle_Tree\\resources\\images\\";

	
	// 로그인폼으로 이동
	@RequestMapping("loginForm")
	public String loginForm() {
	
		return "member/loginForm";
	}

	// 회원가입폼으로 이동
	@RequestMapping("joinForm/{authen_no}")
	public String joingForm(@PathVariable int authen_no, Model model) {
		Map<String,Object> dto = authenDAO.selectAuthenNo(authen_no);
		
		if(dto == null) { //인증테이블에 기록을 남기지 않은 경우(url에 직접 주소를 치고 들어온 경우) 메인으로 리다이렉트
			return "redirect:/";
		} else {
		
		model.addAttribute("authen",dto);
		return "join/joinForm";
		}
	}

	// 아이디찾기폼으로 이동
	@RequestMapping("findId")
	public String findIdForm() {
		return "member/findIdForm";
	}

	// 비밀번호찾기폼으로 이동
	@RequestMapping("findPw")
	public String findPwForm() {
		return "member/findPwForm";
	}

	// 가입하기
	@ResponseBody
	@RequestMapping(value = "joinForm", method=RequestMethod.POST)
	public boolean join(@ModelAttribute("member") MemberDTO member,BindingResult errors, HttpServletRequest request,
			HttpServletResponse response) throws Exception {	
		new JoinRequestValidator().validate(member, errors);
		if (errors.hasErrors()) {
			return false;
		}
		try {
			memberService.insertMember(member, request, response);
			int authen_no = Integer.parseInt(request.getParameter("authen_no").toString());
			authenDAO.deleteEmailName(authen_no);
		} catch (AlreadyExistingEmailException e) {
			errors.rejectValue("m_email", "duplicate", "이미 가입된 이메일입니다.");
			return false;
		} catch (AlreadyExistingIdException e) {
			errors.rejectValue("m_id", "duplicate", "사용중인 아이디입니다.");
			return false;
		}

		return true;
	 
	}
	// 로그인
	@RequestMapping(value = "loginForm", method=RequestMethod.POST)
	public String login(MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberDTO m_dto = memberService.loginCheck(member, session);
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		if (m_dto != null) { // 로그인 성공시	
			if (request.getParameter("autoLogin") != null) { // 자동 로그인 체크시
				Cookie autoLogin = new Cookie("autoLogin", session.getId());
				autoLogin.setPath("/");
				int amount = 60 * 60 * 24 * 7;
				autoLogin.setMaxAge(amount);
				response.addCookie(autoLogin);
				String session_id = session.getId();
				Date session_limit = new Date(System.currentTimeMillis() + (1000 * amount));
				memberService.keepLogin(member.getM_id(), session_id, session_limit);
			}
		
			if(m_dto.getActive().equals("N")) { //비활성회원이면 세션 제거 후 리다이렉트
				session.invalidate();
				return "alert/inactiveAlert";
			}
			
			return "redirect:/";		
		} else { // 로그인 실패시
			
			if(memberDAO.loginIdCheck(member.getM_id()) == null) { //등록된 아이디가 없을 경우
				writer.write("<script type='text/javascript'> alert('등록된 아이디가 없습니다.') </script>");
				writer.flush();
				return "member/loginForm";
			} else { //아이디 비밀번호가 일치하지 않을 경우		
				writer.write("<script type='text/javascript'> alert('아이디 또는 비밀번호가 일치하지 않습니다.') </script>");
				writer.flush();
			return "member/loginForm";
			}
		}
	}

	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Object object = session.getAttribute("session_m_id");
		if (object != null) {
			String member = (String) object;
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "autoLogin");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				memberService.keepLogin(member, "none", new Date());
			}
		}
		return "redirect:/";
	}

	// 아이디 찾기
	@RequestMapping(value = "findId", method=RequestMethod.POST)
	public String findId(@ModelAttribute MemberDTO member, Model model) throws Exception {
		MemberDTO dto = memberService.findId(member);
		String member_email = member.getM_email();
		String member_name = member.getM_name();
			if (dto != null) {
			String member_id = dto.getM_id();
			email.setSubject("Chuckle Tree! " + member_name + "회원님이 요청하신 정보입니다.");
			email.setReceiver(member_email);
			email.setContent("회원님의 아이디는 " + member_id + " 입니다.");
			emailSender.SendEmail(email);
			model.addAttribute("message", "success");
			return "alert/findAlert";
		} else {
			model.addAttribute("message", "id_fail");
			return "alert/findAlert";
		}
	}

	// 비밀번호 찾기
	@RequestMapping(value = "findPw", method=RequestMethod.POST)
	public String findPw(@ModelAttribute MemberDTO member, Model model) throws Exception {
		MemberDTO dto = memberService.findPw(member);
		if (dto != null) {
			model.addAttribute("message", "success");
			return "alert/findAlert";
		} else {
			model.addAttribute("message", "pw_fail");
			return "alert/findAlert";
		}
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "checkId", method=RequestMethod.POST)
	public int checkId(String m_id) {
		int result = memberService.checkId(m_id);
		return result;
	}

	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "checkEmail", method=RequestMethod.POST)
	public int checkEmail(String m_email) {
		int result = memberService.checkEmail(m_email);
		return result;
	}
	
	
	//회원정보 수정폼으로 이동
	@RequestMapping("member/memberModifyForm")
	public String memberModifyForm(HttpSession session,Model model) {	
		int m_no = Integer.parseInt(String.valueOf(session.getAttribute("session_m_no")));
		model.addAttribute("member",memberService.memberInfo(m_no));
		return "profile/memberModifyForm";
	}
	
	//UUID생성
 	private String uploadFile(String fileName, byte[] fileData) throws Exception {	
		UUID uid = UUID.randomUUID(); 
		String savedName = uid.toString() + "_" +fileName;	
		File target = new File(profileImagePath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	//회원정보 수정
	@ResponseBody
	@RequestMapping("member/memberModify")
	public boolean memberModify(@ModelAttribute("member")MemberDTO member , 
			BindingResult errors, MultipartHttpServletRequest request, HttpSession session) throws Exception {
		MultipartFile file = request.getFile("file");
		new MemberModifyValidator().validate(member,errors);
		int m_no = Integer.parseInt(String.valueOf(session.getAttribute("session_m_no")));
		if(errors.hasErrors()) {
			return false;
		} 
		
		try {
			if(!file.isEmpty()) {
				byte[] fileByte = file.getBytes(); //파일 용량
				String fileName = file.getOriginalFilename();//파일 이름
				String uuidFileName = uploadFile(fileName,fileByte);//UUID합친 이름
				member.setM_image(uuidFileName);
				new File(path).mkdir();
				member.getFile().transferTo(new File(path + fileName));
				memberService.memberModify(member,request);		
				session.setAttribute("session_m_image", uuidFileName);
			} else	{
				String profileImage = memberDAO.selectMyProfileImage(m_no); //프로필 사진을 수정하지 않을 경우 기존의 파일을 씀 
				member.setM_image(profileImage);
				memberService.memberModify(member,request);					
			}
		} catch (AlreadyExistingEmailException e) {
			errors.rejectValue("m_email", "duplicate", "이미 가입된 이메일입니다.");
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//회원탈퇴
	@RequestMapping("member/myProfile/leaveId")
	public String leaveId(HttpSession session) {
		int m_no = Integer.parseInt(String.valueOf(session.getAttribute("session_m_no")));
		memberService.leaveId(m_no);
		session.invalidate();
		return "redirect:/";
	}
	
	//회원정보 조회(프로필)
	@RequestMapping(value="member/myProfile/{m_no}", method=RequestMethod.GET)
	public String myProfile(@PathVariable int m_no,HttpSession session, Model model) {
		int session_m_no;		
		if(session.getAttribute("session_m_no")!= null) { 
		session_m_no = Integer.parseInt(String.valueOf(session.getAttribute("session_m_no"))); 
		} else {
		session_m_no = 0;	
		}
	
		if(session.getAttribute("session_m_no") == null || session_m_no != m_no) {
			return "redirect:/";
		} //현재 세션값이 없거나 프로필의 회원번호와 현재 세션의 회원번호가 일치하지 않으면 메인으로 리다이렉트 
		
		model.addAttribute("member",memberService.memberInfo(m_no));
		return "profile/myProfile";
	}	
	
	//비밀번호 변경 페이지로 이동
	@RequestMapping("/member/myProfile/pwChange")
	public String pwChangeForm() {
		return "profile/pwChange";
	}
	
	//현재 쓰고 있는 비밀번호인지 확인
	@ResponseBody
	@RequestMapping("/member/myProfile/checkMyPw")
	public boolean checkMyPw(int m_no, String m_password) {
		if(memberDAO.checkMyPw(m_no, m_password)!=null) {
			return true;
		} else {
			return false;
		}
	}
	
	//비밀번호 변경
	@ResponseBody
	@RequestMapping(value="/member/myProfile/pwChange", method=RequestMethod.POST)
	public Map<String,Object> pwChange(int m_no, String org_pw, String m_password,HttpSession session) {
		Map<String,Object> map = new HashMap<>();
		map.put("result", memberService.pwChange(m_no, org_pw, m_password,session));
		return map;
	}
	
	//myProfile - 내가 쓴 글
	@ResponseBody
	@RequestMapping("member/myProfile/myPosts")
	public Map<Object,Object> myPosts(int m_no, int end) {		
		 List<BoardDTO> list = memberDAO.myPosts(m_no,end);
		return selectList("myPosts_list",list);
	}
	
	//myProfile - 내가 쓴 댓글
	@RequestMapping("member/myProfile/myComments")
	@ResponseBody
	public Map<Object,Object> myComments(int m_no, int end) {
		List<CommentsDTO> list = memberDAO.myComments(m_no,end);		
		return selectList("myComments_list",list);
	}
	
	//myProfile - 내가 누른 좋아요
	@RequestMapping("member/myProfile/myLikeit")
	@ResponseBody
	public Map<Object,Object> myLikeit(int m_no, int end) {	
		List<BoardDTO> list = memberDAO.myLikeit(m_no,end);	
		return selectList("myLikeit_list",list);
	}
	
	//타 회원 프로필
	@RequestMapping("/user/Profile/{m_no}")
	public String userProfile(@PathVariable int m_no,Model model) {
		model.addAttribute("user", memberService.selectUserInfo(m_no));
		return "/profile/userProfile";
	}
	
	//다른 회원 작성글 조회
	@ResponseBody
	@RequestMapping("/user/Posts")
	public Map<Object,Object> userPosts(int m_no, int end) {
		List<BoardDTO> list = memberDAO.myPosts(m_no,end);	
		return selectList("userPosts_list",list);
	}
	
	//다른 회원 작성 댓글 조회
	@ResponseBody
	@RequestMapping("/user/Comments")
	public Map<Object,Object> userComments (int m_no, int end) {
		List<CommentsDTO> list = memberDAO.myComments(m_no,end);
		return selectList("userComments_list",list);
	}
		
	//리스트 조회 메서드
	private Map<Object,Object> selectList( String alias, List list){
		Map<Object,Object> result = new HashMap<>();
		result.put(alias,list);
		return result;
	}
}
