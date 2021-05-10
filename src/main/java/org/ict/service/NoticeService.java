package org.ict.service;

import java.util.List;

import org.ict.domain.Criteria;
import org.ict.domain.NoticeVO;

public interface NoticeService {
	
	
	public void write(NoticeVO noticevo);
	
	public NoticeVO detail(int nno);
	
	public boolean modify(NoticeVO notice);
	
	public boolean remove(int nno);
	
	public List<NoticeVO> getList();
	
	public List<NoticeVO> getListPage(Criteria cri);
	
	public int getCountPage(Criteria cri);
	

	
}
