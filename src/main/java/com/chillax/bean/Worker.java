package com.chillax.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Worker {
    private String wId;

    private String wName;

    private String wPhone;

    private Double wSalary;

    private String wIdcard;

    private String wLocation;

    private Integer wAge;

    private Integer wSex;

    private Integer wLevel;

    private Integer wState;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date wBirthday;

	public String getwId() {
		return wId;
	}

	public void setwId(String wId) {
		this.wId = wId;
	}

	public String getwName() {
		return wName;
	}

	public void setwName(String wName) {
		this.wName = wName;
	}

	public String getwPhone() {
		return wPhone;
	}

	public void setwPhone(String wPhone) {
		this.wPhone = wPhone;
	}

	public Double getwSalary() {
		return wSalary;
	}

	public void setwSalary(Double wSalary) {
		this.wSalary = wSalary;
	}

	public String getwIdcard() {
		return wIdcard;
	}

	public void setwIdcard(String wIdcard) {
		this.wIdcard = wIdcard;
	}

	public String getwLocation() {
		return wLocation;
	}

	public void setwLocation(String wLocation) {
		this.wLocation = wLocation;
	}

	public Integer getwAge() {
		return wAge;
	}

	public void setwAge(Integer wAge) {
		this.wAge = wAge;
	}

	public Integer getwSex() {
		return wSex;
	}

	public void setwSex(Integer wSex) {
		this.wSex = wSex;
	}

	public Integer getwLevel() {
		return wLevel;
	}

	public void setwLevel(Integer wLevel) {
		this.wLevel = wLevel;
	}

	public Integer getwState() {
		return wState;
	}

	public void setwState(Integer wState) {
		this.wState = wState;
	}

	public Date getwBirthday() {
		return wBirthday;
	}

	public void setwBirthday(Date wBirthday) {
		this.wBirthday = wBirthday;
	}

}