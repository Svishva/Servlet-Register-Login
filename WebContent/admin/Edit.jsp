<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
edit page
<%
try{

String s =request.getParameter("id");
System.out.println(s);
System.out.println(s.length());

			MongoClient mongoClient = com.example.Mdatabase.getInstance();
			MongoDatabase database = mongoClient.getDatabase("d2");

			com.mongodb.client.MongoCollection<Document> collection;

			collection = database.getCollection("c2");
		// collection.find().sort(new BasicDBObject("Userid",1));

		 if(s != null && s.length() != 0){
			 
			 System.out.println("inside if");

			 
		 for(int i=0;i<s.length();i++){
			 System.out.println("inside for");

			 //String a=new String(s.charAt(i));
			Long a =new Long(Character.getNumericValue(s.charAt(i)));
					 
			if(a != 1l){
			 collection.deleteOne(new Document("Userid", a));
			}else{
				
				response.sendRedirect("admin");
				
			}
		 }
		 }
		
			response.sendRedirect("admin");
			
}
catch(StringIndexOutOfBoundsException e){
	
	
	response.sendRedirect("admin");
}
		%>


</body>
</html>