package org.ict.service;

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
public class QnaServiceTests {
	
	@Autowired
	private QnaService service;
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		service.getList(cri);
	}//testGetList
	
//	@Test
	public void testGetDetail() {
		service.getDetail(4);
	}//testGet
	
//	@Test
	public void testWrite() {
		QnaVO vo = new QnaVO();
		
		vo.setQtitle("서비스 테스트 문의입니다.");
		vo.setQcontent("서비스 테스트 문의 본문입니다.");
		
		service.write(vo);
	}//testWrite
	
//	@Test
	public void testModify() {
		QnaVO vo = new QnaVO();
		vo.setQno(6);
		vo.setQtitle("서비스 제목 수정 테스트입니다.");
		vo.setQcontent("서비스 본문 수정 테스트입니다.");
		
		service.modify(vo);
	}//testModify
	
//	@Test
	public void testRemove() {
		service.remove(5);
	}//testRemove
	
}//class
