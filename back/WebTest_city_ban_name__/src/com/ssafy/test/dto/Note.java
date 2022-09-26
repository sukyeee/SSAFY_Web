package com.ssafy.test.dto;

public class Note {

	private String noteCode;
	private String model;
	private int price;
	private String company;
	public String getNoteCode() {
		return noteCode;
	}
	public void setNoteCode(String noteCode) {
		this.noteCode = noteCode;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	@Override
	public String toString() {
		return "Note [noteCode=" + noteCode + ", model=" + model + ", price=" + price + ", company=" + company + "]";
	}
	
	
}
