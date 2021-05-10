package org.ict.service;

import org.ict.domain.CrescentVO;
import org.ict.mapper.CrescentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CrescentServiceImpl implements CrescentService {

	@Autowired
	private CrescentMapper mapper;
	
	@Override
	public List<CrescentVO> getIndex() {
		return mapper.getIndex();
	}

}
