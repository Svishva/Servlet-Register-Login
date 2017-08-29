<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <%@ page import="com.example.LoggedUserDetails.LoggedUser" %>
 <%@ page import ="com.example.UserData" %>
  <%@ page import ="com.example.LoggedUserDetails.LoggedUser" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
 <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">	

html, body {height:100%;}
html {display:table; width:100%;}
body {display:table-cell; text-align:center; vertical-align:middle;}



</style>
<title>My Page</title>
</head>
<body>


<%


 if((Long)application.getAttribute("login") == null ){
	
	System.out.println("login == null");
	response.sendRedirect("login"); //Login.jsp
	
}
else if ((Long)application.getAttribute("login") == 0l){
	
	System.out.println("login == 0");

	response.sendRedirect("login");
}else if ((Long)application.getAttribute("login") == 2l){
	
	System.out.println("login == 2");

	response.sendRedirect("admin");
}
else if((Long)application.getAttribute("login") == 1l){
	
	
	System.out.println("login == 1");

	//LoggedUser temp= new LoggedUser();
	UserData tempuser=new UserData();
	UserData user = (UserData) application.getAttribute("loggeduser");
	System.out.println("---------------------------------------");

	System.out.println(user.getName()+""+user.getEmail());
	System.out.println(""+user.getPassword());
	System.out.println(""+user.getName());

	System.out.println("---------------------------------------");

	
	
	System.out.println("LoggedUser---------------------------------------");

	System.out.println(user.getEmail());
	System.out.println(user.getInfo());

	System.out.println("---------------------------------------");

	%> 
	<i class="material-icons">thumb_up</i>
	<h5>
	<c:out value="Hai"></c:out> <%= user.getName()  %> 
	<c:out value=" You have Successfully logged in"></c:out></h5>
	
	<%
	
	//  response.sendRedirect("Success");
	

%>


<c:out value="Here are your details<br><br>" escapeXml="false" ></c:out>

<%= "Name = "+user.getName()  %><br>
<%= "Email = "+user.getEmail()  %>

	<br><br><button><a href="logout">Log out</a></button>
<%
}
%>

</body>
</html>