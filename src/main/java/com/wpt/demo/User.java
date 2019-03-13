package com.wpt.demo;

public class User {
	
	private String username;
	private Integer age;
	private String  describe;
	
	public User(String username, Integer age, String describe) {
		super();
		this.username = username;
		this.age = age;
		this.describe = describe;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	
	
	

}
