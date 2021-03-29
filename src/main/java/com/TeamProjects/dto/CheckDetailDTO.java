package com.TeamProjects.dto;

import lombok.Data;

@Data
public class CheckDetailDTO {

	private String chcode;			//주문코드
	private String mid;				//주문회원 아이디
	private String prcode;	//상품코드
	private int prcount;	//상품개수
	public String getChcode() {
		return chcode;
	}
	public void setChcode(String chcode) {
		this.chcode = chcode;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPrcode() {
		return prcode;
	}
	public void setPrcode(String prcode) {
		this.prcode = prcode;
	}
	public int getPrcount() {
		return prcount;
	}
	public void setPrcount(int prcount) {
		this.prcount = prcount;
	}
	@Override
	public String toString() {
		return "CheckDetailDTO [chcode=" + chcode + ", mid=" + mid + ", prcode=" + prcode + ", prcount=" + prcount
				+ "]";
	}
	
	
	
	
	
}

