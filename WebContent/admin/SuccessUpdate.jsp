<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
 <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">	

html, body {height:100%;}
html {display:table; width:100%;}
body {display:table-cell; text-align:center; vertical-align:middle;}



</style>

<title>Insert title here</title>
</head>
<body>
<center> 
<%
try{
if(application.getAttribute("login") == null){
	
	response.sendRedirect("userinfo");
}
if(application.getAttribute("login") != null && (Long)application.getAttribute("login") == 1l ){
	
	response.sendRedirect("userinfo"); // UserInfo.jsp
}
}
catch(Exception e){
	
	
	response.sendRedirect("home");
}


	 %>
	 <h6>
<i class="material-icons">done_all</i><br>
<c:out value="Sucessfully updated "></c:out><br>
<a href="admin"> Show </a> all records
</h6>

</center>
</body>
</html>