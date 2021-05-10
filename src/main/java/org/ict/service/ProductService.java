package org.ict.service;

import java.util.List;

import org.ict.domain.ProductVO;
import org.ict.domain.QnaVO;
import org.ict.domain.ReviewVO;

public interface ProductService {
	public void create(ProductVO vo);
	
	public List<ProductVO> list(String pname);
	
	public void modify(ProductVO vo);
	
	public ProductVO detail(int pno);
	
	public void remove(int pno);
	
	public List<ProductVO> recom();
	
	public List<ProductVO> getAll();
	
	public void updateSales(int pno);
}
