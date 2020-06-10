package com.chillax.bean;

import java.util.Date;

public class Order {
    private String orderId;

    private String carId;

    private Integer stationId;

    private String oDescribe;

    private String oState;

    private Date ordertime;
    
    private Date arriveTime;

    private Date begintime;

    private Date endtime;
    
    private String remark;
    
    private String imgUrls;

	public String getImgUrls() {
		return imgUrls;
	}

	public void setImgUrls(String imgUrls) {
		this.imgUrls = imgUrls;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public Integer getStationId() {
		return stationId;
	}

	public void setStationId(Integer stationId) {
		this.stationId = stationId;
	}

	public String getoDescribe() {
		return oDescribe;
	}

	public void setoDescribe(String oDescribe) {
		this.oDescribe = oDescribe;
	}

	public String getoState() {
		return oState;
	}

	public void setoState(String oState) {
		this.oState = oState;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public Date getArriveTime() {
		return arriveTime;
	}

	public void setArriveTime(Date arriveTime) {
		this.arriveTime = arriveTime;
	}

	public Date getBegintime() {
		return begintime;
	}

	public void setBegintime(Date begintime) {
		this.begintime = begintime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
    
}