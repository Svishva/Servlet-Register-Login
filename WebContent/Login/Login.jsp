<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
 <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


<style type="text/css">	


img {
   top: 50%;
   left: 50%;
   width: 500px;
   height: 400px;
   margin-top: -200px; /* Half the height */
   margin-left: -250px; /* Half the width */
}


</style>

<title>Login</title>
</head>
<body>
<img  alt="Error" src="https://www.apple.com/ac/globalfooter/3/en_US/assets/ac-footer/breadcrumbs/apple/icon_large.svg">

<center> 

<%

try{
if(application.getAttribute("login") == null){
	
	
}
if(application.getAttribute("login") != null && (Long)application.getAttribute("login") == 1l ){
	
	response.sendRedirect("userinfo"); // UserInfo.jsp
	
}else if(application.getAttribute("login") != null && (Long)application.getAttribute("login") == 2l ){
	
	response.sendRedirect("admin");
}
}

catch(IllegalStateException e){
	
	System.out.println("LoginUser Exception method executed");

	  System.out.println(" Exception gets executed in RegisterUser  method");
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

}
%>


	
	
	
<c:if test="${not empty loginerror}">
   <c:out value="${loginerror}"/>
</c:if>
<br> <br>

<c:if test="${not empty emailexist}">
   <c:out value="${emailexist}"/>
</c:if>
<br> <br>


<h6>
<c:out value="Login"></c:out><br><br></h6>

<form method="post" action="verify">

 <table id="cssTable" class="mdl-data-table mdl-js-data-table  mdl-shadow--2dp">
     
      <tbody>
      <tr>
          <td>Enter Email</td>
          <td> <input class="mdl-textfield__input" type="email" name="email" required>  </td>
                  
        </tr>
 		<tr>
          <td>Enter Password</td>
          <td><input class="mdl-textfield__input" type="password" name="pwd" pattern=".{5,20}" required><br></td>
                    
          
        </tr>
      </tbody>
    </table>
<br>

<input type="submit" name="LoginUser">


</form>

<br><br>	<c:out value="Don't have account!!! Create New One<br><br><br> " escapeXml="false"></c:out>

<button><a href="home">Create New</a></button> <br><br><br>
</center>
</body>
</html>