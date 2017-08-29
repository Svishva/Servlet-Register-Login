<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.Mdatabase"%>
<%@ page import="com.mongodb.client.FindIterable"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.Cursor"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import=" com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.client.MongoDatabase"%>
<%@ page import="org.bson.Document"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.client.MongoCursor"%>
<%@ page import="com.example.UserData"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="org.bson.Document"%>
<%@ page import="com.mongodb.client.model.Sorts.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<!-- Material Design icon font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
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
   var y = document.forms["myForm"]["lname"].value;
    if(y == ""){
    	 alert("Enter Lastname");
    	 document.getElementById('i2').innerHTML = 'Please enter Last name';
    	 return false;    }
    else{
    	
   	 document.getElementById('i2').innerHTML = '';

    }
    
    x = document.forms["myForm"]["phone"].value;
    
    if (x=="") {
         document.getElementById('i4').innerHTML = 'Please enter ten digit mobile number';
         alert("Enter 10 digit mobile number");
        //flag= false;
        return false;
    }else{
    	
    	 document.getElementById('i4').innerHTML = '';
    }
    
    
 x = document.forms["myForm"]["pwd"].value;
    
    if (x=="") {
         document.getElementById('i5').innerHTML = 'Please enter password';
         alert("Please enter password");
        return false;
    }else{
    	
    	 document.getElementById('i5').innerHTML = '';
    }
    
    
    
    if(validateChecks()==false) {
		alert('Please fill atleast one Hobby');
		return false;
	}
	
    
    return flag;
}
</script>
<style type="text/css">
#demo-menu-lower-left {
  margin-left: 5%;
}


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


<script type="text/javascript">
	function handleClick()

	{

		var pwd = document.getElementById("pwd").value
		if (pwd.length > 6) {

		} else {

			document.getElementById("pl").innerHTML = "Input OK";
			alert("not ok")
		}

	}

	function val() {

		var pwd = document.getElementById("pwd").value
		document.getElementById("pl").innerHTML = "Input OK";
		//if(pwd.length >6){ return true; }
		//else {
		return false;
		//}
	}
	function val2() {
		//for edit button
		var c= new Array();
		 c =    document.getElementsByName("option[]");
		var l = c.length;   
		var id = "";
		//alert(l);
		var count=0;
		 for (var i=0; i<l; i++) {       
	           if (c[i].type == "checkbox" && c[i].checked == true){
	              count=count+1;
	              id=c[i].value;
	             
	           }
	         }
		 // alert(count);
		  if(count == 0){
				 alert("please select any record");
				 return false;
			 }else if(count == 1) {
				 
				 if(id == "1"){
					 alert("Cannot Edit Admin Details");
					 return false;
				 }
				 var url="adminedit?id=";
				 url=url+id;
				// alert("super");
				 window.location =url;
				 return true;
				
			 }else{
				 alert("Please select only one record");
				 
			 }
	}
	
	function val3() {
		// for Delete button
		var c= new Array();
		 c =    document.getElementsByName("option2[]");
		var l = c.length;   
		var val="";
		//alert(l);
		var count=0;
		 for (var i=0; i<l; i++) {       
	           if (c[i].type == "checkbox" && c[i].checked == true){
	             // count=count+1;
	        	   val =val+ c[i].value;
	           }
		 }
		 if(val ==""){
			 alert("Select atleast one record");
		 }
			 var url="admindelete?id=";
			 url=url+val;
			// alert("super");
			 window.location =url;
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
	   var y = document.forms["myForm"]["lname"].value;
	    if(y == ""){
	    	 alert("Enter Lastname");
	    	 document.getElementById('i2').innerHTML = 'Please enter Last name';
	    	 return false;    }
	    else{
	    	
	   	 document.getElementById('i2').innerHTML = '';

	    }
	    
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
	    	
	    	 alert("Enter 10 digit numbers");
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
<title>Admin</title>
</head>
<body><!-- 
<img  alt="Error" src="https://www.apple.com/ac/globalfooter/3/en_US/assets/ac-footer/breadcrumbs/apple/icon_large.svg">
 -->
<%if(application.getAttribute("login") == null || (Long)application.getAttribute("login") == 1l ){
	
	response.sendRedirect("userinfo"); 
	// UserInfo.jsp
	//Goto Ordinary User
}else if(application.getAttribute("login") != null && (Long)application.getAttribute("login") == 2l){
	
	//Show admin page
	
	%>
	
<button id="demo-menu-lower-left"
            class="mdl-button mdl-js-button mdl-button--icon">
      <i class="material-icons">more_vert</i>
    </button>
    
    <ul class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
        for="demo-menu-lower-left">
      <li class="mdl-menu__item"> <a href="logout">Log out</a></li>
      
    </ul>

	<center>

		<br>
		<br>
		<br>

<i class="material-icons">verified_user</i>
	<h5>	<c:out value="Welcome Admin"></c:out></h5>
		
		<br>
		<br>

		<%
			MongoClient mongoClient = com.example.Mdatabase.getInstance();
			MongoDatabase database = mongoClient.getDatabase("d2");

			com.mongodb.client.MongoCollection<Document> collection;

			collection = database.getCollection("c2");
		 collection.find().sort(new BasicDBObject("Userid",1));

			if (collection.count() == 0) {
		%>
		<c:out value="Database has no records"></c:out><br><br>
		<%
			} else {
		%>
		<c:out value="Here are the List of all records on Database"></c:out><br><br>
		<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
			<thead>
				<tr>
				<td><button onclick="val2()">Edit</button></td>
				<td><button onclick="val3()">Delete</button></td>
					<th>User ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Phone</th>
					<th>Hobby</th>
					<th>Education</th>
					<th>Gender</th>
					<th>Email</th>
					

				</tr>
			</thead>
			<tbody>

				<%
					UserData tempdata = new UserData();
						Gson gson = new Gson();
						MongoCursor<Document> cursor = collection.find().sort(new BasicDBObject("Userid",1)).iterator();
						try {
							while (cursor.hasNext()) {
								tempdata = gson.fromJson(cursor.next().toJson(),
										UserData.class);
				%>
				<tr>
 <td>	<input type="checkbox" name="option[]" value="<%=tempdata.getUserid()%>"> </td>
<td>	<input type="checkbox" name="option2[]" value="<%=tempdata.getUserid()%>"> </td>
					
					<td><%=tempdata.getUserid()%></td>
					<td><%=tempdata.getName()%></td>
					<td><%=tempdata.getLastname()%></td>
					<td><%=tempdata.getPhone() %></td>
					<td><%=tempdata.getHobby()%></td>
					<td><%=tempdata.getEdu()%></td>
					<td><%=tempdata.getGender()%></td>
					<td><%=tempdata.getEmail()%></td>
					

				</tr>

				<%
					// System.out.println(tempdata.getName());
								//System.out.println(tempdata.getEmail());
							}
						} finally {
							cursor.close();
						}
				%>
			</tbody>
		</table>
		<%
			}
		%>
		<br>
		<br> <br>
		<br> <br>
		<h5><c:out value="Create new record"></c:out></h5>
		<br> <br>
		<br>


		<form name="myForm" action="verify"
onsubmit="return validateForm()" method="post">




			<table id="cssTable"
				class="mdl-data-table mdl-js-data-table  mdl-shadow--2dp">
<table>
    <tbody>
     <tr>
    <td>Enter User ID</td>
<td><input class="mdl-textfield__input" type="number" name="id" ></td></tr>
<tr> <td></td>
<td><p id="iu" > </p></td>
</tr>
    
    <tr>
    <td>Enter First Name</td>
<td><input class="mdl-textfield__input" type="text" name="fname" pattern="[A-Za-z ]*" ></td></tr>
<tr> <td></td>
<td><p id="i1" > </p></td>
      </tr>           
         <tr>
    <td>Enter Last Name</td>
<td><input class="mdl-textfield__input" type="text" name="lname" pattern="[A-Za-z ]*"></td></tr>
<tr> <td></td>
<td><p id="i2" > </p></td>
</tr>

 <tr>
    <td>Enter email</td>
<td><input class="mdl-textfield__input" type="email" name="email" ></td></tr>
<tr> <td></td>
<td><p id="i3" > </p></td>
</tr>




 <tr>
    <td>Enter Phone Number</td>
<td><input class="mdl-textfield__input" type="text" name="phone" ></td></tr>
<tr> <td></td>
<td><p id="i4" > </p></td>
</tr>




 <tr>
    <td>Enter Password</td>
<td><input class="mdl-textfield__input" type="password" name="pwd" ></td></tr>
<tr> <td></td>
<td><p id="i5" > </p></td>
</tr>

 
 <tr>
    <td>Hobby</td>
    </tr>
    <tr>
    <td></td>
	<td><input type="checkbox" name="options[]" value="Music" /> Listening to music <br /></td>
	</tr>
	<tr>
	    <td></td>
	<td><input type="checkbox" name="options[]" value="Drawing" /> Drawing <br /></td>
	</tr>
	<tr>
	    <td></td>
	<td><input type="checkbox" name="options[]" value="Reading Book" /> Reading Books<br></td>
	</tr>
	<tr>
	<td></td><br>
	</tr>
	<tr>
	<td>Highest Qualification</td>
	<td>
	<select name="edu" required>
  <option value="">None</option>
  <option value="B.E">  B.E  </option>
  <option value="M.E">  M.E  </option>
  <option value="M.Phil">  M.Phil  </option>
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
 <input type="radio" name="gender" value="MALE" checked> Male<br>
  <input type="radio" name="gender" value="FEMALE"> Female<br>
  <input type="radio" name="gender" value="OTHER"> Other<br><br>
 
</td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td>
</td>
				
<td><button name="update" type="submit" value="register">Register</button> </td>
<td>

 	 </td>
</tr>
</tbody>
			</table>
			<br>
			<p id="pl"></p>
			<br>



		</form>



				<br>	<!-- <button><a href="logout">Log out</a></button>  --> <br><br><br>


	</center>
<%}
else{
	response.sendRedirect("login");
	
}




%>
</body>
</html>