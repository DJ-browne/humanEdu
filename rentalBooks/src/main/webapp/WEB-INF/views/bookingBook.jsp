<%@page import="oracle.net.aso.c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter"%>
    
    <%
    String bookid = request.getParameter("bookid");
    String booktitle = request.getParameter("booktitle");
    String bookauthor = request.getParameter("bookauthor");
    System.out.println(bookid);
    System.out.println(booktitle);
    System.out.println(bookauthor);
    
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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <title>Book a book</title>
  <style type="text/css">
body {
    background: #3d516b;
   
}

form {
    width: 320px;
    padding: 10px 25px 80px;
    margin: 50px auto;
    background: #f8d348;
    display: flex;
    flex-direction: column;
    font-family: Fantasy;
}

input {
    font-size: 13px;
    border: 0;
    outline: 0;
    border-radius: 5px;
    padding: 5px 26px;
}


span {
font-weight: bold;

}
 h1 {
        text-align: center;
        margin-top: 160px;
        font-size: 70px;
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
        color:#fbbc05;
    }
    h1 span:nth-child(8) {
        color:#4285f4;
    }
    h1 span:nth-child(9) {
        color:#34a853;
    }
    h1 span:nth-child(10) {
        color:#ea4335;
    }
    h1 span:nth-child(11) {
        color: #fbbc05;
    }
    
 #hello {
 margin: 60px 0px; 
 }
 h2 {
        text-align: center;
        font-weight: bolder;
    }
	h2 span {
	padding-right: 8px; 
	}	
        
    h2 span:nth-child(1) {
        color:#4285f4;
    }
    h2 span:nth-child(2) {
        color:#ea4335;
    }
    h2 span:nth-child(3) {
        color:#fbbc05;
    }
    h2 span:nth-child(4) {
        color:#4285f4;
    }
    h2 span:nth-child(5) {
        color:#34a853;
    }
    h2 span:nth-child(6) {
        color:#ea4335;
    }
    h2 span:nth-child(7) {
        color:#4285f4;
    }
	
	#row {
	margin-bottom: 80px;
	}
	
    #topRow-left { 
      padding-left: 400px;  
      
     } 
   
    #tableid tr, #tableid th {
     border: 0;
     text-align: left;
  	 vertical-align : middle;
  	 margin: 10px 0px; 
 	}
 	
 	thead {
 	height: 130px;
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

 <%
    	if (id != null) {
    	
    %>
  <div id="hello">
  <h2>
    <span>👋</span><span>H</span><span>e</span><span>l</span><span>l</span><span>o</span><span><%=name %></span><span>👋</span>
  </h2>
	</div>

	<form action="reservation" method="post" id="frm">
        <div id="imgTop" style="margin: 30px 0px;" >
        <img src="resources/img/cookie.png" style="width: 255px; margin-left: 15px;">
        </div>
        
        <div>
             
        
        <table class="table table-striped table-sm text-center" style="border: none;" id="tableid">
          <thead>
          <tr><span id="spanTop">회원 정보 입력</span></tr>
            <tr id="tabletr">
              <th scope="col"><span>이름</span></th>
              <th scope="col"><input type="text" name=bookingName  id=bookingName value="<%=name%>"></th>      
            </tr>
             <tr id="tabletr">
              <th scope="col"><span>전화번호</span></th>
              <th scope="col"><input type="tel" name="bookingTel" id=bookingTel placeholder="전화번호"></th>
            </tr>
             <tr id="tabletr">
              <th scope="col"><span>대여기간</span></th>
              <th scope="col"><span><input type="date" name="rentalDue" id="rentaldate" placeholder="대여기간"></span></th>
            </tr>
             <tr id="tabletr">
            	<th><p style="font-size: 12px; padding-left: 2px;"  id="rentalPeriod"></p></th>
            	<th><p style="font-size: 12px;"  id="rentalPeriod2"></p></th>
            	<input type="hidden" name="rentalPeriod" id="rentalPeriod3">
            </tr>
                    
          </thead>         	
           </table>
                      
         <table class="table table-striped table-sm text-center" id="tableid">
 		  <thead>     
 		  <tr><span id="spanBot">대여 기본 입력</span></tr>   
            <tr id="tabletr">
    			
             <input type="hidden" id="hiddenbookid" name="bookid" value="<%=bookid%>">
              <th scope="col"><span>제목</span></th>
              <th scope="col"><input type="text" name=booktitle id=booktitle value="<%=booktitle%>" readonly ></th>      
            </tr>
             <tr id="tabletr">
              <th scope="col"><span>감독</span></th>
              <th scope="col"><input type="text" name=bookauthor id=bookauthor value="<%=bookauthor%>" readonly></th>
            </tr>
             <tr id="tabletr">
              <th scope="col"><span>신청일자</span></th>
              <th scope="col"><input type="date" id="currentDate" readonly></th>
            </tr>
          	  </thead>         	
           </table>
        	  
		</div>
         
	<button type="button" style="margin-top: 20px;" class="btn btn-outline-danger" onclick="book()">BOOK a BOOK</button>
   
	</form>

<% } else { %>
	<h1>
    <span>L</span><span>o</span><span>g</span><span>i</span><span style="margin-right: 20px;">n</span><span>n</span><span>e</span><span>e</span><span>d</span><span>e</span><span>d</span><span>✍</span>
  </h1>

<%} %>


</body>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	
	window.onload = function() {
		
				
	
	$(function() {
		
		var today = new Date().toISOString().slice(0, 10);
		var maxDate = new Date();
		maxDate.setDate(maxDate.getDate() + 14);
		maxDate = maxDate.toISOString().substr(0, 10);
		$('#currentDate').val(today); // 오늘 날짜를 신청일자로 주기
		
		  // Set the minimum date to today's date
		  $('#rentaldate').attr('min', today).attr('max', maxDate);

		 		
		  // Add an onchange event listener to check the selected date
		  $('#rentaldate').on('change', function() {
		    var selectedDate = new Date($(this).val());
		    if (selectedDate < new Date(today)) {
		      $(this).val(today);
		    } else if (selectedDate > new Date(maxDate)){
		    	 $(this).val(maxDate);
		    }
		    
		    calculatePeriod()
		  });
				
		});
	}
	
	function calculatePeriod() {
		// Get the selected start and end dates
		var startDate = document.getElementById("currentDate").value;
		var endDate = document.getElementById("rentaldate").value;
		
		// Convert the dates to ISO format
		startDate = new Date(startDate).toISOString().slice(0, 10);
		endDate = new Date(endDate).toISOString().slice(0, 10);
		
		// Calculate the period between the two dates
		var diff = (new Date(endDate)) - (new Date(startDate));
		var days = diff / (1000 * 60 * 60 * 24);
		
		// Disable end date input if period is more than 14 days
		if (days > 14) {
			document.getElementById("rentalPeriod").disabled = true;
			document.getElementById("rentalPeriod2").disabled = true;
						
		} else {
			document.getElementById("rentalPeriod").disabled = false;
			document.getElementById("rentalPeriod2").disabled = false;
			
			// Display the result
			document.getElementById("rentalPeriod").innerHTML = "대여 기간  : ";
			document.getElementById("rentalPeriod2").innerHTML = " "+ days + " 일";
			document.getElementById("rentalPeriod3").setAttribute("value", days);	
		}
		
	}

	function book(){
		
	    let hiddenbookid = document.getElementById("hiddenbookid").value;
	    let bookingName = document.getElementById("bookingName").value;
	    let bookingTel = document.getElementById("bookingTel").value;
	    let rentalDue = document.getElementById("rentaldate").value;
	    let rentalPeriod = document.getElementById("rentalPeriod3").value;
	    let booktitle = document.getElementById("booktitle").value;
	    let bookauthor = document.getElementById("bookauthor").value;
	    
	    console.log(hiddenbookid)
	    console.log(bookingName)
	    console.log(bookingTel)
	    console.log(rentalDue)
	    console.log(rentalPeriod)
	    console.log(booktitle)
	    console.log(bookauthor)
	    
		if (bookingName == "" || bookingTel == "" || rentalDue == "") {
				alert("Please fill in all fields");
	    } else {
	    		$.ajax({
				
				url : "bookingAction",
				data : {
						
					 "bookid" : hiddenbookid,
					 "bookingName" : bookingName,
					 "bookingTel" : bookingTel,
					 "rentalDue" : rentalDue,
					 "rentalPeriod" : rentalPeriod,
					 "booktitle" : booktitle,
					 "bookauthor" : bookauthor
										
				},
				type : 'post',
				success : function(data){
					console.log(data)
										
					location.href='main';
					   				
						
					
				},
				error : function(err){
					console.log(err);
				}
			});
	    	
	    } // else
	   		
		 

	    	} // sign up
	    
</script>
</html>