package com.mh.naver;

/**
 * @author 305
 *
 */
public class UserVO {
	
	private String userName;
	private String userEmail;
	private String userGender;
	private String userNaver;

	public UserVO() {}	

	@Override
	public String toString() {
		return "UserVO [userName=" + userName + ", userId=" + userEmail + ", userGender=" + userGender + ", userNaver="
				+ userNaver + "]";
	}

	public UserVO(String userName, String userId, String userGender, String userNaver) {
		super();
		this.userName = userName;
		this.userEmail = userId;
		this.userGender = userGender;
		this.userNaver = userNaver;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserNaver() {
		return userNaver;
	}

	public void setUserNaver(String userNaver) {
		this.userNaver = userNaver;
	}
	
	
	
	

}
