package org.ict.controller;

import org.ict.domain.OrderListVO;
import org.ict.service.OrderListService;
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
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderListService service;
	
	@GetMapping("/payment")
	public void payment() {
		
	}
	
	@PostMapping("/payment")
	public String payment(int[] cnoArr, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("cnoArr", cnoArr);
		rttr.addFlashAttribute("length", cnoArr.length);
		
		return "redirect:/order/payment";
	}
	
	@PostMapping("/paying")
	public String order(OrderListVO vo, int[] cnoArr) {
		
		service.insertOrder(vo, cnoArr);
		
		return "/order/complite";
	}
	
	@GetMapping("/complite")
	public void complite() {
		
	}
	
	@GetMapping("/orderlist")
	public void orderList() {
		
	}
	
	@GetMapping("/detail")
	public String detail(Model model, String ordernumber) {
		model.addAttribute("orderNumber", ordernumber);
		
		return "/order/orderdetail";
	}
}//class
