package com.TeamProjects.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductsDTO {
	private String prcode;		//상품코드
	private String stcode;		//상품이 등록된 가게
	private String prname;		//상품 이름
	private int prstock;		//상품 재고
	private String primage;		//상품 사진 이름
	private int prprice;		//상품 가격
	private String prnote;		//상품 설명
	private String prcheck;      //상품 상태
	
	private MultipartFile primagename;
	private String bid; // 상품코드 사용
	public String getPrcode() {
		return prcode;
	}
	public void setPrcode(String prcode) {
		this.prcode = prcode;
	}
	public String getStcode() {
		return stcode;
	}
	public void setStcode(String stcode) {
		this.stcode = stcode;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public int getPrstock() {
		return prstock;
	}
	public void setPrstock(int prstock) {
		this.prstock = prstock;
	}
	public String getPrimage() {
		return primage;
	}
	public void setPrimage(String primage) {
		this.primage = primage;
	}
	public int getPrprice() {
		return prprice;
	}
	public void setPrprice(int prprice) {
		this.prprice = prprice;
	}
	public String getPrnote() {
		return prnote;
	}
	public void setPrnote(String prnote) {
		this.prnote = prnote;
	}
	public String getPrcheck() {
		return prcheck;
	}
	public void setPrcheck(String prcheck) {
		this.prcheck = prcheck;
	}
	public MultipartFile getPrimagename() {
		return primagename;
	}
	public void setPrimagename(MultipartFile primagename) {
		this.primagename = primagename;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	
	
	
	

}
