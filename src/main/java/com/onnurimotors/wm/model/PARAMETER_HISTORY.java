package com.onnurimotors.wm.model;

public class PARAMETER_HISTORY {
	private int HISTORY_ID;
	private int VEHICLE_ID;
	private String DATE_VISIT;
	private int PAGE;
	private int SIZE_PAGE;
	public int getHISTORY_ID() {
		return HISTORY_ID;
	}
	public void setHISTORY_ID(int hISTORY_ID) {
		HISTORY_ID = hISTORY_ID;
	}
	public int getVEHICLE_ID() {
		return VEHICLE_ID;
	}
	public void setVEHICLE_ID(int vEHICLE_ID) {
		VEHICLE_ID = vEHICLE_ID;
	}
	public String getDATE_VISIT() {
		return DATE_VISIT;
	}
	public void setDATE_VISIT(String dATE_VISIT) {
		DATE_VISIT = dATE_VISIT;
	}
	public int getPAGE() {
		return PAGE;
	}
	public void setPAGE(int pAGE) {
		PAGE = pAGE;
	}
	public int getSIZE_PAGE() {
		return SIZE_PAGE;
	}
	public void setSIZE_PAGE(int sIZE_PAGE) {
		SIZE_PAGE = sIZE_PAGE;
	}
	
}
