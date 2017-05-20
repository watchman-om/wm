package com.onnurimotors.wm.model;

public class HISTORY {
	private int HISTORY_ID;
	private int VEHICLE_ID;
	private String DATE_VISIT;
	private String TIME_VISIT;
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
	public String getTIME_VISIT() {
		return TIME_VISIT;
	}
	public void setTIME_VISIT(String tIME_VISIT) {
		TIME_VISIT = tIME_VISIT;
	}
	
}