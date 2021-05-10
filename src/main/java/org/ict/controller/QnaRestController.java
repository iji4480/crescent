package org.ict.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ict.domain.Criteria;
import org.ict.domain.PageMaker;
import org.ict.domain.QnaVO;
import org.ict.service.QnaService;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/qna")
public class QnaRestController {
	@Autowired
	private QnaService service;
	
	//qnalist
	@GetMapping(value="/list/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> list(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> result = new HashMap<>();
		
		Criteria cri = new Criteria();
		cri.setPage(page);
		
		List<QnaVO> list = service.getList(cri);
		int count = service.getCount();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalPage(count);
		
		result.put("list", list);
		result.put("pageMaker", pageMaker);
		
		try {
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//qnalist
	
	//qnadetail
	@GetMapping(value="/{qno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<QnaVO> detail(@PathVariable("qno") int qno) {
		ResponseEntity<QnaVO> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.getDetail(qno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//qnadetail
	
	//qnawrtie
	@PostMapping(value="/write", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> write(@RequestBody QnaVO vo) {
		ResponseEntity<String> entity = null;
		
		try {
			service.write(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//qnawrtie
	
	//qnamodify
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/{qno}", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(@RequestBody QnaVO vo, @PathVariable("qno") int qno){
		ResponseEntity<String> entity = null;
		
		try {
			service.modify(vo);
			
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//qnamodify
	
	//qnaremove
	@DeleteMapping(value="/{qno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("qno") int qno) {
		ResponseEntity<String> entity = null;
		
		try {
			service.remove(qno);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//qnaremove
	
	@GetMapping(value="/product/{pno}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<QnaVO>> productQna(@PathVariable("pno") int pno) {
		ResponseEntity<List<QnaVO>> entity=null;
		
		try {
			entity=new ResponseEntity<>(service.qna(pno),HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//productQna
	
	@GetMapping(value="/myqna/{page}/{number}/{mno}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> myQna(@PathVariable("page") int page, @PathVariable("number") int number, @PathVariable("mno") int mno) {
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> result = new HashMap<>();
		
		Criteria cri = new Criteria();
		cri.setPage(page);
		cri.setNumber(number);
		
		List<QnaVO> list = service.myQna(cri, mno);
		
		int mycount = service.myCount(mno);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalPage(mycount);
		
		result.put("list", list);
		result.put("pageMaker", pageMaker);
		
		try {
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//productQna
	
}//class