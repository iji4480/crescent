package org.ict.mapper;

import org.ict.domain.Criteria;
import org.ict.domain.NoticeVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {

	@Autowired
	private NoticeMapper mapper;
	
	@Test
	public void testListPage() {
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setNumber(10);
		
		mapper.listPage(cri);
	}
	
//	@Test
	public void testWrite() {
		NoticeVO notice = new NoticeVO();
		
		notice.setNtitle("매퍼 테스트 공지 제목");
		notice.setNcontent("매퍼 테스트 공지 내용");
		mapper.write(notice);
	}
	
//	@Test
	public void testDetail() {
		mapper.read(61);
	}
	
//	@Test
	public void testDelete() {
		mapper.delete(40);
	}
	
//	@Test
	public void testUpdate() {
		NoticeVO notice = new NoticeVO();
		
		notice.setNno(60);
		notice.setNtitle("매퍼 테스트 수정 된 제목");
		notice.setNcontent("매퍼 테스트 수정 된 본문");
		
		mapper.update(notice);
	}
	
}