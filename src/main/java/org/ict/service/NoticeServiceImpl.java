package org.ict.service;

import java.util.List;

import org.ict.domain.Criteria;
import org.ict.domain.NoticeVO;
import org.ict.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> getList() {
		return mapper.getList();
	}//getList
	
	@Override
	public void write(NoticeVO notice) {
		mapper.write(notice);
		
		
	}

	@Override
	public NoticeVO detail(int nno) {
		
		return mapper.read(nno);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		
		return mapper.update(notice) == 1;
	}

	@Override
	public boolean remove(int nno) {
		
		return mapper.delete(nno) == 1;
	}

	@Override
	public List<NoticeVO> getListPage(Criteria cri) {
		
		return mapper.listPage(cri);
	}

	@Override
	public int getCountPage(Criteria cri) {
		
		return mapper.countPageNum(cri);
	}

}
