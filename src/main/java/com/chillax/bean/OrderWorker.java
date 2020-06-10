package com.chillax.bean;

public class OrderWorker {
    private String orderId;

    private String workerId;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getWorkerId() {
        return workerId;
    }

    public void setWorkerId(String workerId) {
        this.workerId = workerId == null ? null : workerId.trim();
    }

	public OrderWorker(String orderId, String workerId) {
		super();
		this.orderId = orderId;
		this.workerId = workerId;
	}
	public OrderWorker(){}
    
}