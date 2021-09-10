package com.yedam.app.employees.mapper;

import java.util.List;

import com.yedam.app.employees.domain.DepartmentsVO;
import com.yedam.app.employees.domain.EmpVO;

public interface DepartmentsMapper {
	
	//CRUD
	//등록
	public int insert(EmpVO vo);

	//수정
	public int update(EmpVO vo);
	
	//삭제
	public int delete(EmpVO vo);
	
	//단건조회
	public EmpVO read(EmpVO vo);

	public List<DepartmentsVO> getDeptList();

}
