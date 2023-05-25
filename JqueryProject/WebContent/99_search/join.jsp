<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 회원가입</title>
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

       .join {
            border: 1px solid #888 ;
            width: 700px;
            background-color: #EEEFF1;
            margin-right: auto;
            margin-left: auto;
            margin-top: 180px;
            padding: 20px;
            text-align: center;
        }

        #userId {
            font-size: 14px;
            padding: 10px;
            border: 1px solid #888;
            width: 260px;
            margin-bottom: 10px;
        }

        #idCheck {
            font-size: 14px;
            border: none;
            border-radius: 3px 3px;
            padding: 10px;
            width: 80px;
            background-color: black;
            color: white;
        }

        #userPwd {
            font-size: 14px;
            padding: 10px;
            border: none;
            width: 260px;
            margin-bottom: 10px;
            border: 1px solid #888;

        }

        #userName {
            font-size: 14px;
            padding: 10px;
            border: none;
            width: 260px;
            margin-bottom: 10px;
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
        width: 83.5px;
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
    <a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="main.jsp">메인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="bbs.jsp">게시판</a>
        </li>
          </ul>
        <div class="dropdown-center">
  <button class="btn btn-secondary dropdown-toggle" id="inBtn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    접속하기
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
    <li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
  </ul>
</div>
       
    </div>
  </div>
</nav>

<form name="join" method="post">
    <div class="join">
        <h2>Sign Up</h2>
        <div id="IdAndCheck">
        <input type="text" id="userId" placeholder="Enter id" name="userid" >
        </div>
        <input type="text" id="userName" placeholder="Enter your name" name="username"> <br>
        <input type="password" id="userPwd" placeholder="Enter password" name="password"> <br>
        
  		<input type="button" name="userF" class="btnradio" value="female" autocomplete="off" >

  		<input type="button"  name="userM" class="btnradio" value="male" autocomplete="off">
		
		<input type="button" name="userN" class="btnradio" value="none" autocomplete="off" >
		<br><br>
        <input id="joinBtn" type="submit" value="Join" onclick="signUp()"/>
    </div>
</form>
	
	
<script type="text/javascript"  src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

<script type="text/javascript">

 $(function() {
	 
	 
		$('input:button').click(function(){
		
			  $('input:button').removeClass("btnGroup");
			  $(this).addClass("btnGroup");
			  
			  	  
			});

 })



function signUp(){
	
  	let userIdInput = document.getElementById("userId");
    let userNameInput = document.getElementById("userName");
    let userPwdInput = document.getElementById("userPwd");
    
//     boolean idCheck = UserDao.getInstance().idCheck(userIdInput);
   	
	
    if (!(userIdInput.disabled)) {
		alert("id중복체크를 해주세요");
    	location.reload();
    } else if (userNameInput===null) {
		alert("이름을 입력하세요");
    	location.reload();
    } else if (!userPwdInput===null) {
		alert("비밀번호를 입력하세요");
    	location.reload();
    } else {
    	if(idCheck == true) {
    		alert("이미 사용중인 ID 입니다.")
    		location.reload();
    	} else {
    		
    	document.getElementsByName("join")[0].setAttribute("action","joinAction.jsp");
    	}
    	
    }
    
	
}
</script>


</body>
</html>