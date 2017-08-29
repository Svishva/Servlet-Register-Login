<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.example.Mdatabase" %>
<%@ page import ="com.mongodb.client.FindIterable" %>
<%@ page import ="com.mongodb.DBCursor" %>
<%@ page import ="com.mongodb.Cursor" %>
<%@ page import="com.mongodb.DBCollection" %>

<%@ page import = "org.bson.Document" %>
<%@ page import = "com.mongodb.BasicDBObject" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//FindIterable<Document> documents = collection.find();

//Document myDoc = collection.find().first();
//System.out.println(myDoc.toJson());

//MongoCursor<Document> cursor = collection.find().iterator();

 /*

 
 /*
  *Works Super
  *
  
try {
	
	  cur = collection.find();
	
	if (cur == null){
	cur = collection.find();
    System.out.println("cursor is null ");
	
	}
    while (cur.hasNext()) {
    	
        System.out.println(cur.next());
    }
} finally {
    System.out.println("\n");

	cur.close();
}

 
 
 
 */
%>


<%





%>


</body>
</html>