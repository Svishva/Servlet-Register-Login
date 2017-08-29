package com.example.LoggedUserDetails;

import com.example.*;

public class LoggedUser {
	
	private UserData loggedUser;
	
	public LoggedUser(){
		
		
	}
	
	public LoggedUser(UserData loggedUser){
		
		this.loggedUser=loggedUser;
		
	}

	public  UserData getLoggedUser() {
		return loggedUser;
	}

	public void setLoggedUser(UserData loggedUser) {
		this.loggedUser = loggedUser;
	}
	
	
	public String getName(){
		
		return loggedUser.getName();
		
	}
	
	
	public String getEmail() {
		return loggedUser.getEmail();
	}
	
	

}
