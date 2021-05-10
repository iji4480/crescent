package org.ict.controller;

import java.util.List;

import org.ict.domain.CartVO;
import org.ict.domain.QnaVO;
import org.ict.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/cart")
@Log4j
public class CartRestController {
	@Autowired
	private CartService service;
	
	@PostMapping(value="/addCart", consumes="application/json", produces= MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> addCart(@RequestBody CartVO vo) {
		ResponseEntity<String> entity = null;
		
		if(service.checkCart(vo) == 0) {//장바구니 상품중복X
			try {
				service.addCart(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}//catch
		} else if(service.checkCart(vo) >= 1) {//장바구니 상품중복O
			try {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}//catch
		}//else if
		
		return entity;
	}//addCart
	
	@GetMapping(value="/list/{mno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<CartVO>> list(@PathVariable("mno") int mno) {
		ResponseEntity<List<CartVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.getList(mno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//list
	
	@GetMapping(value="/total/{mno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CartVO> total(@PathVariable("mno") int mno) {
		ResponseEntity<CartVO> entity = null;
		
		int x = 0;
		
		try {
			for(CartVO a : service.total(mno)) {
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
	
	@DeleteMapping(value="/remove", consumes="application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> remove(@RequestBody int[] cnoArr) {
		ResponseEntity<String> entity = null;
		
		try {
			service.remove(cnoArr);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//remove
}
