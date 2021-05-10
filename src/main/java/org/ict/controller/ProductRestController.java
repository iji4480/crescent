package org.ict.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.ict.domain.ProductVO;
import org.ict.domain.QnaVO;
import org.ict.domain.ReviewVO;
import org.ict.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.config.ExecutorBeanDefinitionParser;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/product/*")
@Log4j
public class ProductRestController {
	@Autowired
	private ProductService service;
	
	@PostMapping(value="", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> prodWrite(@RequestBody ProductVO vo) {
		ResponseEntity<String> entity=null;
		
		try {
			service.create(vo);
			entity=new ResponseEntity<String>("SUCCESS" ,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity= new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//prodWrite
	
	@GetMapping(value="/all", produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ProductVO>> prodList() {
		ResponseEntity<List<ProductVO>> entity=null;
		
		try {
			entity=new ResponseEntity<>(service.list(""),HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//prodList
	
	@GetMapping(value="/all/{pname}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ProductVO>> prodList(@PathVariable("pname") String pname) {
		ResponseEntity<List<ProductVO>> entity=null;
		
		try {
			entity=new ResponseEntity<>(service.list(pname),HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//prodList
	
	@GetMapping(value="/one/{pno}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ProductVO> prodDetail(@PathVariable("pno") int pno) {
		ResponseEntity<ProductVO> entity=null;
		
		try {
			entity=new ResponseEntity<>(service.detail(pno), HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//prodDetail
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/{pno}", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> prodModify(@RequestBody ProductVO vo, @PathVariable("pno") int pno) {
		ResponseEntity<String> entity=null;
		
		try {
			vo.setPno(pno);
			service.modify(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;			
	}//prodModify
	
	@DeleteMapping(value="/{pno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> prodRemove(@PathVariable("pno") int pno) {
		ResponseEntity<String> entity=null;
		
		try {
			service.remove(pno);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);}
		catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//prodRemove
	
	@GetMapping(value="/recom", produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ProductVO>> recommend() {
		ResponseEntity<List<ProductVO>> entity=null;
		
		try {
			entity=new ResponseEntity<>(service.recom(),HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//recommend
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public ResponseEntity <String> uploadAjaxPost(MultipartFile pimg){
		ResponseEntity<String> entity=null;

		String uploadFolder= "C:\\crescent\\img\\";
		
		String uploadFolderPath="product";
		
		File uploadPath= new File(uploadFolder, uploadFolderPath);
		if(uploadPath.exists()== false) {
			uploadPath.mkdirs();
		}
		MultipartFile multipartFile = pimg;
		String uploadFileName=multipartFile.getOriginalFilename();
		uploadFileName =uploadFileName.substring(uploadFileName.lastIndexOf("/") +1);
		
		try {
			File saveFile= new File (uploadPath, uploadFileName);
			multipartFile.transferTo(saveFile);
			entity=new ResponseEntity<String>(uploadFileName, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return entity;
	
	}//uploadAjaxPost
	@PostMapping("/uploadAjaxAction2")
	@ResponseBody
	public ResponseEntity <String> uploadAjaxPost2(MultipartFile pdimg){
		ResponseEntity<String> entity=null;

		String uploadFolder= "C:\\crescent\\img\\";
		
		String uploadFolderPath="product";
		
		File uploadPath= new File(uploadFolder, uploadFolderPath);
		if(uploadPath.exists()== false) {
			uploadPath.mkdirs();
		}
		MultipartFile multipartFile = pdimg;
		String uploadFileName=multipartFile.getOriginalFilename();
		uploadFileName =uploadFileName.substring(uploadFileName.lastIndexOf("/") +1);
		
		try {
			File saveFile= new File (uploadPath, uploadFileName);
			multipartFile.transferTo(saveFile);
			entity=new ResponseEntity<String>(uploadFileName, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return entity;
	
	}//uploadAjaxPost
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		
		File file = new File("C:\\crescent\\img\\product\\" + fileName);
		
		// 그림, 동영상 등의 파일은 바이트코드로 전송해야 손실이 없기 때문에
		// byte[] 자료형으로 바꿔서 전달하도록 처리합니다.
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", 
						Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(
							FileCopyUtils.copyToByteArray(file),
							header,
							HttpStatus.OK);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}//display
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String del1, String del2){
	
		File file = null;
		File file2 = null;
		
		try {
			file = new File("C:\\crescent\\img\\product\\" + 
							URLDecoder.decode(del1, "UTF-8"));
			file2 = new File("C:\\crescent\\img\\product\\" + 
					URLDecoder.decode(del2, "UTF-8"));
			
			file.delete();
			file2.delete();
			
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
}//class
