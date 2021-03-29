package com.TeamProjects.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDTO {
	private String mid;
	private String mname;
	private String mpassword;
	private Date mbirth;
	private String mrank;
	private String mclass;
	private Date mdate;
	private String mgender;
	
	private String mphone;
	private String pnum1; 	//전화번호1
	private String pnum2;	//전화번호2
	private String pnum3;	//전화번호3
	
	
	private String memail;
	private String memailId;   //이메일아이디
	private String memailDomain; //이메일도메인
	
	private String mlabel;	//우편번호
	private String maddress;
	private String maddr; //주소
	private String medetailAddress; //상세주소
	private String mextraAddress;//참고항목
	
	private MultipartFile mfile;
	private String mfilename;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public Date getMbirth() {
		return mbirth;
	}
	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}
	public String getMrank() {
		return mrank;
	}
	public void setMrank(String mrank) {
		this.mrank = mrank;
	}
	public String getMclass() {
		return mclass;
	}
	public void setMclass(String mclass) {
		this.mclass = mclass;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getPnum1() {
		return pnum1;
	}
	public void setPnum1(String pnum1) {
		this.pnum1 = pnum1;
	}
	public String getPnum2() {
		return pnum2;
	}
	public void setPnum2(String pnum2) {
		this.pnum2 = pnum2;
	}
	public String getPnum3() {
		return pnum3;
	}
	public void setPnum3(String pnum3) {
		this.pnum3 = pnum3;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMemailId() {
		return memailId;
	}
	public void setMemailId(String memailId) {
		this.memailId = memailId;
	}
	public String getMemailDomain() {
		return memailDomain;
	}
	public void setMemailDomain(String memailDomain) {
		this.memailDomain = memailDomain;
	}
	public String getMlabel() {
		return mlabel;
	}
	public void setMlabel(String mlabel) {
		this.mlabel = mlabel;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMedetailAddress() {
		return medetailAddress;
	}
	public void setMedetailAddress(String medetailAddress) {
		this.medetailAddress = medetailAddress;
	}
	public String getMextraAddress() {
		return mextraAddress;
	}
	public void setMextraAddress(String mextraAddress) {
		this.mextraAddress = mextraAddress;
	}
	public MultipartFile getMfile() {
		return mfile;
	}
	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}
	public String getMfilename() {
		return mfilename;
	}
	public void setMfilename(String mfilename) {
		this.mfilename = mfilename;
	}
	
	
	
	
	
}
