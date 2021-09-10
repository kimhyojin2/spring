package com.yedam.app.employees.mapper;

import java.util.List;

import com.yedam.app.employees.domain.EmpVO;

public interface EmpMapper {
	
	//CRUD
	//등록
	public int insert(EmpVO vo);

	//수정
	public int update(EmpVO vo);
	
	//삭제
	public int delete(EmpVO vo);
	
	//단건조회
	public EmpVO read(EmpVO vo);
	
	//전체조회
	public List<EmpVO> getList();

}
