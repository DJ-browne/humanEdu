package com.human.java.domain;

import lombok.Data;

@Data
public class MemberVO {

	// getter setter toString 생성자....등등
	private String userId;
	private String userPass;
	private String userName;
	private int userNo;
	private String userEmail;
	private String userTitle;
	private String userContent;
	private String userDate;
	private int userCount;
	private String userFname;
	private String userFname_en;
	private long userFsize;
}
