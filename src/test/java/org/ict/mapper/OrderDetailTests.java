package org.ict.mapper;

import org.ict.domain.OrderDetailVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderDetailTests {
	@Autowired
	private OrderDetailMapper mapper;
	
	@Test
	public void testInsert() {
		OrderDetailVO vo = new OrderDetailVO();
		
		vo.setOrderNumber("주문번호");//OrderList와 연계된 FK
		vo.setPno(0);//상품번호
		vo.setOcnt(0);//갯수
		vo.setResult(40000);//상품가격*갯수
		
		mapper.insert(vo);
	}
	
	@Test
	public void testSelect() {
		mapper.select("주문번호");//주문번호와 일치하는 내역들을 반환
	}

}//class
