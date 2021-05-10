package org.ict.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ict.domain.Criteria;
import org.ict.domain.QnaVO;

public interface QnaMapper {
	public void insert(QnaVO vo);
	
	public List<QnaVO> selectList(Criteria cri);
	
	public QnaVO select(int qno);
	
	public int count();
	
	public void update(QnaVO vo);
	
	public void delete(int qno);
	
	public List<QnaVO> selectQna(int pno);
	
	public List<QnaVO> myQna(@Param("cri") Criteria cri, @Param("mno") int mno);
	
	public int myCount(int mno);
}