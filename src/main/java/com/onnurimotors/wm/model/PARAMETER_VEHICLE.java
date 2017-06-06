package com.onnurimotors.wm.model;

public class PARAMETER_VEHICLE {
	private int VEHICLE_ID;
	private String LICENSE;
	private int IS_NOTIFIABLE;
	private String MODEL;
	private String USER_NAME;
	private String BIRTH;
	private String PHONE_NUMBER;
	private String COMMENT;
	
	private int FROM_LIMIT;
	private int NUM_LIMIT;
	private String FROM_DATE;
	private String TO_DATE;
	private int MANAGEMENT_ID;
	private int HISTORY_ID;
	
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
	
	public int getFROM_LIMIT() {
		return FROM_LIMIT;
	}
	public void setFROM_LIMIT(int fROM_LIMIT) {
		FROM_LIMIT = fROM_LIMIT;
	}
	public int getNUM_LIMIT() {
		return NUM_LIMIT;
	}
	public void setNUM_LIMIT(int nUM_LIMIT) {
		NUM_LIMIT = nUM_LIMIT;
	}
	public String getFROM_DATE() {
		return FROM_DATE;
	}
	public void setFROM_DATE(String fROM_DATE) {
		FROM_DATE = fROM_DATE;
	}
	public String getTO_DATE() {
		return TO_DATE;
	}
	public void setTO_DATE(String tO_DATE) {
		TO_DATE = tO_DATE;
	}
	public int getMANAGEMENT_ID() {
		return MANAGEMENT_ID;
	}
	public void setMANAGEMENT_ID(int mANAGEMENT_ID) {
		MANAGEMENT_ID = mANAGEMENT_ID;
	}
	public int getHISTORY_ID() {
		return HISTORY_ID;
	}
	public void setHISTORY_ID(int hISTORY_ID) {
		HISTORY_ID = hISTORY_ID;
	}
}
