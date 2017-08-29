<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.Mdatabase"%>
<%@ page import="com.mongodb.client.FindIterable"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.Cursor"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.client.MongoDatabase"%>
<%@ page import="org.bson.Document"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.client.MongoCursor"%>
<%@ page import="com.example.UserData"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="org.bson.Document"%>
<%@ page import="com.mongodb.client.model.Sorts.*" %>
<%@ page import ="com.mongodb.client.model.Filters.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Records</title>
</head>
<body>
<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<!-- Material Design icon font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
<style type="text/css">


img {
   top: 50%;
   left: 50%;
   width: 500px;
   height: 400px;
   margin-top: -200px; /* Half the height */
   margin-left: -250px; /* Half the width */
}


html, body {
	
}

html {
	display: table;
	margin: auto;
	height: 100%;
}

body {
	display: table-cell;
  padding: 20px;
  background: #fafafa;
  position: relative;

}

table {
	margin-left: auto;
	margin-right: auto;
}

#cssTable {
	text-align: right;
}
</style>
<script>
function disableSubmit() {
	  document.getElementById("RegisterForm").disabled = true;
	 }
function activateButton(element) {

    if(element.checked) {
      document.getElementById("RegisterForm").disabled = false;
     }
     else  {
      document.getElementById("RegisterForm").disabled = true;
    }

}
function myFunction() {
    var x = document.getElementById("myCheck").required;
    document.getElementById("demo").innerHTML = x;
}
function validateChecks() {
	var chks = document.getElementsByName('options[]');
	var checkCount = 0;
	for (var i = 0; i < chks.length; i++) {
		if (chks[i].checked) {
			checkCount++;
		}
	}
	if (checkCount < 1) {
		return false;
	}
	return true;
}
function validateForm() {
	var flag=true;
	
	var t =document.forms["myForm"]["id"].value;
	
	if(t >= 2){
		
	}else{
		
		alert("User id should be greater than one")
		return false;
	}
	
    var x = document.forms["myForm"]["fname"].value;
    if (x=="") {
        //alert("Name must be filled out");
         document.getElementById('i1').innerHTML = 'Please enter First name';
         alert("Enter Firstname");
        //flag= false;
        return false;
    }else{
    	
    	 document.getElementById('i1').innerHTML = '';
    	 
    }
    
    if(x.length >=3 ){ document.getElementById('i1').innerHTML = '';}
	else { alert("First name should be  atleast 3 characters"); return false;}
    
    
    
   var y = document.forms["myForm"]["lname"].value;
    if(y == ""){
    	 alert("Enter Lastname");
    	 document.getElementById('i2').innerHTML = 'Please enter Last name';
    	 return false;    }
    else{
    	
   	 document.getElementById('i2').innerHTML = '';

    }
    
    
    if(y.length >=3 ){ document.getElementById('i2').innerHTML = '';}
	else { alert("Enter atleast 3 characters"); return false;}
    
    x = document.forms["myForm"]["phone"].value;
    //var pat =  new RegExp("[0-9]{10}"); 
    
    if ( x=="") {
    	 alert("Enter 10 digit mobile number");
    	 
     	document.getElementById('i4').innerHTML = 'Please enter your mobile number';
          
     	 return false;
                  
    }else{
   	 document.getElementById('i4').innerHTML = '';
    }
    
    if((x.length == "10")){
    	document.getElementById('i4').innerHTML = ' ';
    	
    }else{
    	
    	 alert("Enter exatly  10 digit mobile numbers");
    	 return false;
    }
    
    
    x = document.forms["myForm"]["email"].value;
    //var pat =  new RegExp("[0-9]{10}"); 
    
    if ( x=="") {
    	 alert("Enter email id");
    	 document.getElementById('i3').innerHTML = 'Please enter your email id';
          
     	 return false;
                  
    }else{
   	 document.getElementById('i3').innerHTML = '';
    }
    
    
 x = document.forms["myForm"]["pwd"].value;
    
    if (x=="") {
         document.getElementById('i5').innerHTML = 'Please enter password';
         alert("Please enter password");
        return false;
    }else{
    	
    	 document.getElementById('i5').innerHTML = '';
    }
    
    
    if(x.length >= 6){
    	 document.getElementById('i5').innerHTML = '';
    	
    }else{
    	 document.getElementById('i5').innerHTML = '';
    	alert("password should be atleast 6 characters ");
    	return false;
    }
    
    
    if(validateChecks()==false) {
		alert('Please fill atleast one Hobby');
		return false;
	}
	
}
</script>


<%!UserData edit;
   String[] hobbys= {" ", " "," "," "};
   String[] gender= {" ", " "," "," "};
   String[] edu= {" ", " "," "," "};
   String hobby;
   String gen;
   String edug;

 %>
<%
try{

String s =request.getParameter("id");
System.out.println(s);
System.out.println(s.length());
Gson gson = new Gson();

			MongoClient mongoClient = com.example.Mdatabase.getInstance();
			MongoDatabase database = mongoClient.getDatabase("d2");

			com.mongodb.client.MongoCollection<Document> collection;

			collection = database.getCollection("c2");
		 if(s != null && s.length() != 0){
			 
			 System.out.println("inside if");
			 System.out.println(s.charAt(0));
			Long a =new Long(Character.getNumericValue(s.charAt(0)));
			if(a != 1l){

			 Document myDoc = collection.find(com.mongodb.client.model.Filters.eq("Userid", a)).first();
			
			 System.out.println(myDoc.toJson());
			 edit = gson.fromJson(collection.find(com.mongodb.client.model.Filters.eq("Userid",a)).first().toJson(),UserData.class);
			System.out.println(edit.getEmail());
			}else{
				response.sendRedirect("admin");
			}
		 }
		 
		 
		 //"<%=edit.getEmail()"
		 hobby = edit.getHobby();
		 gen = edit.getGender();
		 edug=edit.getEdu();
		 hobbys[0]=" ";
		 hobbys[1]=" ";
		 hobbys[2]=" ";
		 
		 if(hobby != null && hobby.length() !=0){
			 
			 System.out.println(" inside hobby if");
			 System.out.println(hobby);
			
			if(hobby.contains("Music")){
				 hobbys[0]="checked='checked'";
				
			}
			if(hobby.contains("Drawing")){
				 hobbys[1]="checked='checked'";
				
			}
			if(hobby.contains("Reading")){
				 hobbys[2]="checked='checked'";
				
			}
			 
		 }else{
			 
			 			 
		 }
		 
		 gender[0]=" ";
		 gender[1]=" ";
		 gender[2]=" ";

		 
 	if(gen != null && gen.length() !=0){
			 
			 System.out.println(" inside hobby if");
			 System.out.println(gen);

				
			if(gen.contains("MALE")){
				gender[0]="checked='checked'";//selected="selected"
				
			}
			if(gen.contains("FEMALE")){
				gender[1]="checked='checked'";
				
			}
			if(gen.contains("OTHER")){
				gender[2]="checked='checked'";
				
			}
			 
		 }else{
			 
			 			 
		 }
		 
		 
 	 edu[0]=" ";
	 edu[1]=" ";
	 edu[2]=" ";
	 
	if(edug != null && edug.length() !=0){
			 
			 System.out.println(" inside hobby if");
			 System.out.println(edug);

			

			
			if(edug.contains("B.E")){
				edu[0]="selected='selected'";//selected="selected"
				
			}
			if(edug.contains("M.E")){
				edu[1]="selected='selected'";
				
			}
			if(edug.contains("M.Phil")){
				edu[2]="selected='selected'";
				
			}
			 
		 }else{
			 
			 			 
		 }
		 
		 
	
		
		 
		 
		 
}

catch(Exception e){
	

	 System.out.println("update Exception method executed");

 	  System.out.println(" Exception gets executed in Login user  method");
 	  e.getCause();
 	  System.out.println(" getMessage() ---------------------------------------------");

 	System.out.println(  e.getMessage());
 	  System.out.println(" Class()---------------------------------------------");

 	System.out.println(  e.getClass());
 	  System.out.println(" getStackTrace()---------------------------------------------");

 	System.out.println( ( e.getStackTrace().toString()));
 	  System.out.println(" ---------------------------------------------()");

 	  System.out.println(" getPrintStackTrace()---------------------------------------------");
e.printStackTrace();
	
 	  System.out.println(" ---------------------------------------------");
	
	response.sendRedirect("admin");
}
			 
%>
<center>
<h5>
<c:out value="Edit details here"></c:out></h5>
<form name="myForm" action="verify"
onsubmit="return validateForm()" method="post">




			<table id="cssTable"
				class="mdl-data-table mdl-js-data-table  mdl-shadow--2dp">
<table>
    <tbody>
     <tr>
    <td>Enter User ID</td>
<td><input class="mdl-textfield__input" type="number" name="id"  value= <%=edit.getUserid()%> ></td></tr>
<tr> <td></td>
<td><p id="i7" > </p></td>
</tr>
    
    <tr>
    <td>Enter First Name</td>
<td><input class="mdl-textfield__input" type="text" name="fname" pattern="[A-Za-z ]*" value = <%=edit.getName()%>></td></tr>
<tr> <td></td>
<td><p id="i1" > </p></td>
      </tr>           
         <tr>
    <td>Enter Last Name</td>
<td><input class="mdl-textfield__input" type="text" name="lname" pattern="[A-Za-z ]*" value =<%=edit.getLastname()%> ></td></tr>
<tr> <td></td>
<td><p id="i2" > </p></td>
</tr>

 <tr>
    <td>Enter email</td>
<td><input class="mdl-textfield__input" type="email" name="email" value =<%=edit.getEmail()%> ></td></tr>
<tr> <td></td>
<td><p id="i3" > </p></td>
</tr>




 <tr>
    <td>Enter Phone Number</td>
<td><input class="mdl-textfield__input" type="text" name="phone" value =<%=edit.getPhone() %>></td></tr>
<tr> <td></td>
<td><p id="i4" > </p></td>
</tr>




 <tr>
    <td>Enter Password</td>
<td><input class="mdl-textfield__input" type="password" name="pwd" pattern=".{6.}" value=<%=edit.getPassword() %> ></td></tr>
<tr> <td></td>
<td><p id="i5" > </p></td>
</tr>


 <tr>
    <td>Hobby</td>
    </tr>
    <tr>
    <td></td>
	<td><input type="checkbox" name="options[]" value="Music" <%out.print(hobbys[0]);%>  > Listening to music <br /></td>
	</tr>
	<tr>
	    <td></td>
	<td><input type="checkbox" name="options[]" value="Drawing" <%out.print(hobbys[1]);%> > Drawing <br /></td>
	</tr>
	<tr>
	    <td></td>
	<td><input type="checkbox" name="options[]" value="Reading Book" <%out.print(hobbys[2]);%> > Reading Books<br></td>
	</tr>
	<tr>
	<td></td><br>
	</tr>
	<tr>
	<td>Highest Qualification</td>
	<td>
	<select name="edu" required>
  <option value="">None</option>
  <option value="B.E" <%out.print(edu[0]);%> >  B.E  </option>
  <option value="M.E" <%out.print(edu[1]);%> >  M.E  </option>
  <option value="M.Phil" <%out.print(edu[2]);%>>  M.Phil  </option>
</select>
</td><br>
</tr>
<tr>

	<td> Gender</td>
	<td>
</tr>
<tr>
<td></td>
<td>
 <input type="radio" name="gender" value="MALE" <%out.print(gender[0]);%>> Male<br>
  <input type="radio" name="gender" value="FEMALE" <%out.print(gender[1]);%> > Female<br>
  <input type="radio" name="gender" value="OTHER" <%out.print(gender[2]);%> > Other<br><br>
 
</td>
</tr>
<tr>
<td></td>
</tr>
<tr>

<td><a href="admin"><button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" >Cancel</button></a>
 </td>
				

<td><button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" name="update" type="submit" value="update">Update</button></td>
</tr>
</tbody>
			</table>
			<br>
			<p id="pl"></p>
			<br>

		</form>
</center>

</body>
</html>