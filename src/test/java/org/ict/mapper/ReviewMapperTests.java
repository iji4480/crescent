package org.ict.mapper;

import java.util.List;

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
public class ReviewMapperTests {
	@Autowired
	private ReviewMapper mapper;
	
//	@Test
	public void testInsert() {
		ReviewVO vo = new ReviewVO();
		
		vo.setRtitle("리뷰 게시글 제목");
		vo.setRcontent("리뷰 게시글 본문");
		vo.setMno(2);
		vo.setPno(2);
		
		mapper.insert(vo);
	}//testInsert
	
	@Test
	public void testSeletAll() {
		Criteria cri = new Criteria();
		List<ReviewVO> lists = mapper.selectList(cri);
		
		lists.forEach(list -> {
			log.info(list);
		});//forEach
	}//testGetList
	
//	@Test
	public void testSelect() {
		mapper.select(2);
	}//testSelect
	
//	@Test
	public void testUpdate() {
		ReviewVO vo = new ReviewVO();
		
		vo.setRno(4);
		vo.setRtitle("리뷰 게시글 수정 제목");
		vo.setRcontent("리뷰 게시글 수정 본문");
		vo.setPno(2);
		
		mapper.update(vo);
	}//testUpdate
	
//	@Test
	public void testDelete() {
		mapper.delete(4);
	}//testDelete

//	@Test
	public void testSelectReview() {
		mapper.selectReview(0);//상품번호에 해당하는 최근 문의글 5개반환
	}

//	@Test
	public void testMyReview() {
		Criteria cri = new Criteria();
		cri.setPage(0);
		cri.setNumber(3);
		
		//마이페이지에 표출할 최근작성된 리뷰글 반환 및
		//내가 작성한 글 목록 페이징처리
		mapper.myReview(cri, 0);
	}

//	@Test
	public void testMyCount() {
		mapper.myCount(0);//내가 작성한 글 목록 페이징처리를 위한 글갯수 반환
		
	}

//	@Test
	public void testGetRno() {
		mapper.getRno();//리뷰 작성 직후 이미지테이블에 FK로 넘겨줄 글번호반환
	}
}
