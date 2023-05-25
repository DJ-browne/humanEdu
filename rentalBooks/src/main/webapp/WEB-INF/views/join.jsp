<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.human.web.*" %>
<%@page import="java.io.PrintWriter"%>
  <%
    String id = null;
  String name = null;
    if(session.getAttribute("userid") != null) {
  	  id = (String) session.getAttribute("userid"); 
  	name = (String) session.getAttribute("username");
    }
    if (id != null) {
  	 	PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('이미 로그인이 되어있습니다.')");
  		script.println("location.href='main.jsp'");
  		script.println("</script>");
    }
    
    %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book a book</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>
<style type="text/css">

body {
    background-color: #888;
    background-image: linear-gradient(45deg, #444 25%, transparent 25%, transparent 75%, #444 75%, #444), linear-gradient(45deg, #444 25%, transparent 25%, transparent 75%, #444 75%, #444);
    background-position: 0 0, 25px 25px;
    background-size: 50px 50px;
}

h2 {
	margin-top: 10px;
	margin-bottom: 30px;

}

#inBtn {
background-color: black;

}
       .join {
        
            width: 700px;
            background-color: #EEEFF1;
            margin-right: auto; 
            margin-left: auto; 
            margin-top: 180px;
            padding: 20px;
            text-align: center;
            border-radius: 5%;
            border:solid 3px;
        }

        #userId {
            font-size: 14px;
            padding: 10px;
            border: 1px solid #888;
            width: 260px;
            
        }

        #idCheck {
            font-size: 12px;
        	color: black;
        	border: none;
        	background-color: #EEEFF1;
        	margin-right: 115px;
        }
         input#idCheck:focus {
           outline: none;
        }

        #userPwd {
            font-size: 14px;
            padding: 10px;
            border: none;
            width: 260px;
            margin-bottom: 23px;
            border: 1px solid #888;

        }

        #userName {
            font-size: 14px;
            padding: 10px;
            border: none;
            width: 260px;
            margin-bottom: 23px; 
            border: 1px solid #888;
		
        }

        #joinBtn {
            font-size: 14px;
            border: none;
            border-radius: 3px 3px;
            padding: 10px;
            width: 260px;
            background-color: black;
            margin-bottom: 30px;
            color: white;
            
        }   
         
         #joinBtn:active, #joinBtn:hover {
           
        	padding-right: 0.5px;
            
        }      

        
        .btnradio {
        font-size: 14px;
        border: 1px solid #888;
        background-color: white;
        width: 83px;
        color: black;
        height: 45px;
        padding: 10px;
        cursor: pointer;
        }
        
        .btnradio:hover {
         padding-right:1px;
         
        }
        
        input.btnGroup {
         background-color: black;
         color:white;
        }
        
</style> 
<body>
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" style="font-weight: bold; font-size: 30px;"  href="main.jsp">Book a Book</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" style="font-size: 15px;" aria-current="page" href="main">메인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" style="font-size: 15px;" href="searchBook">BOOK</a>
        </li>
          </ul>
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
    <li><a class="dropdown-item" href="myPage.jsp"><%=name%> 페이지</a></li>
    <li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
  </ul>
</div>	
<%} // else%>

<%} // else%>
       
    </div>
  </div>
</nav>

<form name="join" method="post">
    <div class="join">
        <h2>Sign Up</h2>

        <input type="text" id="userId" placeholder="Enter id" name="userid" ><br>
        <input type="hidden" id="idCheck" name="idchecked" value="이미 사용중인 ID 입니다." readonly><br>
     
        <input type="text" id="userName" placeholder="Enter your name" name="username"> <br>
        <input type="password" id="userPwd" placeholder="Enter password" name="password"> <br>
        
  		<input type="button" name="userg" class="btnradio" value="female" autocomplete="off" >

  		<input type="button"  name="userg" class="btnradio" value="male" autocomplete="off">
		
		<input type="button" name="userg" class="btnradio" value="none" autocomplete="off" >
		
		<input type="hidden" name="usergender" id="usergender" value="">
		<br><br>
        <input id="joinBtn" type="button" value="Join" onclick="signUp()"/>
    </div>
</form>
	
	
<script type="text/javascript"  src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

<script type="text/javascript">

 $(function() {
	 
	 
		$('input[name=userg]').click(function(){
		
			  $('input:button').removeClass("btnGroup");
			  $(this).addClass("btnGroup");
			  
			  $('input[name=usergender]').val( $(this).val() );
			   
			});

 })



function signUp(){
	
  	let userId = document.getElementById("userId").value;
    let userName = document.getElementById("userName").value;
    let userPwd = document.getElementById("userPwd").value;
    let userGender = document.getElementById("usergender").value;
    
	if (userId == "" || userName == "" || userPwd == "" || userGender=="") {
			alert("Please fill in all fields");
    } else {
    		$.ajax({
			
			url : "joinAction",
			data : {
				"userid" : userId,
				"password" : userPwd,
				"username" : userName,
				"usergender" : userGender
				
			},
			type : 'post',
			success : function(data){
				console.log(data)
				if (data == 99) {
//						 service에서 id체크를 거친후 아이디가 중복되니까 99가 리턴되면
						$('input[name=idchecked]').prop("type","text")
				} else if (data == 1) {
					
					location.href='main';
				}    				
				
			},
			error : function(err){
				console.log(err);
			}
		});
    	
    } // else
   		
	 

    	} // sign up
    



</script>


</body>
</html>