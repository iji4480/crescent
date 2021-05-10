package org.ict.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ict.domain.CartVO;

public interface CartMapper {
	public List<CartVO> selectList(int mno);
	
	public List<CartVO> total(int mno);
	
	public void insert(CartVO vo);
	
	public int check(CartVO vo);
	
	public void delete(@Param("cnoArr") int[] cnoArr);
}