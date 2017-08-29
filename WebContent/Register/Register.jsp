<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page extends = "com.example.Mdatabase" %>
<%@ page import ="com.mongodb.client.FindIterable" %>
<%@ page import ="com.mongodb.DBCursor" %>
<%@ page import ="com.mongodb.Cursor" %>

<%@ page import = "org.bson.Document" %>   
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
 <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style type="text/css">	




</style>


<title>Insert title here</title>
</head>
<body>

Register page


<form method="post" action="verify">



   
    <table id="cssTable" class="mdl-data-table mdl-js-data-table  mdl-shadow--2dp">
     
      <tbody>
      
        <tr>
          <td>Enter Name</td>
          <td><input type="text" name="name" pattern="[A-Za-z]{5,10}" required></td>
          
        
         
        </tr>
        <tr>
          <td>Enter Email</td>
          <td> <input type="email" name="email" required>  </td>
                  
        </tr>
        <tr>
          <td>Enter Password</td>
          <td><input type="password" name="pwd" pattern=".{6,20}" required><br></td>
                    
          
        </tr>
      </tbody>
    </table>
<br>
<p id="pl"></p>
<br>


<input type="submit" name="RegisterForm">
</form>

</body>
</html>