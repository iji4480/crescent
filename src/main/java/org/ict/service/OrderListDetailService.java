package org.ict.service;

import java.util.List;

import org.ict.domain.OrderDetailVO;
import org.ict.mapper.OrderDetailMapper;

public interface OrderListDetailService {
	
	public void insert(OrderDetailVO vo);
	
	public List<OrderDetailVO> select(String orderNumber);
}
