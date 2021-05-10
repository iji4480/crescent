package org.ict.service;

import java.util.List;

import org.ict.domain.CartVO;

public interface CartService {
	public List<CartVO> getList(int mno);
	
	public List<CartVO> total(int mno);
	
	public void addCart(CartVO vo);
	
	public int checkCart(CartVO vo);
	
	public void remove(int[] cnoArr);
}
