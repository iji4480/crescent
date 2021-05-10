package org.ict.service;

import java.util.List;

import org.ict.domain.Criteria;
import org.ict.domain.QnaVO;
import org.ict.domain.ReviewVO;

public interface ReviewService {
	public void write(ReviewVO vo);
	
	public List<ReviewVO> getList(Criteria cri);
	
	public int getCount();
	
	public ReviewVO getDetail(int rno);
	
	public void modify(ReviewVO vo);
	
	public void remove(int rno);
	
	public List<ReviewVO> review(int pno);
	
	public List<ReviewVO> myReview(Criteria cri, int mno);
	
	public int myCount(int mno);
	
	public int getRno();
}
