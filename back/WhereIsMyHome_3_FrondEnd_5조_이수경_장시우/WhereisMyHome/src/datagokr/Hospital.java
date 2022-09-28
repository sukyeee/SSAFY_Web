package datagokr;

public class Hospital {
	private String hospitalNm;
	private String hospitalTel;
	private String sido;
	private String sigungu;
	public String getHospitalNm() {
		return hospitalNm;
	}
	public void setHospitalNm(String hospitalNm) {
		this.hospitalNm = hospitalNm;
	}
	public String getHospitalTel() {
		return hospitalTel;
	}
	public void setHospitalTel(String hospitalTel) {
		this.hospitalTel = hospitalTel;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	@Override
	public String toString() {
		return "Hospital [hospitalNm=" + hospitalNm + ", hospitalTel=" + hospitalTel + ", sido=" + sido + ", sigungu="
				+ sigungu + "]";
	}
	
	
	
}
