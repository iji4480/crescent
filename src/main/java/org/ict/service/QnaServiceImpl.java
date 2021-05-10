package org.ict.service;

import java.util.List;

import org.ict.domain.Criteria;
import org.ict.domain.QnaVO;
import org.ict.mapper.QnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper mapper;
	
	@Override
	public void write(QnaVO vo) {
		mapper.insert(vo);
	}

	@Override
	public List<QnaVO> getList(Criteria cri) {
		return mapper.selectList(cri);
	}

	@Override
	public int getCount() {
		return mapper.count();
	}

	@Override
	public QnaVO getDetail(int qno) {
		return mapper.select(qno);
	}

	@Override
	public void modify(QnaVO vo) {
		mapper.update(vo);
	}

	@Override
	public void remove(int qno) {
		mapper.delete(qno);
	}

	@Override
	public List<QnaVO> qna(int pno) {
		return mapper.selectQna(pno);
	}

	@Override
	public List<QnaVO> myQna(Criteria cri, int mno) {
		return mapper.myQna(cri, mno);
	}

	@Override
	public int myCount(int mno) {
		return mapper.myCount(mno);
	}

}
