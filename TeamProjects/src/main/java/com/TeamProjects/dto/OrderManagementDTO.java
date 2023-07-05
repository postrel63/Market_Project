package com.TeamProjects.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderManagementDTO {

	private String mid;		//주문코드
	private String chcode;		//주문코드
	private String chprcount;	//메뉴 갯수
	private String allprprice;	//주문 총 가격
	private String allprcount;	//주문 총 수량
	private String chmemo;		//배송 메모
	private String prname;		//주문한 상품 이름
	private int prcount;		//주문한 상품 갯수
	private int prprice;		//주문한 상품 가격
	private String receiveaddr;	//주문자 배송지
	private String receivepn;	//주문자 전화번호
	private String chdate;		//주문한 시간
	private String stname;		//가게 이름
	private String stcode;		//가게 이름
	private String deliway;		//주문 방식
	private String delistate;	//주문 상태 (주문접수중 - 배달준비중- 배달중 - 배달 완료 )
	private String chway;		//결제 방식
	private String delitime;		//배달 예상 소요시간
	private String delidate;	//배달 예상 도착시간 (미완성)
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getChcode() {
		return chcode;
	}
	public void setChcode(String chcode) {
		this.chcode = chcode;
	}
	public String getChprcount() {
		return chprcount;
	}
	public void setChprcount(String chprcount) {
		this.chprcount = chprcount;
	}
	public String getAllprprice() {
		return allprprice;
	}
	public void setAllprprice(String allprprice) {
		this.allprprice = allprprice;
	}
	public String getAllprcount() {
		return allprcount;
	}
	public void setAllprcount(String allprcount) {
		this.allprcount = allprcount;
	}
	public String getChmemo() {
		return chmemo;
	}
	public void setChmemo(String chmemo) {
		this.chmemo = chmemo;
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
	public String getReceiveaddr() {
		return receiveaddr;
	}
	public void setReceiveaddr(String receiveaddr) {
		this.receiveaddr = receiveaddr;
	}
	public String getReceivepn() {
		return receivepn;
	}
	public void setReceivepn(String receivepn) {
		this.receivepn = receivepn;
	}
	public String getChdate() {
		return chdate;
	}
	public void setChdate(String chdate) {
		this.chdate = chdate;
	}
	public String getStname() {
		return stname;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	public String getStcode() {
		return stcode;
	}
	public void setStcode(String stcode) {
		this.stcode = stcode;
	}
	public String getDeliway() {
		return deliway;
	}
	public void setDeliway(String deliway) {
		this.deliway = deliway;
	}
	public String getDelistate() {
		return delistate;
	}
	public void setDelistate(String delistate) {
		this.delistate = delistate;
	}
	public String getChway() {
		return chway;
	}
	public void setChway(String chway) {
		this.chway = chway;
	}
	public String getDelitime() {
		return delitime;
	}
	public void setDelitime(String delitime) {
		this.delitime = delitime;
	}
	public String getDelidate() {
		return delidate;
	}
	public void setDelidate(String delidate) {
		this.delidate = delidate;
	}
	@Override
	public String toString() {
		return "OrderManagementDTO [mid=" + mid + ", chcode=" + chcode + ", chprcount=" + chprcount + ", allprprice="
				+ allprprice + ", allprcount=" + allprcount + ", chmemo=" + chmemo + ", prname=" + prname + ", prcount="
				+ prcount + ", prprice=" + prprice + ", receiveaddr=" + receiveaddr + ", receivepn=" + receivepn
				+ ", chdate=" + chdate + ", stname=" + stname + ", stcode=" + stcode + ", deliway=" + deliway
				+ ", delistate=" + delistate + ", chway=" + chway + ", delitime=" + delitime + ", delidate=" + delidate
				+ "]";
	}
	
	

	
	
	
	

	
	
}
