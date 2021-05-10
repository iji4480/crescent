package org.ict.mapper;

import org.ict.domain.CartVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTests {
	@Autowired
	private CartMapper mapper;
	
	@Test
	public void testSelectList() {
		mapper.selectList(0);//해당 회원번호의 장바구니 리스트를 불러온다.
	}

//	@Test
	public void testTotal() {
		mapper.total(0);//해당 회원번호의 장바구니에 담겨있는 상품들의 가격*갯수의 값을 불러온다.
	}

//	@Test
	public void testInsert() {
		CartVO vo = new CartVO();
		
		vo.setMno(0);//장바구니를 저장할 회원번호
		vo.setPno(0);//장바구니에 담을 상품번호
		vo.setCnt(0);//장바구니에 담을 상품의 갯수
		
		mapper.insert(vo);
	}
	
//	@Test
	public void testCheck() {
		CartVO vo = new CartVO();
		
		vo.setPno(0);//장바구니에 담을 상품번호
		vo.setMno(0);//장바구니를 저장할 회원번호
		
		mapper.check(vo);//장바구니에 같은 상품이 없을경우 0을 반환
	}

//	@Test
	public void testDelete() {
		int[] arr = {0, 0};//장바구니에서 삭제할 상품들의 PK값인 cno를 담아준다.
		
		mapper.delete(arr);//배열에 담긴 정보와 일치하는 로우를 삭제
	}
}//class