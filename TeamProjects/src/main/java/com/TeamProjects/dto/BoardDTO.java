package com.TeamProjects.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {

    private int bonum;                    
	private String stcode;             
	private String botitle;               
	private String bowriter;          
	private String bocontent;         
	private Date bodate;               
	private int bohit;                     
	private int borecommend;     
    private MultipartFile bofile;       
	private String bofilename;        
	private int borank;     
	private String botype;
    private String areaname; 
	private String marketname; 
	private String staddress;
    
    
	public String getStaddress() {
		return staddress;
	}
	public void setStaddress(String staddress) {
		this.staddress = staddress;
	}
	public int getBonum() {
		return bonum;
	}
	public void setBonum(int bonum) {
		this.bonum = bonum;
	}
	public String getStcode() {
		return stcode;
	}
	public void setStcode(String stcode) {
		this.stcode = stcode;
	}
	public String getBotitle() {
		return botitle;
	}
	public void setBotitle(String botitle) {
		this.botitle = botitle;
	}
	public String getBowriter() {
		return bowriter;
	}
	public void setBowriter(String bowriter) {
		this.bowriter = bowriter;
	}
	public String getBocontent() {
		return bocontent;
	}
	public void setBocontent(String bocontent) {
		this.bocontent = bocontent;
	}
	public Date getBodate() {
		return bodate;
	}
	public void setBodate(Date bodate) {
		this.bodate = bodate;
	}
	public int getBohit() {
		return bohit;
	}
	public void setBohit(int bohit) {
		this.bohit = bohit;
	}
	public int getBorecommend() {
		return borecommend;
	}
	public void setBorecommend(int borecommend) {
		this.borecommend = borecommend;
	}
	public MultipartFile getBofile() {
		return bofile;
	}
	public void setBofile(MultipartFile bofile) {
		this.bofile = bofile;
	}
	public String getBofilename() {
		return bofilename;
	}
	public void setBofilename(String bofilename) {
		this.bofilename = bofilename;
	}
	public int getBorank() {
		return borank;
	}
	public void setBorank(int borank) {
		this.borank = borank;
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
	public String getBotype() {
		return botype;
	}
	public void setBotype(String botype) {
		this.botype = botype;
	}
	@Override
	public String toString() {
		return "BoardDTO [bonum=" + bonum + ", stcode=" + stcode + ", botitle=" + botitle + ", bowriter=" + bowriter
				+ ", bocontent=" + bocontent + ", bodate=" + bodate + ", bohit=" + bohit + ", borecommend="
				+ borecommend + ", bofile=" + bofile + ", bofilename=" + bofilename + ", borank=" + borank + ", botype="
				+ botype + ", areaname=" + areaname + ", marketname=" + marketname + ", staddress=" + staddress + "]";
	}
    
    
    
        

}
