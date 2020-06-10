package com.chillax.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Car {
    private String carId;
    
    private String carNo;

    private String carName;

    private String carType;

    private String carPlace;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date buytime;

    private Integer userId;
    
    private Integer carState;

    public Integer getCarState() {
		return carState;
	}

	public void setCarState(Integer carState) {
		this.carState = carState;
	}

	public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId == null ? null : carId.trim();
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName == null ? null : carName.trim();
    }

 
    public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getCarPlace() {
        return carPlace;
    }

    public void setCarPlace(String carPlace) {
        this.carPlace = carPlace == null ? null : carPlace.trim();
    }

    public Date getBuytime() {
        return buytime;
    }

    public void setBuytime(Date buytime) {
        this.buytime = buytime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
    
}