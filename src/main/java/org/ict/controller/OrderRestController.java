package org.ict.controller;

import java.util.List;

import org.ict.domain.CartVO;
import org.ict.domain.OrderDetailVO;
import org.ict.domain.OrderListVO;
import org.ict.service.OrderListDetailService;
import org.ict.service.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order/*")
public class OrderRestController {
	@Autowired
	private OrderListService service;
	@Autowired
	private OrderListDetailService dtService;
	
	@GetMapping(value="/cartlist/{arr}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<CartVO>> cartlist(@PathVariable("arr") int[] arr) {
		ResponseEntity<List<CartVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.paymentList(arr), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//cartlist
	
	@GetMapping(value="/total/{arr}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CartVO> total(@PathVariable("arr") int[] arr) {
		ResponseEntity<CartVO> entity = null;
		
		int x = 0;
		
		try {
			for(CartVO a : service.total(arr)) {
				x += a.getTotal();
			}
			
			CartVO vo = new CartVO();
			vo.setTotal(x);
			
			entity = new ResponseEntity<>(vo, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//total
	
	@GetMapping(value="/list/{mno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<OrderListVO>> list(@PathVariable("mno") int mno) {
		ResponseEntity<List<OrderListVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.selectAll(mno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//list
	
	@GetMapping(value="/listMno/{mno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<OrderListVO> listOne(@PathVariable("mno") int mno) {
		ResponseEntity<OrderListVO> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.selectMno(mno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//listOne
	
	@GetMapping(value="/detail/{orderNumber}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<OrderDetailVO>> listDetailOne(@PathVariable("orderNumber") String orderNumber) {
		ResponseEntity<List<OrderDetailVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(dtService.select(orderNumber), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//listDetailOne
	
	@GetMapping(value="/{orderNumber}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<OrderListVO> orderDetail(@PathVariable("orderNumber") String orderNumber) {
		ResponseEntity<OrderListVO> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.selectOrNum(orderNumber), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//listDetailOne
	
}//class
