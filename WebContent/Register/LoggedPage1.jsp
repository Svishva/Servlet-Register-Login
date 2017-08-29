<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.example.LoggedUserDetails.LoggedUser" %>
 <%@ page import ="com.example.UserData" %>
  <%@ page import ="com.example.LoggedUserDetails.LoggedUser" %>
 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
 <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logged Page 1</title>
</head>
<body>

<%


 if((Integer)application.getAttribute("login") == null ){
	
	System.out.println("login == null");
	response.sendRedirect("login"); //Login.jsp
	
}
else if ((Integer)application.getAttribute("login") == 0){
	
	System.out.println("login == 0");

	response.sendRedirect("login");
}
else if((Integer)application.getAttribute("login") == 1){
	
	
	System.out.println("login == 1");

	//LoggedUser temp= new LoggedUser();
	UserData tempuser=new UserData();
	UserData user = (UserData) application.getAttribute("loggeduser");
	System.out.println("---------------------------------------");

	System.out.println(user.getName()+user.getEmail());
	System.out.println("---------------------------------------");

	%> 
	
	<h5>
	<c:out value="Hai"> <%= "1"+""+"2"+"" %> </c:out>
	<c:out value=" You have Successfully logged in"></c:out></h5>
	
	<%
	
	//  response.sendRedirect("Success");
	
}


%>





</body>
</html>