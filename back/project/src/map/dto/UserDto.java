package map.dto;

import java.util.Date;

public class UserDto {
		private int userSeq;
		private String userName;
	    private String userPassword;
	    private String userEmail;
	    private String userProfileImageUrl;
	    private Date userRegisterDate;
	    private String interestCode;
	    private String gradeCode;
		
		@Override
		public String toString() {
			return "UserDto [userSeq=" + userSeq + ", userName=" + userName + ", userPassword=" + userPassword
					+ ", userEmail=" + userEmail + ", userProfileImageUrl=" + userProfileImageUrl
					+ ", userRegisterDate=" + userRegisterDate + ", interestCode=" + interestCode + ", gradeCode="
					+ gradeCode + "]";
		}
		public String getInterestCode() {
			return interestCode;
		}
		public void setInterestCode(String interestCode) {
			this.interestCode = interestCode;
		}
		public String getGradeCode() {
			return gradeCode;
		}
		public void setGradeCode(String gradeCode) {
			this.gradeCode = gradeCode;
		}
		public int getUserSeq() {
	        return userSeq;
	    }
	    public void setUserSeq(int userSeq) {
	        this.userSeq = userSeq;
	    }
	    public String getUserName() {
	        return userName;
	    }
	    public void setUserName(String userName) {
	        this.userName = userName;
	    }
	    public String getUserPassword() {
	        return userPassword;
	    }
	    public void setUserPassword(String userPassword) {
	        this.userPassword = userPassword;
	    }
	    public String getUserEmail() {
	        return userEmail;
	    }
	    public void setUserEmail(String userEmail) {
	        this.userEmail = userEmail;
	    }
	    public String getUserProfileImageUrl() {
	        return userProfileImageUrl;
	    }
	    public void setUserProfileImageUrl(String userProfileImageUrl) {
	        if( userProfileImageUrl == null || "null".equals(userProfileImageUrl) || "".equals(userProfileImageUrl)) {
	            this.userProfileImageUrl = "/img/noProfile.png";
	        }else {
	            this.userProfileImageUrl = userProfileImageUrl;
	        }
	    }

	    public Date getUserRegisterDate() {
	        return userRegisterDate;
	    }
	    public void setUserRegisterDate(Date userRegisterDate) {
	        this.userRegisterDate = userRegisterDate;
	    }
	
}
