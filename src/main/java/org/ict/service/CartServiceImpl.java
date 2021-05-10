package org.ict.service;

import java.util.List;

import org.ict.domain.CartVO;
import org.ict.mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartMapper mapper;

	@Override
	public List<CartVO> getList(int mno) {
		return mapper.selectList(mno);
	}

	@Override
	public void addCart(CartVO vo) {
		mapper.insert(vo);
	}

	@Override
	public int checkCart(CartVO vo) {
		return mapper.check(vo);
	}

	@Override
	public void remove(int[] cnoArr) {
		mapper.delete(cnoArr);
	}

	@Override
	public List<CartVO> total(int mno) {
		return mapper.total(mno);
	}
	
}
