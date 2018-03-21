package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class StudentBean {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
private int stdId;
private String stdName;
private String stdAddr;
private String stdPhone;
private String stdGender;

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

@Override
public String toString() {
	return "StudentBean [stdId=" + stdId + ", stdName=" + stdName + ", stdAddr=" + stdAddr + ", stdPhone=" + stdPhone
			+ ", stdGender=" + stdGender + "]";
}
}
