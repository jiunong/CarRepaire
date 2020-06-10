package com.chillax.bean;

public class User {
    private Integer uId;

    private String uName;

    private String uPass;

    private String uPhone;

    private Integer uLevel;

    private String uLoc;

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName == null ? null : uName.trim();
    }

    public String getuPass() {
        return uPass;
    }

    public void setuPass(String uPass) {
        this.uPass = uPass == null ? null : uPass.trim();
    }

  

    public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public Integer getuLevel() {
        return uLevel;
    }

    public void setuLevel(Integer uLevel) {
        this.uLevel = uLevel;
    }

    public String getuLoc() {
        return uLoc;
    }

    public void setuLoc(String uLoc) {
        this.uLoc = uLoc == null ? null : uLoc.trim();
    }
}