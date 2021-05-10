package org.ict.mapper;

import org.ict.domain.LoginDTO;
import org.ict.domain.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {
	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testIdChk() {
		mapper.idChk("아이디");//해당 문자열의 아이디가 DB에 저장되어있는지 중복체크
	}
	
//	@Test
	public void testJoin() {
		MemberVO vo = new MemberVO();
		
		//주소외의 모든 정보는 NOT NULL
		vo.setMid("아이디");
		vo.setPwd("비밀번호");
		vo.setName("이름");
		vo.setTel1("010");
		vo.setTel2("1234");
		vo.setTel3("5678");
		vo.setPostcode("우편번호");
		vo.setPostcode("주소");
		vo.setPostcode("상세주소");
		
		mapper.join(vo);//VO에 회원정보를 넣어 DB에 저장
	}
	
//	@Test
	public void testLogin() {
		LoginDTO dto = new LoginDTO();
		
		dto.setMid("아이디");
		dto.setPwd("비밀번호");
		
		try {
			mapper.login(dto);//DB에서 아이디와 비밀번호가 일치하는 데이터를 반환
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
	}
	
//	@Test
	public void testSelect() {
		mapper.select(1);//회원정보 테이블의 PK인 mno의 데이터를 반환
	}
	
//	@Test
	public void testUpdate() {
		MemberVO vo = new MemberVO();
		
		vo.setPwd("비밀번호");
		vo.setTel1("010");
		vo.setTel2("1234");
		vo.setTel3("5678");
		vo.setPostcode("우편번호");
		vo.setPostcode("주소");
		vo.setPostcode("상세주소");
		
		mapper.update(vo);//아이디와 이름을 제외한 정보들을 변경
	}
	
//	@Test
	public void testFindId() {
		MemberVO vo = new MemberVO();

		vo.setName("이름");
		vo.setTel1("010");
		vo.setTel2("1234");
		vo.setTel3("5678");
		
		mapper.findId(vo);//VO에 담긴 정보들로 DB의 정보와 일치하는 아이디를 반환
	}
	
//	@Test
	public void testFindPw() {
		MemberVO vo = new MemberVO();

		vo.setMid("아이디");
		vo.setName("이름");
		vo.setTel1("010");
		vo.setTel2("1234");
		vo.setTel3("5678");
		
		mapper.findPw(vo);//VO에 담긴 정보들로 DB의 정보와 일치하는 아이디를 반환
	}
	
//	@Test
	public void testUpdatePw() {

		MemberVO vo = new MemberVO();

		vo.setMid("아이디");
		vo.setPwd("비밀번호");
		
		mapper.updatePw(vo);//findPw에서 일치하는 정보가 있으면 해당 아이디의 비밀번호를 수정
	}
}//class