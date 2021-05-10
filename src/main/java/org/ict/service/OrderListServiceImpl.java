package org.ict.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ict.domain.CartVO;
import org.ict.domain.OrderListVO;
import org.ict.mapper.CartMapper;
import org.ict.mapper.OrderDetailMapper;
import org.ict.mapper.OrderListMapper;
import org.ict.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderListServiceImpl implements OrderListService {

	@Autowired
	private OrderListMapper mapper;
	@Autowired
	private OrderDetailMapper dtmapper;
	@Autowired
	private CartMapper ctmapper;
	@Autowired
	private ProductMapper pdmapper;
	
	//장바구니에서 선택된 상품 정보
	@Override
	public List<CartVO> paymentList(@Param("cnoArr") int[] arr) {
		return mapper.selectPayment(arr);
	}
	@Override
	public List<CartVO> total(int[] arr) {
		return mapper.total(arr);
	}
	//장바구니에서 선택된 상품 정보
	
	@Transactional
	@Override
	public void insertOrder(OrderListVO vo, int[] cnoArr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
		Date date = new Date();
		String str = sdf.format(date) + vo.getMno();
		
		vo.setOrderNumber(str);
		
		mapper.insertOrder(vo);
		vo.getOrderDetail().forEach(detail -> {
			detail.setOrderNumber(str);
			dtmapper.insert(detail);
			pdmapper.updateSales(detail.getPno());
		});
		
		ctmapper.delete(cnoArr);
	}
	
	@Transactional
	@Override
	public List<OrderListVO> selectAll(int mno) {
		List<OrderListVO> list = mapper.selectAll(mno);
		
		list.forEach(item -> {
			item.setOrderDetail(dtmapper.select(item.getOrderNumber()));
		});
		
		return list;
	}
	
	@Override
	public OrderListVO selectMno(int mno) {
		return mapper.selectMno(mno);
	}
	
	@Override
	public OrderListVO selectOrNum(String orderNumber) {
		return mapper.selectOrNum(orderNumber);
	}
	
}