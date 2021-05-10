package org.ict.mapper;

import org.ict.domain.LoginDTO;
import org.ict.domain.MemberVO;

public interface MemberMapper {
	public MemberVO idChk(String mid);
	
	public void join(MemberVO vo);
	
	public MemberVO login(LoginDTO dto) throws Exception;
	
	public MemberVO select(int mno);
	
	public void update(MemberVO vo);
	
	public MemberVO findId(MemberVO vo);
	
	public MemberVO findPw(MemberVO vo);
	
	public void updatePw(MemberVO vo);
}
