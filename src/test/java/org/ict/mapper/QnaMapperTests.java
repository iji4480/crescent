package org.ict.mapper;

import java.util.List;

import org.ict.domain.Criteria;
import org.ict.domain.QnaVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaMapperTests {
	
	@Autowired
	private QnaMapper mapper;

//	@Test
	public void testInsert() {
		QnaVO vo = new QnaVO();
		
		vo.setMno(0);
		vo.setQtitle("문의 게시판 제목");
		vo.setQcontent("문의 게시판 본문");
		
		mapper.insert(vo);
	}//testInsert
	
	@Test
	public void testSeletList() {
		Criteria cri = new Criteria();
		List<QnaVO> lists = mapper.selectList(cri);
		
		lists.forEach(list -> {
			log.info(list);
		});//forEach
	}//testGetList
	
//	@Test
	public void testSelect() {
		mapper.select(5);
	}//testSelect
	
//	@Test
	public void testCount() {
		mapper.count();//페이징처리를 위한 문의게시판의 총 글갯수를 반환
	}
	
//	@Test
	public void testUpdate() {
		QnaVO vo = new QnaVO();
		
		vo.setQno(4);
		vo.setQtitle("문의게시판 수정 제목");
		vo.setQcontent("문의 게시판 수정 본문");
		
		mapper.update(vo);
	}//testUpdate
	
//	@Test
	public void testDelete() {
		mapper.delete(1);
	}//testDelete
	
//	@Test
	public void testSelectQna() {
		mapper.selectQna(0);//상품번호에 해당하는 최근 문의글 5개반환
	}
	
//	@Test
	public void testMyQna() {
		Criteria cri = new Criteria();
		cri.setPage(0);
		cri.setNumber(3);
		
		//마이페이지에 표출할 최근작성된 문의글 반환 및
		//내가 작성한 글 목록 페이징처리
		mapper.myQna(cri, 0);
	}
	
//	@Test
	public void testMyCount() {
		mapper.myCount(0);//내가 작성한 글 목록 페이징처리를 위한 글갯수 반환
	}
	
}//class
