package com.human.java.domain;

import java.awt.event.FocusEvent;
import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {

	   private int b_id;
	   private String b_name;
	   private String b_email;
	   private String b_title;
	   private String b_content;
	   private String b_pwd;
	   private String b_date;   
	   private int b_count;
	   private String b_ip;
	   private String b_fname;
	   private String b_fname_en;
	   private long b_fsize;
	   
	   
	   /***********************/
	   
	   MultipartFile file; // Form 태그에 있는 type="file"인 대상의 name=""과 동일해야함
	   
	   public MultipartFile getFile() {
		   return file;
	   }
	   public void setFile(MultipartFile file) {
		   this.file = file;
		   System.out.println("** 파일첨부 변수생성 **");
		   // 현재 이 시점은 Controller의 파라미터가 생성되는 시점 > Controller가 실행되기 전
		   // 현재 시점에서 file에 대한 정보를 담을 변수에 값을 채워주는 작업 코딩
		   
		   if ( !file.isEmpty()) { // file이 비어있지 않으면 / file에 뭐가 있으면
			   // 파일이름 추출, 사이즈 추출, 확장자 추출 등등...
			   this.b_fname = file.getOriginalFilename(); // 실제 file명을 넣어준다 
			   this.b_fsize = file.getSize();
			   
			   // 실제 파일 생성 >> 혹시 사용자가 같은 이름을 가진 파일을 첨부(업로드)한다면 이전 파일에게 덮어집니다 > 이전 파일에 훼손된다
//			   File f = new File("C:\\Users\\human\\Desktop\\stst3\\cWebBoard\\src\\main\\webapp\\resources\\upload\\"+b_fname);
			   
			   // 가짜 이름(파일이름)을 생성하여 문제를 보완합니다
			   // 1. 가짜이름에 사용할 파일의 확장자명을 추출(진짜이름에서 추출)
			   	String fileExtension = b_fname.substring(b_fname.lastIndexOf("."));
			   	
			   // 2. 사용자의 파일을 저장할때 이름이 겹치지않도록 암호화하는 특별한 코드(암호화)
			   //		형식 : 랜덤문자열32자리.확장자명
			   	this.b_fname_en = UUID.randomUUID().toString().replaceAll("-", "") +fileExtension;
			   	
			   	// b_fname_en : 랜덤 문자열이 32자리 이므로 중복없이 저장이 가능하다
			   	// 랜덤파일명(f_fname_en)와 실제파일명(b_fname)은 서로 매칭해야하기 때문에 DB에서 둘다 저장해야합니다
			   File f = new File("C:\\Users\\human\\Desktop\\stst3\\cWebBoard\\src\\main\\webapp\\resources\\upload\\"+b_fname_en);
			   
			   
			   try {
				    // 첨부파일로 받은 데이터를 File클래스로 만든 데이터에게 변환
				   file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		   }
		   
		   // 비어있으면(파일이없으면) 위 과정을 생략
	   }
 	   
	   
	      
	   
	   
	   
	   
	   
	   
	   
	   
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_email() {
		return b_email;
	}
	public void setB_email(String b_email) {
		this.b_email = b_email;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_pwd() {
		return b_pwd;
	}
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public String getB_ip() {
		return b_ip;
	}
	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}
	public String getB_fname() {
		return b_fname;
	}
	public void setB_fname(String b_fname) {
		this.b_fname = b_fname;
	}
	public String getB_fname_en() {
		return b_fname_en;
	}
	public void setB_fname_en(String b_fname_en) {
		this.b_fname_en = b_fname_en;
	}
	public long getB_fsize() {
		return b_fsize;
	}
	public void setB_fsize(long b_fsize) {
		this.b_fsize = b_fsize;
	}
	   
	   
}
