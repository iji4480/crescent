package org.ict.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.ict.domain.Criteria;
import org.ict.domain.PageMaker;
import org.ict.domain.ReviewImageVO;
import org.ict.domain.ReviewVO;
import org.ict.service.ReviewImageService;
import org.ict.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/review/*")
public class ReviewRestController {
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private ReviewImageService imgService;
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = "reviewImg-" + sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	@GetMapping(value="/list/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> reviewList(@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> result = new HashMap<>();
		
		Criteria cri = new Criteria();
		cri.setPage(page);
		
		List<ReviewVO> list = service.getList(cri);
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
	}//reviewList
	
	@GetMapping(value="/{rno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReviewVO> reviewDetail(@PathVariable("rno") int rno) {
		ResponseEntity<ReviewVO> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.getDetail(rno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//reviewDetail
	
	@DeleteMapping(value="/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") int rno) {
		ResponseEntity<String> entity = null;
		
		
		try {
			service.remove(rno);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//remove
	
	@GetMapping(value="/product/{pno}", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ReviewVO>> productReview(@PathVariable("pno") int pno) {
		ResponseEntity<List<ReviewVO>> entity = null;
		
		try {
			entity=new ResponseEntity<>(service.review(pno),HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//productReview
	
	@GetMapping(value="/myreview/{page}/{number}/{mno}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> myReview(@PathVariable("page") int page, @PathVariable("number") int number, @PathVariable("mno") int mno) {
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> result = new HashMap<>();
		
		Criteria cri = new Criteria();
		cri.setPage(page);
		cri.setNumber(number);
		
		List<ReviewVO> list = service.myReview(cri, mno);
		
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
	}//myReview
	
	@PostMapping(value="/imgUpload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ReviewImageVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<ReviewImageVO> list = new ArrayList<>();
		String uploadFolder = "C:\\crescent\\img";
		
		String uploadFolderPath = getFolder();
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}//if
		
		for(MultipartFile multipartFile : uploadFile) {
			ReviewImageVO reviewImgVO = new ReviewImageVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			reviewImgVO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				reviewImgVO.setUuid(uuid.toString());
				reviewImgVO.setUploadPath(uploadFolderPath);
				
				list.add(reviewImgVO);
			} catch (Exception e) {
				log.error(e.getMessage());
			}//catch
		}//for
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}//uploadAjaxPost
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		File file = new File("c:\\crescent\\img\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@GetMapping(value="/img/{rno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReviewImageVO>> getImage(@PathVariable("rno") int rno) {
		ResponseEntity<List<ReviewImageVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(imgService.findByRno(rno), HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}//getImage
	
}//class