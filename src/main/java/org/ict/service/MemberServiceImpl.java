package org.ict.service;

import org.ict.domain.LoginDTO;
import org.ict.domain.MemberVO;
import org.ict.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return mapper.login(dto);
	}

	@Override
	public void join(MemberVO vo) {
		mapper.join(vo);
	}
	
	@Override
	public void modifyInfo(MemberVO vo) {
		mapper.update(vo);
	}

	@Override
	public MemberVO idChk(String mid) {
		return mapper.idChk(mid);
	}

	@Override
	public MemberVO pwFind(MemberVO vo) {
		return mapper.findPw(vo);
	}

	@Override
	public void pwUpdate(MemberVO vo) {
		mapper.updatePw(vo);
	}

	@Override
	public MemberVO idFind(MemberVO vo) {
		return mapper.findId(vo);
	}

	@Override
	public MemberVO getInfo(int mno) {
		return mapper.select(mno);
	}
}
