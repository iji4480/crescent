package org.ict.mapper;

import org.ict.domain.OrderListVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderListMappertests {
	@Autowired
	private OrderListMapper mapper;
	
	@Test
	public void testSelectPayment() {
		int[] arr = {0};
		
		mapper.selectPayment(arr);//배열에 담긴 cno값들과 일치하는 데이터를 불러온다
	}
	
//	@Test
	public void testTotal() {
		int[] arr = {0};
		mapper.total(arr);//배열에 담긴 cno값들과 일치하는 상품들의 가격*갯수의 값을 불러온다.
	}
	
//	@Test
	public void insertOrder() {
		OrderListVO vo = new OrderListVO();
		
		vo.setOrderNumber("주문번호");//yyMMddhhmmss + mno
		vo.setMno(0);
		vo.setName("수령인");
		vo.setPostcode("우편번호");
		vo.setAddr1("주소");
		vo.setAddr2("상세주소");
		vo.setTel1("010");
		vo.setTel2("1234");
		vo.setTel3("5678");
		vo.setTotal(40000);//주문내역에 들어갈 총 주문금액
		
		mapper.insertOrder(vo);
	}

//	@Test
	public void testSelectAll() {
		mapper.selectAll(0);//회원번호의 주문내역을 모두 반환
	}

//	@Test
	public void testSelectMno() {
		mapper.selectMno(0);//마이페이지에 표출할 가장 최근 주문한 내역 반환
	}
	
//	@Test
	public void testSelectOrNum() {
		mapper.selectOrNum("주문번호");//해당 주문번호의 주문내역 반환
	}
	
}//class