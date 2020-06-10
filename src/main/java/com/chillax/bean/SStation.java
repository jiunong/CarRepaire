package com.chillax.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SStation {
    private Integer sId;

    private String sState;

    private String sType;

    @DateTimeFormat(pattern="yyyy-MM-dd HH-mm-ss")
    private Date begintime;
    @DateTimeFormat(pattern="yyyy-MM-dd HH-mm-ss")
    private Date scraptime;

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsState() {
        return sState;
    }

    public void setsState(String sState) {
        this.sState = sState == null ? null : sState.trim();
    }

    public String getsType() {
        return sType;
    }

    public void setsType(String sType) {
        this.sType = sType == null ? null : sType.trim();
    }

    public Date getBegintime() {
        return begintime;
    }

    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getScraptime() {
        return scraptime;
    }

    public void setScraptime(Date scraptime) {
        this.scraptime = scraptime;
    }
}