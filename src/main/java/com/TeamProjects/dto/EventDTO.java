package com.TeamProjects.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EventDTO {

	private int enumber;
	private Date estartdate;
	private Date eenddate;
	private String etitle;
	
	private String econtent;
	
	private MultipartFile efile;
	private String efilename;
	
	
	
	
	
	public String getEcontent() {
		return econtent;
	}
	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}
	public MultipartFile getEfile() {
		return efile;
	}
	public void setEfile(MultipartFile efile) {
		this.efile = efile;
	}
	public String getEfilename() {
		return efilename;
	}
	public void setEfilename(String efilename) {
		this.efilename = efilename;
	}
	public int getEnumber() {
		return enumber;
	}
	public void setEnumber(int enumber) {
		this.enumber = enumber;
	}
	public Date getEstartdate() {
		return estartdate;
	}
	public void setEstartdate(Date estartdate) {
		this.estartdate = estartdate;
	}
	public Date getEenddate() {
		return eenddate;
	}
	public void setEenddate(Date eenddate) {
		this.eenddate = eenddate;
	}
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	} 
	
	
}
