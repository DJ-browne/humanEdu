<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>
<style type="text/css">
#inBtn {
background-color: #888;
}

body {
    background-color: #888;
    background-image: linear-gradient(45deg, #444 25%, transparent 25%, transparent 75%, #444 75%, #444), linear-gradient(45deg, #444 25%, transparent 25%, transparent 75%, #444 75%, #444);
    background-position: 0 0, 25px 25px;
    background-size: 50px 50px;
}

.wrapper {
    text-align: center;
    margin:auto;
    margin-top:130px;
    width: 420px;
    height: 450px;
    border:solid 3px;
    border-radius: 10%;
    background-color: #EEEFF1;
}
h1 {
    margin-top: 65px;
    font-size: 50px;
}


input {
    text-align: left;
    width:225px;
    height:30px;
    border: none;
    border-bottom: solid 3px black;
    background: background-color: #EEEFF1;;
}

input::placeholder {
    color: black;
    font-size: 10px;
}


.userid {
    padding-top: 19px;
}

img {
    width: 20px;
    height: 20px;
}

.password {
    padding-bottom: 32px;
    padding-top: 22px;
}

.button {
    width: 225px;
    height: 50px;
    border-radius: 10%;
    font-size: 18px;
    font-weight: bold;
    border-radius: 10%;
    background: white;
    
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

<div class="wrapper">
<form method="post" action="loginAction.jsp">
            <h1>Log In</h1>
            <div class="userid">
<!--                 <img src="./img/test.png"> -->
                <input type="text" id="userid" name="userid" placeholder="ID"><br>
            </div>
            <div class="password">
<!--                 <img src="./img/test.png"> -->
                <input type="password" id="password" name="password" placeholder="Password"><br><br>
            </div>
            <div class="div_button">
                <button class="button" value="login" type="submit">Log In</button>
            </div>
            
            </form>
        </div>
	
	
<script type="text/javascript"  src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>