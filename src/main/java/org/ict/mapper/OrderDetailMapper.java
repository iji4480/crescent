package org.ict.mapper;

import java.util.List;

import org.ict.domain.OrderDetailVO;

public interface OrderDetailMapper {
	public void insert(OrderDetailVO vo);
	
	public List<OrderDetailVO> select(String orderNumber);
}//class
