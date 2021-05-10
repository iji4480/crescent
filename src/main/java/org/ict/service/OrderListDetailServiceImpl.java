package org.ict.service;

import java.util.List;

import org.ict.domain.OrderDetailVO;
import org.ict.mapper.OrderDetailMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderListDetailServiceImpl implements OrderListDetailService {

	@Autowired
	private OrderDetailMapper mapper;
	
	@Override
	public void insert(OrderDetailVO vo) {
		mapper.insert(vo);
	}

	@Override
	public List<OrderDetailVO> select(String orderNumber) {
		return mapper.select(orderNumber);
	}
	
}
