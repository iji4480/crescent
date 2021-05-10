package org.ict.mapper;

import java.util.List;

import org.ict.domain.Criteria;
import org.ict.domain.NoticeVO;


public interface NoticeMapper {
	
	public List<NoticeVO> getList();
	
	public void write(NoticeVO notice);
	
	public NoticeVO read(int nno);
	
	public int delete(int nno);
	
	public int update(NoticeVO notice);
	
	public List<NoticeVO> listPage(Criteria cri); 
	
	public int countPageNum(Criteria cri);
	
	
	
	
}
