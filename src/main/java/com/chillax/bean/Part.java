package com.chillax.bean;

import java.util.Date;

public class Part {
    private String partId;

    private String partName;

    private Double partPrice;

    private Integer partNum;
    
    private Integer warning;

    public Integer getWarning() {
		return warning;
	}

	public void setWarning(Integer warning) {
		this.warning = warning;
	}

	private Date lastbuydate;

    public String getPartId() {
        return partId;
    }

    public void setPartId(String partId) {
        this.partId = partId == null ? null : partId.trim();
    }

    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName == null ? null : partName.trim();
    }

    public Double getPartPrice() {
        return partPrice;
    }

    public void setPartPrice(Double partPrice) {
        this.partPrice = partPrice;
    }

    public Integer getPartNum() {
        return partNum;
    }

    public void setPartNum(Integer partNum) {
        this.partNum = partNum;
    }

    public Date getLastbuydate() {
        return lastbuydate;
    }

    public void setLastbuydate(Date lastbuydate) {
        this.lastbuydate = lastbuydate;
    }
}