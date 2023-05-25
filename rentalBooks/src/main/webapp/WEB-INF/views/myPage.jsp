<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter"%>
    
    
    <%
    String id = null;
    String name = null;
    if(session.getAttribute("userid") != null) {
  	  id = (String) session.getAttribute("userid"); 
  	name = (String) session.getAttribute("username"); 
    }

    %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <title>Book a book</title>
  <style type="text/css">
  

   h1 {
        text-align: center;
        margin-top: 80px;
        margin-bottom: 20px;
        font-size: 90px;
        font-weight: bold;
    }
    h1 span:nth-child(1) {
        color:#4285f4;
    }
    h1 span:nth-child(2) {
        color:#ea4335;
    }
    h1 span:nth-child(3) {
        color:#fbbc05;
    }
    h1 span:nth-child(4) {
        color:#4285f4;
    }
    h1 span:nth-child(5) {
        color:#34a853;
    }
    h1 span:nth-child(6) {
        color:#ea4335;
    }
     h1 span:nth-child(7) {
        color:#4285f4;
    }
 
 h3 {
        text-align: center;
        font-weight: bolder;
    }
	h3 span {
	padding-right: 8px; 
	}	
        
    h3 span:nth-child(1) {
        color:#4285f4;
    }
    h3 span:nth-child(2) {
        color:#ea4335;
    }
    h3 span:nth-child(3) {
        color:#fbbc05;
    }
    h3 span:nth-child(4) {
        color:#4285f4;
    }
    h3 span:nth-child(5) {
        color:#34a853;
    }
    h3 span:nth-child(6) {
        color:#ea4335;
    }
     h3 span:nth-child(7) {
        color:#4285f4;
    }
	
	#row {
	margin-bottom: 80px;
	}
	
    #topRow-left { 
      padding-left: 400px;  
      
     } 
           
    #tableH {
     width: 1000px;
     margin-left: 130px;
       
    }

	#dropD {
		font-size: 14px;
	
	}
   
   .mypage {
	text-align: center;
	margin-top: 50px;
	}
	
	.mypage form {
	margin: 50px auto;
	width: 500px;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0,0,0,0.2);
	}
	
	.mypage label  {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
	}
	    
    input#floatingPassword {
    border: 2px solid #4285f4;
    width: 200px;
    height: 10px;
    margin: 10px auto;
    padding-top: 15px;
    padding-bottom: 15px;
    }    
    	
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" style="color:#4285f4; font-weight: bold; font-size: 35px;" href="main">Book a Book</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" style="color: #ea4335; font-size: 20px;" aria-current="page" href="main">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" style="color: #fbbc05; font-size: 20px;" href="searchBook">Book</a>
        </li>
       </ul>
    </div>
    <%
    	if (id == null) {
    	
    %>
    <div class="dropdown">
  <button class="btn btn-success dropdown-toggle" id="dropD" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    접속하기
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="login">로그인</a></li>
    <li><a class="dropdown-item" href="join">회원가입</a></li>
  </ul>
</div>
<% } else { if(name.equals("코코딩")) {%>
    	<div class="dropdown">
  <button class="btn btn-success dropdown-toggle" id="dropD" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    마이페이지관리
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="myPage"><%=name%> 페이지</a></li>
    <li><a class="dropdown-item" href="myBooking">예약관리페이지</a></li>
    <li><a class="dropdown-item" href="logoutAction">로그아웃</a></li>
  </ul>
</div>	
<%} else {// else안에 if %>
    	<div class="dropdown">
  <button class="btn btn-success dropdown-toggle" id="dropD" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    마이페이지관리
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="myPage"><%=name%> 페이지</a></li>
    <li><a class="dropdown-item" href="logoutAction">로그아웃</a></li>
  </ul>
</div>	
<%} // else%>

<%} // else%>


    
    
  </div>
</nav>

  <h1>
    <span>W</span><span>e</span><span>l</span><span>c</span><span>o</span><span>m</span><span>e</span>
  </h1>
 <%
    	if (id != null) {
    	
    %>
  
  <h3>
    <span>H</span><span>e</span><span>l</span><span>l</span><span>o</span><span><%=name %></span><span>👋</span>
  </h3>


	<form action="updateAction" method="post" id="frm">
		<div class="mypage"> 
  		<label for="floatingPassword" style="color: #34a853; font-size: 18px;">Password</label>
		<div class="form-floating">
  		<input type="password" name ="password" class="form-control" id="floatingPassword" placeholder="Enter your password">
		</div>
		
  		<label for="floatingPassword" style="color: #fbbc05; font-size: 18px;">New password</label>
		<div class="form-floating">
  		<input type="password" name ="newpass" class="form-control" id="floatingPassword" placeholder="Enter new password">
		</div>
		

	<button type="submit" style="margin-top: 20px;" class="btn btn-outline-danger">UPDATE</button>
	</form>

</div>
<% } %>


</body>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">


</script>
</html>