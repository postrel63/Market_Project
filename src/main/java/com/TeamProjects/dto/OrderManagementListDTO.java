package com.TeamProjects.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderManagementListDTO {

	private String allprprice;	//주문 총 가격
	private String prname;		//주문한 상품 이름
	private int prcount;		//주문한 상품 갯수
	private int prprice;		//주문한 상품 가격
	public String getAllprprice() {
		return allprprice;
	}
	public void setAllprprice(String allprprice) {
		this.allprprice = allprprice;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public int getPrcount() {
		return prcount;
	}
	public void setPrcount(int prcount) {
		this.prcount = prcount;
	}
	public int getPrprice() {
		return prprice;
	}
	public void setPrprice(int prprice) {
		this.prprice = prprice;
	}
	@Override
	public String toString() {
		return "OrderManagementListDTO [allprprice=" + allprprice + ", prname=" + prname + ", prcount=" + prcount
				+ ", prprice=" + prprice + "]";
	}
	

	
}
