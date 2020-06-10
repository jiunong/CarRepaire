package com.chillax.bean;

public class OrderPart {
    private String orderId;

    private String partid;

    private Integer number;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getPartid() {
        return partid;
    }

    public void setPartid(String partid) {
        this.partid = partid == null ? null : partid.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

	public OrderPart(String orderId, String partid, Integer number) {
		super();
		this.orderId = orderId;
		this.partid = partid;
		this.number = number;
	}
	public OrderPart(){}
}