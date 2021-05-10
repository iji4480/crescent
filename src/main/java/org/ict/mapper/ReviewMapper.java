package org.ict.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ict.domain.Criteria;
import org.ict.domain.ReviewVO;

public interface ReviewMapper {
	public void insert(ReviewVO vo);
	
	public List<ReviewVO> selectList(Criteria cri);
	
	public ReviewVO select(int rno);
	
	public int count();
	
	public void update(ReviewVO vo);
	
	public void delete(int rno);
	
	public List<ReviewVO> selectReview(int pno);
	
	public List<ReviewVO> myReview(@Param("cri") Criteria cri, @Param("mno") int mno);
	
	public int myCount(int mno);
	
	public int getRno();
}