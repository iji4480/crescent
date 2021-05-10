package org.ict.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ict.domain.CartVO;
import org.ict.domain.OrderListVO;

public interface OrderListService {
	//장바구니에서 선택된 상품 정보
	public List<CartVO> paymentList(@Param("arr") int[] arr);
	public List<CartVO> total(@Param("arr") int[] arr);
	//장바구니에서 선택된 상품 정보
	
	public void insertOrder(OrderListVO vo, int[] cnoArr);
	
	public List<OrderListVO> selectAll(int mno);
	
	public OrderListVO selectMno(int mno);
	
	public OrderListVO selectOrNum(String orderNumber);
}
