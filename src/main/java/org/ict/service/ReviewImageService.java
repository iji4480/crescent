package org.ict.service;

import java.util.List;

import org.ict.domain.ReviewImageVO;

public interface ReviewImageService {
	
	public void insert(ReviewImageVO vo);
	
	public void delete(int rno);
	
	public List<ReviewImageVO> findByRno(int rno);
}
