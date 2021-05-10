package org.ict.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@GetMapping("/prodwrite")
	public void prodwrite() {
		
	}//prodwrite
	
	@GetMapping("/detail")
	public void detail(Model model, int pno) {
		model.addAttribute("pno", pno);
	}//detail
	
	@GetMapping("/list")
	public void list(Model model, String pname) {
		model.addAttribute("pname", pname);
	}//list
	
	@PostMapping("/modify")
	public void modify(Model model, int pno) {
		model.addAttribute("pno", pno);
	}//modify
	
}//class
