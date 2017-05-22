package com.onnurimotors.wm.model;

public class EMPLOYEE {
	private int EMPLOYEE_ID;
	private String KAKAO_ACCOUNT;
	private int IS_RECEIVING_KAKAO;
	private String NAME;
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
}
