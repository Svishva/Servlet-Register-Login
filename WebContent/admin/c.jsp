<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<head>
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
img {
   top: 50%;
   left: 50%;
   width: 500px;
   height: 500px;
   margin-top: -250px; /* Half the height */
   margin-left: -250px; /* Half the width */
}

html { 
   
   background:url();
}


</style>
</head>

<img  alt="Error" src="https://www.apple.com/ac/globalfooter/3/en_US/assets/ac-footer/breadcrumbs/apple/icon_large.svg">

<body onload="disableSubmit()">

<center>



Register Here
<form name="myForm" action="/action_page_post.php"
onsubmit="return validateForm()" method="post">
    <table>
    <tbody>
    
    <tr>
    <td>Enter User ID</td>
<td><input class="mdl-textfield__input" type="number" name="id" min="0" ></td></tr>
<tr> <td></td>
<td><p id="i3" > </p></td>
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
<td><input class="mdl-textfield__input" type="password" name="pwd" pattern=".{6.}"></td></tr>
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
 
   <input type="checkbox" id="myCheck" name="test" onchange="activateButton(this)" required>  I accept terms and condition <br>
</td>
</tr>
<tr>
<td></td>
<td><br><input type="submit" value="Submit" id="RegisterForm"  name="RegisterForm"></td>
</tr>

</tbody>
</table>
<br><br>
Click <a href="login">here</a> to login

<br><br>

<br>
</form>
</center>
</body>
</body>
</html>
