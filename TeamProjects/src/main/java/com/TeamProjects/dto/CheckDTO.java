package com.TeamProjects.dto;

import lombok.Data;

@Data
public class CheckDTO {

	private String chcode;			//주문코드
	private String stcode;			//주문 가게 코드
	private String mid;				//주문회원 아이디
	private String selectaddr;		//수령 방법
	private String receivename;		//수령인이름
	private String receivepn;		//수령인전화번호
	private String receivepostcode;	//수령인 주소번호
	private String receiveaddr;		//수령인 주소
	private String receivedetailaddr;//수령인 상세주소
	private String receiveaddress;   //수령인 전체주소
	private int prallprice;			//총 금액
	private int prallcount;			//총 갯수
	private String chdate;			//주문 날짜
	private String chway;			//주문 방법
	private String ordermemo;		//주문메모
	private String selectcard;		//결제방법
	private String deliway;			//배달 or 현장
	public String getChcode() {
		return chcode;
	}
	public void setChcode(String chcode) {
		this.chcode = chcode;
	}
	public String getStcode() {
		return stcode;
	}
	public void setStcode(String stcode) {
		this.stcode = stcode;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getSelectaddr() {
		return selectaddr;
	}
	public void setSelectaddr(String selectaddr) {
		this.selectaddr = selectaddr;
	}
	public String getReceivename() {
		return receivename;
	}
	public void setReceivename(String receivename) {
		this.receivename = receivename;
	}
	public String getReceivepn() {
		return receivepn;
	}
	public void setReceivepn(String receivepn) {
		this.receivepn = receivepn;
	}
	public String getReceivepostcode() {
		return receivepostcode;
	}
	public void setReceivepostcode(String receivepostcode) {
		this.receivepostcode = receivepostcode;
	}
	public String getReceiveaddr() {
		return receiveaddr;
	}
	public void setReceiveaddr(String receiveaddr) {
		this.receiveaddr = receiveaddr;
	}
	public String getReceivedetailaddr() {
		return receivedetailaddr;
	}
	public void setReceivedetailaddr(String receivedetailaddr) {
		this.receivedetailaddr = receivedetailaddr;
	}
	public String getReceiveaddress() {
		return receiveaddress;
	}
	public void setReceiveaddress(String receiveaddress) {
		this.receiveaddress = receiveaddress;
	}
	

	public int getPrallprice() {
		return prallprice;
	}
	public void setPrallprice(int prallprice) {
		this.prallprice = prallprice;
	}
	public int getPrallcount() {
		return prallcount;
	}
	public void setPrallcount(int prallcount) {
		this.prallcount = prallcount;
	}
	public String getChdate() {
		return chdate;
	}
	public void setChdate(String chdate) {
		this.chdate = chdate;
	}
	public String getChway() {
		return chway;
	}
	public void setChway(String chway) {
		this.chway = chway;
	}
	public String getOrdermemo() {
		return ordermemo;
	}
	public void setOrdermemo(String ordermemo) {
		this.ordermemo = ordermemo;
	}
	public String getSelectcard() {
		return selectcard;
	}
	public void setSelectcard(String selectcard) {
		this.selectcard = selectcard;
	}
	public String getDeliway() {
		return deliway;
	}
	public void setDeliway(String deliway) {
		this.deliway = deliway;
	}
	@Override
	public String toString() {
		return "CheckDTO [chcode=" + chcode + ", stcode=" + stcode + ", mid=" + mid + ", selectaddr=" + selectaddr
				+ ", receivename=" + receivename + ", receivepn=" + receivepn + ", receivepostcode=" + receivepostcode
				+ ", receiveaddr=" + receiveaddr + ", receivedetailaddr=" + receivedetailaddr + ", receiveaddress="
				+ receiveaddress + ", prallprice=" + prallprice + ", prallcount=" + prallcount + ", chdate=" + chdate
				+ ", chway=" + chway + ", ordermemo=" + ordermemo + ", selectcard=" + selectcard + ", deliway="
				+ deliway + "]";
	}

	
	
	
	
	
	
}
