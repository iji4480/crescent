package org.ict.controller;

import org.ict.domain.CrescentVO;
import org.ict.service.CrescentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CrescentRestController {
	@Autowired
	private CrescentService service;
	
	@GetMapping("/index")
	public ResponseEntity<List<CrescentVO>> getIndex() {
		ResponseEntity<List<CrescentVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.getIndex(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}