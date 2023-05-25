<%@page import="com.human.web.domain.UserVO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.human.web.*" %>
<%@page import="java.util.List" %>
    <!-- 배열과 같이 사용하는 반복문 활용 : JSTL -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 1. 기존 모양 (자바라 getter setter)
<%--     	<%List<userVO> blist = (List<userVO>)request.getAttribute("bList"); --%>
    	                   >> object니까 형변환해야한다
    	for(int i=0; i <bList.size(); i++) {%>
    	html코드를 여기에씀
<%--     	<%=bList.get(i).getBooktitle()%> --%>
<%--     	<%}%> --%>
    	 2. EL & JSTL 모양
    	 <c:forEach items="${bList}" var="book"></c:forEach>
    	 
     -->
     
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
        margin-bottom: 50px;
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
        color:#ea4335;
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
	margin-bottom: 25px;
	}
	
	#topSelect{
		width: 100px;
		margin-left: 330px; 
	}
	
    #topRow-left { 
      
      width: 380px;  
      
     } 
   
    
    #tableH {
     width: 1000px;
     margin-left: 130px;
       
    }
    
    #tableid, #tabletr td, #tabletr th{
	text-align: center;
  	vertical-align : middle;
	}
	#dropD {
		font-size: 14px;
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
    <span>B</span><span>o</span><span>o</span><span>k</span><span>s</span><span>.</span>
  </h1>
  <form action="getBookList" method="get" id="frm">
  
  <div class="row" id="row">
  <div class="col-auto" >
   <select class="form-select" name="topSelect" id="topSelect" aria-label="Default select example">
	  <option selected>찾기</option>
	  <option value="booktitle">책제목</option>
	  <option value="bookauthor">지은이</option>
	</select>
</div>
  <div class="col-auto" id="topRow-left">
      <input name="bookSearch" id="searchBar" type="text" class="form-control rounded-pill"  aria-label="Recipient's username" aria-describedby="button-addon2" autofocus/>
  </div>
		<div class="col-auto">
<!-- 		 <button type="button" class="btn btn-warning" id="searchBtn">검 색</button> -->
		 <button type="button" class="btn btn-warning" id="searchBtn2">검 색(ajax)</button>
 	</div>

</div>
</form>
  <br><br>
<!--    <form action="bookingBook" method="get" id="frm"> -->
  <c:choose>
  <c:when test="${ empty list }">
      <div class="table-responsive" id="tableH" style="display: none;" >

	        <table class="table table-striped table-sm text-center" id="tableid">
	          <thead>
	            <tr id="tableid">
	              <th scope="col">순번</th>
	              <th scope="col">제목</th>
	              <th scope="col">지은이</th>
	              <th scope="col">대여가능상태</th>
	           	  <th scope="col">반납예정일</th>
              	  <th scope="col">대여가능여부</th>
	            </tr>
	          </thead>
	           </table>
      </div>
   </c:when>
   <c:when test="${ not empty list }">
          	<div class="table-responsive" id="tableH" >
        <table class="table table-striped table-sm text-center" id="tableid">
          <thead>
            <tr id="tabletr">
              <th scope="col">순번</th>
              <th scope="col">제목</th>
              <th scope="col">지은이</th>
              <th scope="col">대여가능상태</th>
              <th scope="col">반납예정일</th>
              <th scope="col">대여가능여부</th>
              
            </tr>
          </thead>         	
         
 		  <tbody id="test">
         
    		<c:forEach items="${list}" var="book">
    		<c:if test="${book.bookstatement eq 'N'}">
            <tr id="tabletr">
                <td scope="col">${book.bookid}</td>
              <td scope="col">${book.booktitle}</td>
              <td scope="col">${book.bookauthor}</td>
              <td scope="col">${book.bookstatement}</td>
              <td scope="col">${book.bookdate}</td>
              <td scope="col"><button type="button" class="btn btn-success" disabled>대여불가</button></th>
            </tr>
            </c:if>
            
            <c:if test="${book.bookstatement eq 'Y'}">
            <tr id="tabletr">
              <td scope="col">${book.bookid}</td>
              <td scope="col">${book.booktitle}</td>
              <td scope="col">${book.bookauthor}</td>
              <td scope="col">${book.bookstatement}</td>
              <td scope="col"></th>
<%--               <td><input type="hidden" id="idHidden" name="idHidden" value="${book.bookid}"></td> --%>
<%--               <td><input type="hidden" id="titleHidden" name="titleHidden" value="${book.booktitle}"></td> --%>
<%--               <td><input type="hidden" id="authorHidden" name="authorHidden" value="${book.bookauthor}"></td> --%>
              <td scope="col"><button type="button" id="booking" class="btn btn-outline-success booking">대여가능</button></td>
            </tr>
            </c:if>
           </c:forEach> 
        	  
          	   </tbody>
           </table>
     	 </div>
  	  	</c:when>
     </c:choose>
<!--      	</form>  	 -->
  <form action="bookingBook" method="get" id="frm1">
    <input type="hidden" id="hiddenId" name="bookid" value="">
    <input type="hidden" id="hiddenTitle" name="booktitle" value="">
    <input type="hidden" id="hiddenAuthor" name="bookauthor" value="">
         
  </form>  	

</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	$.ajax({
		url: "getAllList",
		type : "get",
		dataType: "json",
		success : function(data){
			
			var bookList = data.bookList;

			
				
				$('#tableH').show();

				let htmlTag ='';
				
				for( let idx in bookList) {
					
					htmlTag +='<tr id="tabletr">' +
		              '<td scope="col">'+bookList[idx].bookid+'</td>' +
		              '<td scope="col">'+bookList[idx].booktitle+'</td>' +
		              '<td scope="col">'+bookList[idx].bookauthor+'</td>' +
		              '<th scope="col">'+bookList[idx].bookstatement+'</th>'+
		              '<input type="hidden">'+bookList[idx].rentalDue           
		              
		              if (bookList[idx].rentalDue == null) {
		            	  htmlTag += '<td scope="col"></td>'
		              } else {
		            	  
		            	  htmlTag += '<td scope="col">'+bookList[idx].rentalDue+'</td>'
		            	  
		              }
		              
		              
		              if( bookList[idx].bookstatement == 'N' ){
		            	  htmlTag += '<td scope="col"><button type="button" class="btn btn-success" disabled>대여불가</button></td></tr>'    	  
		              }else {
		            	  htmlTag +=  '<td scope="col"><button type="button" id="booking" class="btn btn-outline-success booking">대여가능</button></th></tr>'
// 		            	  	'<td><input type="hidden" id="hiddenId" name="bookid" value="'+bookList[idx].bookid+'"></td>'+
// 		            	 	'<td><input type="hidden" id="hiddenTitle" name="booktitle" value="'+bookList[idx].booktitle+'"></td>'+
// 	              			'<td><input type="hidden" id="hiddenAuthor" name="bookauthor" value="'+bookList[idx].bookauthor+'"></td></tr>'
		              }	            	  
					
				}
								
				
				
				// thead 다음을 지우고
	            $('#tableid > thead').next().remove();
				// 지운후 thead 다음에 넣는다
	            $('#tableid > thead').after( "<tbody>" +htmlTag +"</tbody>");
	            
			
			
				
			
		},
		error : function(err){
			console.log(err);
		}				
		
	}) //ajax
})




$(function() {
		
	
	$('#searchBtn').click(function() {
		console.log($('#topSelect').find('option:selected').val());
		
		if( $('#searchBar').val() == "") {
			alert("검색어를 입력하세요.")
		} else if ($('#topSelect').find('option:selected').val() == "찾기"){
			alert("검색 카테고리를 고르세요.")
		}else {
			createTag()
		}
	})
		
	
	
})
	
	function createTag(){
		
		
		// 클릭이 되었을때 할 행동
		// 검색어 준비
		// 검색어를 통해서 대상들을 검색
		// -- 대상 : 데이터베이서(우리 서버에 있는 공공 데이터)
		// -- 대상과 연결을 돕는 언어 : JAVA + Spring(MVC패턴)
		// 결과를 화면에 출력
		
		// 검색어  준비(추가할부분 체크가 되었을때)
// 		let search1 = $('#search').val(); // -> 제이쿼리
// 		let search2 = document.getElementById('search').value; //-> js

		// 자바라는 언어 : DB와 연결을 돕는 언어이며 파일일 뿐이다
		// DB라는 공간에 있는 데이터를 탐색, 추가, 수정, 삭제....
		// DB 탐색 : SELECT 영화제목, 지은이, 상태, 일자 FROM 테이블명
		// 위 쿼리를 실행하기위에 java를 이용해서 db에 연결
		// java를 효율적이로 코딩하기 위해 필요한 구조가 mvc 디자인 패턴
		// M odel : 자바를 이용해서 db에 연결하는 과정에 대한 파일들, 로직
		// V iew : jsp, html, cssm js등 화면에 출력하고자 하는 파일, 페이지
		// C ontroller : 화면과 로직에 대해서 연결해주는 파일, 연결점
		
		// 화면에서 로직을 사용하기위해서는 연결점이 되는 곳을 호출
		// 호출 > 요청, 제출, 정해놓은 키워드 > Controller에 있는 Mapping
		// 요청하는 방법 :
		// 1. a태그를 이용한 href 링크
		// 2. submit() 기능을 활용한 form태그의 action 경로
		// 3. 자바스크립트를 이용한 코딩
		//	- location.href = ''; 요청
		//	- 태그에 대한 코딩으로 요청(*)
		$('#frm').submit();
		
// 		document.getElementById('frm').submit();
		// 코딩을 통한 2번 기능을 활성화
		// 요청할이름 : getBookList
		// 요청방법 : form 태그의 action 경로로 submit() 기능 구현
		
		// 호출된 포인트에서 아래 작업을 해야한다
		// 검색어를 통해서 대상들을 검색
		// -- 대상 : 데이터베이스( 우리 서버에 있는 공공 데이터)
		// -- 대상과 연결을 돕는 언어 : java + Spring(mvc패턴)
	}
	



    // ajax 사용하기 위한 부분
	$(function() {
		$('#searchBtn2').click(function() {
			
			if( $('#searchBar').val() == "") {
				alert("검색어를 입력하세요.")
			} else if ($('#topSelect').find('option:selected').val() == "찾기"){
				alert("검색 카테고리를 고르세요.")
			}else {
				
			
			// ajax주요 키(옵션)
			// 1. url : form 태그에 있던 action과 같은 기능 > controller에 있는 맵핑명
			// 2. data : 요청과 함께 서버에 보낼 문자열, JSON객체
			// 3. type : 전송할방법, *post or get
			// 4. success : 요청이 성공되면 실행되는 함수 (callback), function() {}
			// 5. dataType : 서버에서 받아온 데이터의 형식(자료형) 
			// 6. error : 요청이 실패되면 실행되는 함수 (callback), function() {}
			
			// JS를 이용해서 채워주기!!(*) null 중요하다 > java에서 실제로 null인지
			console.log($('#topSelect').find('option:selected').val())
			console.log($('#searchBar').val())
			let select = $('#topSelect').find('option:selected').val()
			let search = $('#searchBar').val()
			let inputData= {topSelect : select, bookSearch : search}
			
			// inputData 형태가 JSON 형태
			// json = {"키" : "값", "키" : "값", "키" : "값"..... "키" : "값"}
// 			let inputData= {topSearch : select, bookSearch : search}
// 			let inputData= {topSearch : select}
			// 중요(*) : 사용자가 입력한 값으로 데이터베이스에서 올바른 값을 조회하는 것이 목표
			// >>>> 제목:아바타 >> 검색을 하면 제목을 통해서 검색이 이뤄져야함
			
			
			// 작은 form태그 > 실행이 되면 나오는 결과를 success로 표현
			$.ajax({
				url: "ajax",
				data : inputData,
				type : "post",
				dataType: "json",
				success : function(data){
					
					var jsonList = data.jsonList;
					console.log(data);
					console.log(jsonList);
					console.log(jsonList.length);
					
					if ( jsonList.length == 0) {
						let sorryTag = '<h3>'+
									   '<span>Sorry</span><span>,</span><span>no</span><span>books</span><span>found</span><span>😥</span>'+
									   '</h3>'+
									   '<button type="button" class="btn btn-warning" id="goback" style="margin-top:40px; width: 70px; margin-left: 600px;">BACK</button>';
							
						$('#row').html(sorryTag);
						 
						document.querySelector('#goback').addEventListener('click', function(event) {
							  event.preventDefault(); // prevent default behavior of the link or button
							  window.location.href='searchBook'; // go back to the previous page
																	  
							  
							  
							});
						
					}else {
						
						$('#tableH').show();

						let htmlTag ='';
						
						for( let idx in jsonList) {
							
							htmlTag +='<tr id="tabletr">' +
				              '<td scope="col">'+jsonList[idx].bookid+'</td>' +
				              '<td scope="col">'+jsonList[idx].booktitle+'</td>' +
				              '<td scope="col">'+jsonList[idx].bookauthor+'</td>' +
				              '<th scope="col">'+jsonList[idx].bookstatement+'</th>' +
				              '<td scope="col"></td>'
				              
				              if( jsonList[idx].bookstatement == 'N' ){
				            	  htmlTag += '<td scope="col"><button type="button" class="btn btn-success" disabled>대여불가</button></td></tr>'    	  
				              }else {
			            	  htmlTag +=  '<td scope="col"><button type="submit" id="booking" class="btn btn-outline-success booking">대여가능</button></th></tr>'
// 			            	  	'<td><input type="hidden" id="hiddenId" name="bookid" value="'+jsonList[idx].bookid+'"></td>'+
// 			            	  	'<td><input type="hidden" id="hiddenTitle" name="booktitle" value="'+jsonList[idx].booktitle+'"></td>'+
// 	              				'<td><input type="hidden" id="hiddenAuthor" name="bookauthor" value="'+jsonList[idx].bookauthor+'"></td></tr>'
				              }	            	  
							
						}
										
						
						
						// thead 다음을 지우고
			            $('#tableid > thead').next().remove();
						// 지운후 thead 다음에 넣는다
			            $('#tableid > thead').after( "<tbody>" +htmlTag +"</tbody>");
			            
					}
					
						
					
				},
				error : function(err){
					console.log(err);
				}				
				
			}) //ajax
			
		}
						
		})// click
		
		
		$('#tableH').on('click','.booking', function(){
			
			console.log($(this).parent().parent().find('td')[0].innerHTML );
			console.log($(this).parent().parent().find('td')[1].innerHTML );
			console.log($(this).parent().parent().find('td')[2].innerHTML );
			$('#hiddenId').val($(this).parent().parent().find('td')[0].innerHTML)
			$('#hiddenTitle').val($(this).parent().parent().find('td')[1].innerHTML)
			$('#hiddenAuthor').val($(this).parent().parent().find('td')[2].innerHTML)
			
			
			$('#frm1').submit();
		});

		
		
	}) // function		




</script>
</html>
