package com.TeamProjects.dto;

import lombok.Data;

@Data
public class CartDTO {
	private String cacode;	//주문코드
	private String mid;		//회원아이디
	private String prcode;	//상품코드
	private int prcount;	//상품개수
	
	private String canum; 	//rownum 으로 장바구니에 담긴 수량 파악
	private String primage;	//상품사진
	private String prname;	//상품이름
	private int prprice;	//상품가격
	private int prsaleper;	//할인가격
	private int allprprice;	//총가격
	
	private String stcode; //게시글에 stcode 저장
	private String stname;
	
	
	
	public String getStcode() {
		return stcode;
	}
	public void setStcode(String stcode) {
		this.stcode = stcode;
	}
	public String getStname() {
		return stname;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	public String getCacode() {
		return cacode;
	}
	public void setCacode(String cacode) {
		this.cacode = cacode;
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
	public String getCanum() {
		return canum;
	}
	public void setCanum(String canum) {
		this.canum = canum;
	}
	public String getPrimage() {
		return primage;
	}
	public void setPrimage(String primage) {
		this.primage = primage;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public int getPrprice() {
		return prprice;
	}
	public void setPrprice(int prprice) {
		this.prprice = prprice;
	}
	public int getPrsaleper() {
		return prsaleper;
	}
	public void setPrsaleper(int prsaleper) {
		this.prsaleper = prsaleper;
	}
	public int getAllprprice() {
		return allprprice;
	}
	public void setAllprprice(int allprprice) {
		this.allprprice = allprprice;
	}
	@Override
	public String toString() {
		return "CartDTO [cacode=" + cacode + ", mid=" + mid + ", prcode=" + prcode + ", prcount=" + prcount + ", canum="
				+ canum + ", primage=" + primage + ", prname=" + prname + ", prprice=" + prprice + ", prsaleper="
				+ prsaleper + ", allprprice=" + allprprice + "]";
	}

	
	
	
	
}
