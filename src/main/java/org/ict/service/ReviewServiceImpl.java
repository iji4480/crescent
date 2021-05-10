package org.ict.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.ict.domain.Criteria;
import org.ict.domain.ReviewImageVO;
import org.ict.domain.ReviewVO;
import org.ict.mapper.ReviewImageMapper;
import org.ict.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper mapper;
	
	@Autowired
	private ReviewImageMapper imgMapper;
	
	@Transactional
	@Override
	public void write(ReviewVO vo) {
		mapper.insert(vo);
		
		if(vo.getImageList() == null || vo.getImageList().size() <= 0) {
			return;
		}
		
		vo.getImageList().forEach(image -> {
			image.setRno(mapper.getRno());
			imgMapper.insert(image);
		});
	}

	@Override
	public List<ReviewVO> getList(Criteria cri) {
		return mapper.selectList(cri);
	}
	
	@Override
	public int getCount() {
		return mapper.count();
	}

	@Override
	public ReviewVO getDetail(int rno) {
		return mapper.select(rno);
	}
	
	@Transactional
	@Override
	public void modify(ReviewVO vo) {
		File file = null;
		List<ReviewImageVO> list = imgMapper.findByRno(vo.getRno());
		
		try {
			for(int i = 0; i < list.size(); i++) {
				file = new File("c:\\crescent\\img\\" + URLDecoder.decode(
						list.get(i).getUploadPath() + "\\" + list.get(i).getUuid() + "_" + list.get(i).getFileName()
						, "UTF-8"));
				
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		if(vo.getImageList() != null) {
			imgMapper.delete(vo.getRno());
			vo.getImageList().forEach(image -> {
				image.setRno(vo.getRno());
				imgMapper.insert(image);
			});
			vo.setImageList(imgMapper.findByRno(vo.getRno()));
		}
		
		mapper.update(vo);
	}
	
	@Transactional
	@Override
	public void remove(int rno) {
		File file = null;
		List<ReviewImageVO> list = imgMapper.findByRno(rno);
		
		try {
			for(int i = 0; i < list.size(); i++) {
				file = new File("c:\\crescent\\img\\" + URLDecoder.decode(
						list.get(i).getUploadPath() + "\\" + list.get(i).getUuid() + "_" + list.get(i).getFileName()
						, "UTF-8"));
				
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		imgMapper.delete(rno);
		mapper.delete(rno);
	}

	@Override
	public List<ReviewVO> review(int pno) {
		return mapper.selectReview(pno);
	}

	@Override
	public List<ReviewVO> myReview(Criteria cri, int mno) {
		return mapper.myReview(cri, mno);
	}

	@Override
	public int myCount(int mno) {
		return mapper.myCount(mno);
	}

	@Override
	public int getRno() {
		return mapper.getRno();
	}

}
