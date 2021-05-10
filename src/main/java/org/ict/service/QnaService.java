package org.ict.service;

import java.util.List;

import org.ict.domain.Criteria;
import org.ict.domain.QnaVO;

public interface QnaService {
	public void write(QnaVO vo);
	
	public List<QnaVO> getList(Criteria cri);
	
	public int getCount();
	
	public QnaVO getDetail(int qno);
	
	public void modify(QnaVO vo);
	
	public void remove(int qno);
	
	public List<QnaVO> qna(int pno);
	
	public List<QnaVO> myQna(Criteria cri, int mno);
	
	public int myCount(int mno);
}
