package home.dto;

public class HouseDto {
	private String dong;
	private String AptName;
	
	private double lat;
	private double lng;
	
	private String dealAmount;
	private String area;
	
	
	
	public String getDong() {
		return dong;
	}



	public void setDong(String dong) {
		this.dong = dong;
	}



	public String getAptName() {
		return AptName;
	}



	public void setAptName(String aptName) {
		AptName = aptName;
	}



	public double getLat() {
		return lat;
	}



	public void setLat(double lat) {
		this.lat = lat;
	}



	public double getLng() {
		return lng;
	}



	public void setLng(double lng) {
		this.lng = lng;
	}



	public String getDealAmount() {
		return dealAmount;
	}



	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}



	public String getArea() {
		return area;
	}



	public void setArea(String area) {
		this.area = area;
	}



	@Override
	public String toString() {
		return "HouseDto [dong=" + dong + ", AptName=" + AptName + ", lat=" + lat + ", lng=" + lng + ", dealAmount="
				+ dealAmount + ", area=" + area + "]";
	}	
}