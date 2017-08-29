package com.example;
/*
 * 
 * 
 * 
 * Purpose : All form submit are directed here to do operations like
 *           Register User, Update User, Delete User
 *           
 * @author  Visweshwaran
 * 
 */

import static com.mongodb.client.model.Filters.eq;

import java.io.IOException;
import java.net.ConnectException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.UnavailableException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.example.LoggedUserDetails.LoggedUser;
import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoSocketOpenException;
import com.mongodb.MongoTimeoutException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.IndexOptions;
import com.mongodb.client.model.Indexes;



public class Mdatabase extends HttpServlet {

	
	private static final long serialVersionUID = 6565264561310991965L;
	
	 protected static MongoClient mongoClient;
	 protected static MongoCollection<Document> collection;
	 protected static MongoCursor<Document> myDoc;
	 protected UserData dummy = new UserData(0l,null,null,null,null,null,null,null,null);
	 private UserData tempdata;
	 private Gson gson=new Gson();

	 /*
	  *   Singleton Pattern
	  * 
	  */
	  private  static final MongoClient mc = new MongoClient( "localhost" , 27017 );
	
	  public static MongoClient getInstance(){
		 
		  return mc;
		  
	  }
	  
	  // Reference link http://www.javaworld.com/article/2073352/core-java/simply-singleton.html?page=2

	  /*
	   * 
	   * (non-Javadoc)
	   * @see javax.servlet.GenericServlet#init(javax.servlet.ServletConfig)
	   */
	  
	@Override
	public void init(ServletConfig config)
		      throws ServletException
		   {
		      super.init(config);
		      try {
		         
		     	if(mongoClient == null){
					
					mongoClient =  Mdatabase.getInstance();	
				    System.out.println(" mongoClient getInstance initialized");

				}
		     	MongoDatabase database = mongoClient.getDatabase("d2");
		     	 collection = database.getCollection("c2");
		      }
		      catch(MongoSocketOpenException e){
		    	  
		    	  System.out.println(" MongoSocketOpenException gets executed in init method");
		    	  
		      }
		      catch (Exception e) {
		    	  
		    	  System.out.println(" Exception  gets executed in init method");
		         throw new UnavailableException(e.getMessage());
		      }

		   }
	
	
	
	
	@Override
	public void destroy()
	   {
	      try {
	         if (mongoClient != null) {
	        	 mongoClient.close();
				    System.out.println(" mongoClient gets closed");
	        	 mongoClient = null;
	         }
	      }
	      catch (Exception ignore) {
	    	  
	    	  System.out.println(" Exception gets executed destroy");
	    	  
	      }

	      super.destroy();
	   }

	

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException{
		
		
		System.out.println("doGet method executed");
				
			}
	
	
	/*
	 * 
	 * (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	
	
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	System.out.println("doPost method executed");
	
	try{
	if(request.getParameter("RegisterForm") != null){
		
		RegisterUser(request,response);
		
	}
	 
	if(request.getParameter("LoginUser") != null){
		
		LoginUser(request,response);
		
	}
	
	if(request.getParameter("update") != null){
		
		Update(request,response);
		
	}
	if(request.getParameter("delete") != null){
		
		Delete(request,response);
		
	}
	
	
	}
	catch(Exception e) {
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

	  	 response.sendRedirect("home");
		

	}

		
		
		
		
		
		
	}

/* 
 * Purpose : Deletes a user record from database
 * Post parameter 
 * @param  : id - String  
 *           Database  column "Userid"
 * Work    :  if database has this Userid  { delete this record }
 *            else redirect to deletefail JSP
 * 
 * 
 */
protected void Delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
	
	try {
		
		 System.out.println("delete method executed");
		
		 Long id;
		 
		 if( request.getParameter("id") != null ) {
			 //id not null store in 'id'
			 id= new Long( request.getParameter("id"));
			 
		 }else {
			 //if id null
			 System.out.println("delete if null executed");
			 response.sendRedirect("deletefail");
			  return;

			 
		 } 
		 
		 
		 if( collection.find(new BasicDBObject("Userid",id)).iterator().hasNext()){
			 
			 System.out.println("delete else find executed");

			 collection.deleteOne(new Document("Userid", id));

			  response.sendRedirect("adminupdate");
			  return;

		 }else {
			 
			 
			 System.out.println("delete else executed");
			 response.sendRedirect("deletefail");
			  return;

		 }
		 
		 
		
	}catch(NumberFormatException e){
		
		 response.sendRedirect("deletefail");
		
	}catch(MongoTimeoutException e){
		
	  	  System.out.println(" MongoTimeoutException gets executed in RegisterUser  method");
	  	  
	  	  System.out.println(" Cannot connect Mongo  ;(  ");
	  	  System.out.println(" Either Web is not Connected to Database or Mongo is not Connecting  ;(");
	  	  destroy();
	  	 response.sendRedirect("Databasetimeout");
		
		
	}
	
	catch(Exception e) {
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

	  	 response.sendRedirect("home");
		

	}
	
	
}

private void Update(HttpServletRequest request, HttpServletResponse response) throws IOException {

	
	try {
	 System.out.println("update  method executed");

	 String id = request.getParameter("id");
	 
		String firstname = request.getParameter("fname");
		String lastname = request.getParameter("lname");
		String phone = request.getParameter("phone");
		
		String[] hobby = request.getParameterValues("options[]");
		String hobbys="";
		String edu = request.getParameter("edu");
		String gender = request.getParameter("gender");
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		String[] foo = request.getParameterValues("foo");
		
		
		for(int i=0;i<hobby.length;i++) {
			
			if(hobby[i] != null) {
				
				hobbys=hobbys + hobby[i]+",";
			}
		}

	if( email != null){
		
	email = email.toLowerCase();
	
	}
	
	 System.out.println("name "+ firstname);
	 System.out.println("id="+id);
	
	Long l =new Long(id);

	 if(collection.find( new BasicDBObject("Userid", l)).iterator().hasNext()) {
		 
		 UserData user =  new UserData(l,firstname,lastname,phone,hobbys,edu,gender,email,pwd);

			collection.replaceOne(eq("Userid", l), Document.parse( gson.toJson(user)));

		 
	 }else {
		 
		 Long i=1l;
		  while(collection.find(eq("Userid",i)).iterator().hasNext()){
		
		   i=i+1l;
		  }
		 UserData user =  new UserData(i,firstname,lastname,phone,hobbys,edu,gender,email,pwd);

		 collection.insertOne(Document.parse( gson.toJson(user)));

	 }
	 
	 
	 
	  UserData user =  new UserData(l,firstname,lastname,phone,hobbys,edu,gender,email,pwd);

	collection.replaceOne(eq("Userid", l), Document.parse( gson.toJson(user)));
	
	  response.sendRedirect("adminupdate");

	
	}catch(MongoTimeoutException e){
		
	  	  System.out.println(" MongoTimeoutException gets executed in RegisterUser  method");
	  	  
	  	  System.out.println(" Cannot connect Mongo  ;(  ");
	  	  System.out.println(" Either Web is not Connected to Database or Mongo is not Connecting  ;(");
	  	  destroy();
	  	 response.sendRedirect("Databasetimeout");
		
		
	}
	catch(Exception e) {
		

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
	  	 response.sendRedirect("home");

		
	}
	
	
	
	
}

private void LoginUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
	

	 System.out.println("LoginUser  method executed");

	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	try{
		
		
		 request.getServletContext().setAttribute("login",0l); 
	
		
		if(email != null && pwd != null ){
			
			  email= email.toLowerCase();
			  BasicDBObject  query = new BasicDBObject("email",email)
	          .append("password",pwd);  
			  //if valid user
			 	  if( collection.find(query).iterator().hasNext()) {
	    		  
					//if User is Admin		  
	    		  if(email.equals("admin@jiit.com")) {
	    			  
	    			  System.out.println("Admin have Successfully loged in");
	    			 request.getServletContext().setAttribute("login",2l); 
	    			  response.sendRedirect("admin");
	    			  return;
			  	    			  
	    		  }
	    		  else {
	  				//if User is not  Admin		  
	    		   System.out.println("You have Successfully loged in");
	    		   request.getServletContext().setAttribute("loginerror", null);
	    		   tempdata = gson.fromJson(collection.find(eq("email",email)).first().toJson(),UserData.class);
	    		   new LoggedUser(tempdata);
	    		   new UserData(tempdata);
	    		   request.getServletContext().setAttribute("login",1l); 
	 	    	  request.getServletContext().setAttribute("loggeduser",tempdata); 
	    		   response.sendRedirect("LoginSuccess");    
	    		   return;
	    	  }
	    	  }
			 	  //if email already registered
	    	  else  if(collection.find(new BasicDBObject("email",email)).iterator().hasNext()) {
	    		    	
	    		    	 request.getServletContext().setAttribute("emailexist", " Please double check your password");
	    		    	
	    		    }else {
	    		    	
	    		    	
	    		    	 request.getServletContext().setAttribute("emailexist", "This email does not exist Please Register");
	    		    }
	    		  
	    		  
	    		  request.getServletContext().setAttribute("login",0l); 
	    		  System.out.println("login name & pws incorrect");
	    		  response.sendRedirect("LoginFailed");
	    		  
	    	  }
		
		
	
	}catch(MongoTimeoutException e){
		
	  	  System.out.println(" MongoTimeoutException gets executed in RegisterUser  method");
	  	  
	  	  System.out.println(" Cannot connect Mongo  ;(  ");
	  	  System.out.println(" Either Web is not Connected to Database or Mongo is not Connecting  ;(");
	  	  destroy();
	  	 response.sendRedirect("Databasetimeout");
		
		
	}
	catch(Exception e){
		
		 System.out.println("LoginUser Exception method executed");

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

	  	 response.sendRedirect("home");
		
	}
		
}


	   

	
	
	

	


private void RegisterUser(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {

	
	
	 System.out.println("RegisterUser method executed");
	
	 LoggedUser temp = null;
	 
	 
	String firstname = request.getParameter("fname");
	String lastname = request.getParameter("lname");
	String phone = request.getParameter("phone");
	
	String[] hobby = request.getParameterValues("options[]");
	String hobbys="";

	String edu = request.getParameter("edu");
	String gender = request.getParameter("gender");
	
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	String errorStatus="";
	
	try{
		
		
		
		for(int i=0;i<hobby.length;i++) {
			
			if(hobby[i] != null) {
				
				hobbys=hobbys + hobby[i]+",";
			}
		}
		
		
		if( email != null){
			
		email = email.toLowerCase();
		
		}
		
		
		if(collection.count() ==0 ){
			
			System.out.println("ifcollection.count part");

			
			IndexOptions indexOptions = new IndexOptions().unique(true);
			collection.createIndex(Indexes.ascending("Userid","name", "email"), indexOptions);
			collection.createIndex(Indexes.text("password"));
			
			UserData admin = new UserData(1l,"admin","admin",null,null,null,null,"admin@jiit.com","admin");
			collection.insertOne(Document.parse( gson.toJson(admin)));

			
			
			UserData user =  new UserData(2l ,firstname,lastname,phone,hobbys,edu,gender,email,pwd);
				
			
		// Type 1 :Java Object <==> Mongodb Document	
		/*	String json = gson.toJson(user);
			//Data POJO = gson.fromJson(br,UserData.class); 
			Document doc =new Document();
			collection.insertOne(Document.parse(json));
			Document myDoc = collection.find().first();
			System.out.println(myDoc.toJson());

			UserData user2 =gson.fromJson(myDoc.toJson(), UserData.class);
			*/
			
			// Type 2 :Java Object <==> Mongodb Document	

			collection.insertOne(Document.parse( gson.toJson(user)));
		//	UserData user2 =gson.fromJson(collection.find().first().toJson(), UserData.class);
			
		

		    	  request.getServletContext().setAttribute("loggeduser",user); 
		    	  request.getServletContext().setAttribute("login",1l); 

		    	  new LoggedUser(user);
		    	  new UserData(user);
		    	 response.sendRedirect("Success"); //SuccesssPage.jsp
			
			
					
			
		}else{
			System.out.println("ifcollection.count else  part");
			
			
			 myDoc = collection.find(eq("email",email)).iterator();
			if(myDoc.hasNext() ){
				
				myDoc.close();
				System.out.println("You have already registerd please login");
				errorStatus=" <br>You have already registered ";
				request.setAttribute("errorStatus", errorStatus);
				request.getServletContext().setAttribute("login", 0l);
		    	  request.getServletContext().setAttribute("loggeduser",dummy); 

		     	 response.sendRedirect("Failure");			
			
		
	}else{
		
		 Long i=1l;
		  while(collection.find(eq("Userid",i)).iterator().hasNext()){
		
		   i=i+1l;
		  }
		System.out.println("ifcollection.count part");
		UserData user =  new UserData(new Long(i),firstname,lastname,phone,hobbys,edu,gender,email,pwd);
		collection.insertOne(Document.parse( gson.toJson(user)));

		UserData user2 =gson.fromJson(collection.find().first().toJson(), UserData.class);
		
	    	System.out.println(user2.getName());
	    	System.out.println(user2.getEmail());
	    	  request.getServletContext().setAttribute("loggeduser",user); 
	    	  request.getServletContext().setAttribute("loggeduser",user); 
	    	  request.getServletContext().setAttribute("login",1l); 
	    	  response.sendRedirect("Success");
	}
		
		
	}
	}
	catch(MongoSocketOpenException e){
  	  
  	  System.out.println(" MongoSocketOpenException gets executed in RegisterUser  method");
  	  
    }
	catch(ConnectException e){
		
	  	  System.out.println(" ConnectException gets executed in RegisterUser  method");

		
	}
	catch(MongoTimeoutException e){
		
	  	  System.out.println(" MongoTimeoutException gets executed in RegisterUser  method");
	  	  
	  	  System.out.println(" Cannot connect Mongo  ;(  ");
	  	  System.out.println(" Either Web is not Connected to Database or Mongo is not Connecting  ;(");
	  	  destroy();
	  	 response.sendRedirect("Databasetimeout");
		
		
	}
	
	
	
	catch(Exception e){
		
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

		
	  	 response.sendRedirect("home");
	}
	
	
	
}	

}
