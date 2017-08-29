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
<title>Delete Failed</title>
<style type="text/css">	

html, body {height:100%;}
html {display:table; width:100%;}
body {display:table-cell; text-align:center; vertical-align:middle;}



</style>
</head>
<body>
<%
if(application.getAttribute("login") == null){
	
	response.sendRedirect("userinfo"); 

}


if(application.getAttribute("login") != null && (Long)application.getAttribute("login") == 1l ){
	
	response.sendRedirect("userinfo"); 
	// UserInfo.jsp
	//Goto Ordinary User
}else if(application.getAttribute("login") != null && (Long)application.getAttribute("login") == 2l){
	
	//Show admin page


}
%>
<c:out value="Sorry Admin <br>  Record did not deleted <br> Pleassr enter proper input <br>" escapeXml="false"/>
<a href="admin"> Show </a> all records



<center>



</center>
</body>
</html>