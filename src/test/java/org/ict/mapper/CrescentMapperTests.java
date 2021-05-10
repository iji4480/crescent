package org.ict.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CrescentMapperTests {
	@Autowired
	private CrescentMapper mapper;
	
	@Test
	public void testGetIndex() {
		mapper.getIndex();//메인페이지에 표출될 salescnt가 높은 3개 상품 리스트를 가져온다.
	}
}
