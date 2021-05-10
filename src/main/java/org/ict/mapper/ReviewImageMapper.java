package org.ict.mapper;

import java.util.List;

import org.ict.domain.ReviewImageVO;

public interface ReviewImageMapper {
	public void insert(ReviewImageVO vo);
	
	public void delete(int rno);
	
	public List<ReviewImageVO> findByRno(int rno);
}
