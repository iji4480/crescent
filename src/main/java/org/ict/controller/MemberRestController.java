package org.ict.controller;

import org.ict.domain.MemberVO;
import org.ict.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/member/*")
public class MemberRestController {
	@Autowired
	private MemberService service;
	
	@PostMapping(value = "/{mid}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MemberVO> idChk(@PathVariable("mid") String mid) {
		ResponseEntity<MemberVO> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.idChk(mid), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PostMapping(value = "/joinInfo", consumes="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> joinInfo(@RequestBody MemberVO vo){
	
		ResponseEntity<String> entity = null;
		
		try {
			service.join(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
			
		return entity;
	}
	
	@GetMapping(value="/{mno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MemberVO> total(@PathVariable("mno") int mno) {
		ResponseEntity<MemberVO> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.getInfo(mno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//total
	
	@PostMapping(value="/modifyInfo", consumes="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyInfo(@RequestBody MemberVO vo){
		ResponseEntity<String> entity = null;
		
		try {
			service.modifyInfo(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
			
		return entity;
	}
	
}
