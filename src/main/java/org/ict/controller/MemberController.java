package org.ict.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ict.domain.LoginDTO;
import org.ict.domain.MemberVO;
import org.ict.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@GetMapping("/login")
	public void loginGet(@ModelAttribute("dto") LoginDTO dto) {
		
	}//loginGet
	
	@PostMapping("/loginPost")
	public void loginPost(LoginDTO dto, HttpSession session, Model model) throws Exception {
		MemberVO vo = service.login(dto);
		
		if(vo == null) {
			return;
		}
		model.addAttribute("membervo", vo);
	}//loginPost
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		session.removeAttribute("login");
		
		return "redirect:/crescent";
	}
	
	@GetMapping("/join")
	public void join() {
		
	}
	
	@GetMapping("/find")
	public void find() {
		
	}
	
	@PostMapping("/findPwd")
	public String findPwd(Model model, MemberVO vo) {
		
		model.addAttribute("find", service.pwFind(vo));
		
		return "/member/findPwd";
	}
	
	@PostMapping("/update")
	public String update(MemberVO vo) {
		
		service.pwUpdate(vo);
		
		return "/member/login";
		
	}
	
	@PostMapping("/findId")
	public String findId(Model model, MemberVO vo) {
		
		model.addAttribute("find", service.idFind(vo));
		
		return "/member/findId";
	}
	
	@GetMapping("/mypage")
	public void mypage() {
		
	}
	
	@GetMapping("/myinfo")
	public void myInfo() {
		
	}
	
}//class
