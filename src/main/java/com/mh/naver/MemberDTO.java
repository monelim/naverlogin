package com.mh.naver;

public class MemberDTO {
	
	private int id;
	private String email;
	private String password;
	private String name;
	private String regdate;
	
		
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", email=" + email + ", password=" + password + ", name=" + name + ", regdate="
				+ regdate + "]";
	}



	public MemberDTO(int id, String email, String password, String name, String regdate) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.regdate = regdate;
	}


	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getRegdate() {
		return regdate;
	}



	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	

}
