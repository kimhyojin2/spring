package com.yedam.app.employees.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EmpVO {
	
	private long employeeId;
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	private Date hireDate;
	private String jobId;
	private long salary;
	private long commissionPct;
	private long managerId;
	private long departmentId;

}
