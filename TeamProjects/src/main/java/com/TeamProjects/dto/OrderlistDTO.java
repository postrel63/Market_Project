package com.TeamProjects.dto;

import java.sql.Date;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class OrderlistDTO {


	private String chcode;		//주문코드
	private int allprcount;		//모든 상품 갯수
	private int allprprice;		//모든 상품 가격
	private String chdate;		//상품 주문 시간
	public String getChcode() {
		return chcode;
	}
	public void setChcode(String chcode) {
		this.chcode = chcode;
	}
	public int getAllprcount() {
		return allprcount;
	}
	public void setAllprcount(int allprcount) {
		this.allprcount = allprcount;
	}
	public int getAllprprice() {
		return allprprice;
	}
	public void setAllprprice(int allprprice) {
		this.allprprice = allprprice;
	}
	public String getChdate() {
		return chdate;
	}
	public void setChdate(String chdate) {
		this.chdate = chdate;
	}
	@Override
	public String toString() {
		return "OrderlistDTO [chcode=" + chcode + ", allprcount=" + allprcount + ", allprprice=" + allprprice
				+ ", chdate=" + chdate + "]";
	}
	
	
	

	
}
