package com.onnurimotors.wm.model;

public class EMPLOYEE {
	private int EMPLOYEE_ID;
	private String KAKAO_ACCOUNT;
	private int IS_RECEIVING_KAKAO;
	private String NAME;
	private int FROM_LIMIT;
	private int NUM_LIMIT;
	
	public int getEMPLOYEE_ID() {
		return EMPLOYEE_ID;
	}
	public void setEMPLOYEE_ID(int eMPLOYEE_ID) {
		EMPLOYEE_ID = eMPLOYEE_ID;
	}
	public String getKAKAO_ACCOUNT() {
		return KAKAO_ACCOUNT;
	}
	public void setKAKAO_ACCOUNT(String kAKAO_ACCOUNT) {
		KAKAO_ACCOUNT = kAKAO_ACCOUNT;
	}
	public int getIS_RECEIVING_KAKAO() {
		return IS_RECEIVING_KAKAO;
	}
	public void setIS_RECEIVING_KAKAO(int iS_RECEIVING_KAKAO) {
		IS_RECEIVING_KAKAO = iS_RECEIVING_KAKAO;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
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
	@Override
	public String toString() {
		return "EMPLOYEE [EMPLOYEE_ID=" + EMPLOYEE_ID + ", KAKAO_ACCOUNT=" + KAKAO_ACCOUNT + ", IS_RECEIVING_KAKAO="
				+ IS_RECEIVING_KAKAO + ", NAME=" + NAME + "]";
	}
}
