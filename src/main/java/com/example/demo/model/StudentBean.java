package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
// StudentBean Class
public class StudentBean {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int stdId;
	private String stdName;
	private String stdAddr;
	private String stdPhone;
	private String stdGender;
	private String stdCountry;
	private String stdDate;
	private String fileUpload;
	
	public StudentBean(int stdId, String stdName, String stdAddr, String stdPhone, String stdGender, String stdCountry,
			String stdDate, String fileUpload) {
		super();
		this.stdId = stdId;
		this.stdName = stdName;
		this.stdAddr = stdAddr;
		this.stdPhone = stdPhone;
		this.stdGender = stdGender;
		this.stdCountry = stdCountry;
		this.stdDate = stdDate;
		this.fileUpload = fileUpload;
	}
	public StudentBean() {
		// TODO Auto-generated constructor stub
	}
	public int getStdId() {
		return stdId;
	}
	public void setStdId(int stdId) {
		this.stdId = stdId;
	}
	public String getStdName() {
		return stdName;
	}
	public void setStdName(String stdName) {
		this.stdName = stdName;
	}
	public String getStdAddr() {
		return stdAddr;
	}
	public void setStdAddr(String stdAddr) {
		this.stdAddr = stdAddr;
	}
	public String getStdPhone() {
		return stdPhone;
	}
	public void setStdPhone(String stdPhone) {
		this.stdPhone = stdPhone;
	}
	public String getStdGender() {
		return stdGender;
	}
	public void setStdGender(String stdGender) {
		this.stdGender = stdGender;
	}
	public String getStdCountry() {
		return stdCountry;
	}
	public void setStdCountry(String stdCountry) {
		this.stdCountry = stdCountry;
	}
	public String getStdDate() {
		return stdDate;
	}
	public void setStdDate(String stdDate) {
		this.stdDate = stdDate;
	}
	public String getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(String fileUpload) {
		this.fileUpload = fileUpload;
	}
	@Override
	public String toString() {
		return "StudentBean [stdId=" + stdId + ", stdName=" + stdName + ", stdAddr=" + stdAddr + ", stdPhone="
				+ stdPhone + ", stdGender=" + stdGender + ", stdCountry=" + stdCountry + ", stdDate=" + stdDate
				+ ", fileUpload=" + fileUpload + "]";
	}
	public static void setfileUpload(String concurrentFileNames) {
		// TODO Auto-generated method stub
		
	}
	
	
	
}