package org.ict.mapper;

import org.ict.domain.ReviewImageVO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class ReviewImageMapperTests {
	@Autowired
	private ReviewImageMapper mapper;
	
	@Test
	public void insert() {
		ReviewImageVO vo = new ReviewImageVO();
		
		vo.setRno(0);//리뷰 글번호 FK
		vo.setFileName("저장될 파일이름");
		vo.setUploadPath("저장될 폴더주소");
		vo.setUuid("uuid");
		
		mapper.insert(vo);
	}

	@Test
	public void delete() {
		mapper.delete(0);//글번호와 일치하는 이미지정보 모두 삭제
	}

	@Test
	public void findByRno() {
		mapper.findByRno(0);//글번호와 일치하는 모든 이미지정보 반환
	}
	
}
