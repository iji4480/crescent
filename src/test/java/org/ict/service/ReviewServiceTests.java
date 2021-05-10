package org.ict.service;

import org.ict.domain.Criteria;
import org.ict.domain.ReviewVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewServiceTests {
	@Autowired
	private ReviewService service;
	
//	@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		service.getList(cri);
	}//testGetList
	
//	@Test
	public void testGetDetail() {
		service.getDetail(6);
	}//testGet
	
//	@Test
	public void testWrite() {
		ReviewVO vo = new ReviewVO();

		vo.setRtitle("서비스 테스트 리뷰입니다.");
		vo.setRcontent("서비스 테스트 리뷰 본문입니다.");
		vo.setMno(4);
		vo.setPno(1);
		
		service.write(vo);
	}//testWrite
	
//	@Test
	public void testModify() {
		ReviewVO vo = new ReviewVO();

		vo.setRno(6);
		vo.setRtitle("테스트 리뷰 수정입니다.");
		vo.setRcontent("테스트 리뷰 수정 본문입니다.");
		vo.setPno(2);
		
		service.modify(vo);
	}//testModify
	
//	@Test
	public void testRemove() {
		service.remove(8);
	}//testRemove
}
