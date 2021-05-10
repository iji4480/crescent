package org.ict.service;

import org.ict.domain.LoginDTO;
import org.ict.domain.MemberVO;

public interface MemberService {
	public MemberVO login(LoginDTO dto) throws Exception;
	
	public void join(MemberVO vo);
	
	public void modifyInfo(MemberVO vo);
	
	public MemberVO idChk(String mid);
	
	public MemberVO pwFind(MemberVO vo);
	
	public void pwUpdate(MemberVO vo);
	
	public MemberVO idFind(MemberVO vo);
	
	public MemberVO getInfo(int mno);
}
