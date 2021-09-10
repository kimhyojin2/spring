package com.yedam.app.employees.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.employees.domain.EmpVO;
import com.yedam.app.employees.mapper.EmpMapper;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired EmpMapper empMapper;
	
	@Override
	public int insert(EmpVO vo) {
		empMapper.insert(vo);
		return 0;
	}

	@Override
	public int update(EmpVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(EmpVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public EmpVO read(EmpVO vo) {
		// TODO Auto-generated method stub
		return empMapper.read(vo);
	}

	@Override
	public List<EmpVO> getList() {
		return empMapper.getList();
	}

}
