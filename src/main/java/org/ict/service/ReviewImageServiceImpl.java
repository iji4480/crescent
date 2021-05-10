package org.ict.service;

import java.util.List;

import org.ict.domain.ReviewImageVO;
import org.ict.mapper.ReviewImageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewImageServiceImpl implements ReviewImageService {

	@Autowired
	private ReviewImageMapper mapper;
	
	@Override
	public void insert(ReviewImageVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);
	}

	@Override
	public List<ReviewImageVO> findByRno(int rno) {
		return mapper.findByRno(rno);
	}
	
}
