package com.TeamProjects.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentDTO {
    
	
	private int conum;
	private int co_bonum;
	private String cowriter;
	private String cocontent;
	private Date codate;
	


    private int originNo;
    private int groupOrd;
    private int groupLayer;
    
    
    
    
    

	public int getConum() {
		return conum;
	}
	public void setConum(int conum) {
		this.conum = conum;
	}
	public int getOriginNo() {
		return originNo;
	}
	public void setOriginNo(int originNo) {
		this.originNo = originNo;
	}
	public int getGroupOrd() {
		return groupOrd;
	}
	public void setGroupOrd(int groupOrd) {
		this.groupOrd = groupOrd;
	}
	public int getGroupLayer() {
		return groupLayer;
	}
	public void setGroupLayer(int groupLayer) {
		this.groupLayer = groupLayer;
	}
	
		
	
	
	public int getCo_bonum() {
		return co_bonum;
	}
	public void setCo_bonum(int co_bonum) {
		this.co_bonum = co_bonum;
	}
	public String getCowriter() {
		return cowriter;
	}
	public void setCowriter(String cowriter) {
		this.cowriter = cowriter;
	}
	public String getCocontent() {
		return cocontent;
	}
	public void setCocontent(String cocontent) {
		this.cocontent = cocontent;
	}
	public Date getCodate() {
		return codate;
	}
	public void setCodate(Date codate) {
		this.codate = codate;
	}
	@Override
	public String toString() {
		return "CommentDTO [conum=" + conum + ", co_bonum=" + co_bonum + ", cowriter=" + cowriter + ", cocontent="
				+ cocontent + ", codate=" + codate + ", originNo=" + originNo + ", groupOrd=" + groupOrd
				+ ", groupLayer=" + groupLayer + "]";
	}

	
	
	
}
