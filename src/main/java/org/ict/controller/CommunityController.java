package org.ict.controller;

import org.ict.domain.Category;
import org.ict.domain.Criteria;
import org.ict.domain.NoticeVO;
import org.ict.domain.PageMaker;
import org.ict.domain.ReviewVO;
import org.ict.service.NoticeService;
import org.ict.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/community/*")
public class CommunityController {

//커뮤니티//
	@GetMapping("")
	public String community(Model model, Category cate) {
		model.addAttribute("cate", cate);
		
		return "/community/community";
	}//community
	
	@GetMapping("/mycommunity")
	public void mycommunity() {
		
	}//mycommunity
//커뮤니티//

//공지 컨트롤러//
	@Autowired
	private NoticeService service;
	
	@GetMapping("/notice")
	public void list(Model model, Criteria cri) {
		
		model.addAttribute("list", service.getListPage(cri));
		model.addAttribute("cri", cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalPage(service.getCountPage(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@PostMapping("/write")
	public String write(NoticeVO notice) {
		
		log.info(notice);
		service.write(notice);
		
		return "redirect:/community/notice";
		
	}
	
	@GetMapping("/noticewrite")
	public String write() {
		return "/community/noticewrite";
	}
	
	@GetMapping("/noticedetail")
	public void detail(int nno, Model model) {
		model.addAttribute("board", service.detail(nno));
	}
	
	@PostMapping("/remove")
	public String remove(int nno, RedirectAttributes rttr, Model model) {
		
		service.remove(nno);
		rttr.addAttribute("nno", nno);
		
		return "redirect:/community/notice";
	}
	
	@GetMapping("/noticemodify")
	public void goupdate(Model model ,int nno) {
		NoticeVO notice = service.detail(nno);
		
		model.addAttribute("board", notice);
		model.addAttribute("nno", nno);
	}
	
	@PostMapping("/modifyrun")
	public String modify(NoticeVO notice,
					Criteria cri,
					RedirectAttributes rttr) {
		// 넘겨받은 글 정보를 갱신 등록
		service.modify(notice);
		
		// 수정된 글 번호 정보를 저장
		rttr.addFlashAttribute("nno",notice.getNno());
		
		// 디테일 페이지로 넘어가기 위해 redirect 주소 설정
		return "redirect:/community/noticedetail?nno=" + notice.getNno();
	}
//공지 컨트롤러//
	
//문의 컨트롤러//
	@GetMapping("/askwrite")
	public String askWrite() {
		return "/community/askwrite";
	}//askWrite
	
	@GetMapping("/askdetail")
	public void askDetail(Model model, int qno) {
		model.addAttribute("qno", qno);
	}//askDetail
	
	@PostMapping("/askmodify")
	public String askModify(Model model, int qno) {
		model.addAttribute("qno", qno);
		
		return "/community/askmodify";
	}//askModify
//문의 컨트롤러//
	
//리뷰 컨트롤러//
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/reviewwrite")
	public String reviewWrite() {
		return "/community/reviewwrite";
	}//reviewWrite

	@PostMapping("/reviewWrite")
	public String reviewWrite(ReviewVO vo) {
		
		reviewService.write(vo);
		
		return "redirect:/community/?cate=r";
	}//reviewWrite
	
	@PostMapping("/reviewmodify")
	public String reviewModify(Model model, int rno, Category cate) {
		model.addAttribute("rno", rno);
		
		return "/community/reviewmodify";
	}//reviewModify
	
	@PostMapping("/reviewModify")
	public String reviewModify(ReviewVO vo) {
		
		reviewService.modify(vo);
		
		return "redirect:/community/reviewdetail?rno=" + vo.getRno();
	}//reviewModify
	
	@GetMapping("/reviewdetail")
	public void reviewDetail(Model model, int rno) {
		model.addAttribute("rno", rno);
	}//reviewDetail
//리뷰 컨트롤러//

}//class