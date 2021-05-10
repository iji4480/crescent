package org.ict.service;

import org.ict.domain.ProductVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {
	
	@Autowired
	ProductService service;
	
	//@Test
	public void insert() {
		ProductVO vo= new ProductVO();
		vo.setPcnt(100);
		vo.setPdimg("testpdimg");
		vo.setPimg("test pimg");
		vo.setPname("testname");
		vo.setPrice(50000);
		service.create(vo);
	}
	
	//@Test
	public void search() {
		String name="modify";
		service.list(name);
	}
	
	//@Test
	public void update() {
		ProductVO vo= new ProductVO();
		vo.setPno(35);
		vo.setPcnt(1200);
		vo.setPdimg("testpdimg");
		vo.setPimg("test pimg");
		vo.setPname("modify");
		vo.setPrice(50000);
		service.modify(vo);
	}
	
	@Test
	public void detail() {
		int pno=35;
		service.detail(pno);
		
	}
	
	@Test
	public void List() {
		service.getAll();
	}
}
