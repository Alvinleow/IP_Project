package com.model;

import java.io.Serializable;

public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private Integer id;
    private String username;
    private String password;
    private String email;
    private String phoneNumber;
    private String address;
    private Integer households;
    private String buildingtype;
    private Integer userLevel;

    public User() {
    }

    public User(Integer id, String username, String email, String phoneNumber, String address, Integer households, String buildingtype, Integer userLevel) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.households = households;
        this.buildingtype = buildingtype;
        this.userLevel = userLevel;
    }

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getHouseholds() {
		return households;
	}

	public void setHouseholds(Integer households) {
		this.households = households;
	}

	public String getBuildingtype() {
		return buildingtype;
	}

	public void setBuildingtype(String buildingtype) {
		this.buildingtype = buildingtype;
	}

	public Integer getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(Integer userLevel) {
		this.userLevel = userLevel;
	}
    
}
