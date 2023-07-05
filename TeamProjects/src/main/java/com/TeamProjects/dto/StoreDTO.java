package com.TeamProjects.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class StoreDTO {

	private String stcode;  
	private String bid;
	private String areaname;
	private String marketname;
	private String stname;
	private String stcategory;
	private String staddress;
	private String stphone; 
	private String stimage;
	private MultipartFile stimagename;
	private String stnote;
	private String strank;
	private String operate;
	private String operatetime;
	private String storelike;
	
	private String baddr;
	private String bdetailaddr;
	private String bextraAddr;
	private String pnum1;
	private String pnum2;
	private String pnum3;
	public String getStcode() {
		return stcode;
	}
	public void setStcode(String stcode) {
		this.stcode = stcode;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getAreaname() {
		return areaname;
	}
	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}
	public String getMarketname() {
		return marketname;
	}
	public void setMarketname(String marketname) {
		this.marketname = marketname;
	}
	public String getStname() {
		return stname;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	public String getStcategory() {
		return stcategory;
	}
	public void setStcategory(String stcategory) {
		this.stcategory = stcategory;
	}
	public String getStaddress() {
		return staddress;
	}
	public void setStaddress(String staddress) {
		this.staddress = staddress;
	}
	public String getStphone() {
		return stphone;
	}
	public void setStphone(String stphone) {
		this.stphone = stphone;
	}
	public String getStimage() {
		return stimage;
	}
	public void setStimage(String stimage) {
		this.stimage = stimage;
	}
	public MultipartFile getStimagename() {
		return stimagename;
	}
	public void setStimagename(MultipartFile stimagename) {
		this.stimagename = stimagename;
	}
	public String getStnote() {
		return stnote;
	}
	public void setStnote(String stnote) {
		this.stnote = stnote;
	}
	public String getStrank() {
		return strank;
	}
	public void setStrank(String strank) {
		this.strank = strank;
	}
	public String getOperate() {
		return operate;
	}
	public void setOperate(String operate) {
		this.operate = operate;
	}
	public String getOperatetime() {
		return operatetime;
	}
	public void setOperatetime(String operatetime) {
		this.operatetime = operatetime;
	}
	public String getStorelike() {
		return storelike;
	}
	public void setStorelike(String storelike) {
		this.storelike = storelike;
	}
	public String getBaddr() {
		return baddr;
	}
	public void setBaddr(String baddr) {
		this.baddr = baddr;
	}
	public String getBdetailaddr() {
		return bdetailaddr;
	}
	public void setBdetailaddr(String bdetailaddr) {
		this.bdetailaddr = bdetailaddr;
	}
	public String getBextraAddr() {
		return bextraAddr;
	}
	public void setBextraAddr(String bextraAddr) {
		this.bextraAddr = bextraAddr;
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
	@Override
	public String toString() {
		return "StoreDTO [stcode=" + stcode + ", bid=" + bid + ", areaname=" + areaname + ", marketname=" + marketname
				+ ", stname=" + stname + ", stcategory=" + stcategory + ", staddress=" + staddress + ", stphone="
				+ stphone + ", stimage=" + stimage + ", stimagename=" + stimagename + ", stnote=" + stnote + ", strank="
				+ strank + ", operate=" + operate + ", operatetime=" + operatetime + ", storelike=" + storelike
				+ ", baddr=" + baddr + ", bdetailaddr=" + bdetailaddr + ", bextraAddr=" + bextraAddr + ", pnum1="
				+ pnum1 + ", pnum2=" + pnum2 + ", pnum3=" + pnum3 + "]";
	}
	
	
	
	
	
}
