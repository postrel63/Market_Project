package com.TeamProjects.dto;

import lombok.Data;

@Data
public class LikeDTO {
private String mid;
private String stcode;
public String getMid() {
	return mid;
}
public void setMid(String mid) {
	this.mid = mid;
}
public String getStcode() {
	return stcode;
}
public void setStcode(String stcode) {
	this.stcode = stcode;
}



}
