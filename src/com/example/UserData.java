package com.example;


public class UserData {
	
	

	 private Long Userid;
	 private String firstname;
	 private String lastname;
	 private String phone;
	 private String hobby;
	 private String edu;
	 private String gender;
	 private String email;
	 private String password;
	 
	 
	 public UserData(Long id,String fn, String ln,String ph,String h,String edu,String g,String em,String pwd){
		 
		 this.Userid=id;
		 this.firstname=fn;
		 this.lastname=ln;
		 this.phone=ph;
		 this.hobby=h;
		 this.edu=edu;
		 this.gender=g;
		 this.email=em;
		 this.password=pwd;
	 }
	 

	 public UserData(){
		 
		
	 }

	 public  UserData (UserData obj){
		 
		 this.Userid=obj.getUserid();
		 this.firstname=obj.getName();
		 this.lastname=obj.getLastname();
		 this.phone=obj.getPhone();
		 this.hobby=obj.getHobby();
		 this.edu=obj.getEdu();
		 this.gender=obj.getGender();
		 this.email=obj.getEmail();
		 this.password=obj.getPassword();
		
		 
		 
	 }
	 
	
	 
	public Long getUserid() {
		return Userid;
	}
	public void setUserid(Long userid) {
		Userid= userid;
	}
	public String getName() {
		return firstname;
	}
	public void setName(String name) {
		this.firstname = name;
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
	
	public String getInfo() {
		
		String temp="\n";
		temp=temp+"Name = "+firstname+"\n";
		temp=temp+"Email = "+email+"\n";
		return temp;
	}


	public String getLastname() {
		return lastname;
	}


	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getHobby() {
		return hobby;
	}


	public void setHobby(String hobby) {
		this.hobby = hobby;
	}


	public String getEdu() {
		return edu;
	}


	public void setEdu(String edu) {
		this.edu = edu;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}

}
