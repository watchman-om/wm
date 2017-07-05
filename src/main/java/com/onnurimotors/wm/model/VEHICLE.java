package com.onnurimotors.wm.model;

public class VEHICLE {
	private int VEHICLE_ID;
	private String LICENSE;
	private int IS_NOTIFIABLE;
	private String MODEL;
	private String USER_NAME;
	private String BIRTH;
	private String PHONE_NUMBER;
	private String COMMENT;
	
	public int getVEHICLE_ID() {
		return VEHICLE_ID;
	}
	public void setVEHICLE_ID(int vEHICLE_ID) {
		VEHICLE_ID = vEHICLE_ID;
	}
	public String getLICENSE() {
		return LICENSE;
	}
	public void setLICENSE(String lICENSE) {
		LICENSE = lICENSE;
	}
	public int getIS_NOTIFIABLE() {
		return IS_NOTIFIABLE;
	}
	public void setIS_NOTIFIABLE(int iS_NOTIFIABLE) {
		IS_NOTIFIABLE = iS_NOTIFIABLE;
	}
	public String getMODEL() {
		return MODEL;
	}
	public void setMODEL(String mODEL) {
		MODEL = mODEL;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(String bIRTH) {
		BIRTH = bIRTH;
	}
	public String getPHONE_NUMBER() {
		return PHONE_NUMBER;
	}
	public void setPHONE_NUMBER(String pHONE_NUMBER) {
		PHONE_NUMBER = pHONE_NUMBER;
	}
	public String getCOMMENT() {
		return COMMENT;
	}
	public void setCOMMENT(String cOMMENT) {
		COMMENT = cOMMENT;
	}
}
