package com.useraccess.model;

public class Request {
	private int id;
	private String userName;
	private String accessType;
	private String reason;
	private String softwareName;

	// Constructor
	public Request(int id, String userName, String accessType, String reason, String softwareName) {
		this.id = id;
		this.userName = userName;
		this.accessType = accessType;
		this.reason = reason;
		this.softwareName = softwareName;
	}

	// Default constructor
	public Request() {
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAccessType() {
		return accessType;
	}

	public void setAccessType(String accessType) {
		this.accessType = accessType;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getSoftwareName() {
		return softwareName;
	}

	public void setSoftwareName(String softwareName) {
		this.softwareName = softwareName;
	}

}
