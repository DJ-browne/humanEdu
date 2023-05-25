<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <title>Book a book</title>
  <style type="text/css">
   h1 {
        text-align: center;
        margin-top: 50px;
        margin-bottom: 50px;
        font-size: 90px;
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
 
	
	#row {
	margin-bottom: 80px;
	}
	
    #topRow-left { 
      padding-left: 400px;  
      
     } 
   
    #searchBtn {
   	
       	
    }
    
    #tableH {
     width: 1000px;
     margin-left: 130px;
       
    }
    
   
     
    	
  </style>
</head>
<body>
  <h1>
    <span>B</span><span>o</span><span>o</span><span>k</span><span>s</span><span>.</span>
  </h1>
  <div class="row" id="row">
  <div class="col-md-7 themed-grid-col" id="topRow-left">
<!--   <form action="https://www.google.com/search" method="GET"> -->

<!--     <div class="mx-auto mt-5 search-bar input-group mb-3" > -->
      <input name="search" type="text" class="form-control rounded-pill" id="searchBar" aria-label="Recipient's username" aria-describedby="button-addon2" autofocus/>
<!--     </div> -->

<!--   </form> -->  
  </div>
		<div class="col-md-5 themed-grid-col">
		 <button type="button" class="btn btn-warning" id="searchBtn">검 색</button>
	  	</div>

</div>
  <br><br>
      <div class="table-responsive" id="tableH" style="display: none;">
        <table class="table table-striped table-sm text-center">
          <thead>
            <tr>
              <th scope="col">순번</th>
              <th scope="col">제목</th>
              <th scope="col">지은이</th>
              <th scope="col">대여상태</th>
              <th scope="col">반납일자</th>
            </tr>
          </thead>
          <tbody>
            
          </tbody>
        </table>
      </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	
	
	
	
	$('#searchBtn').click(function() {
		console.log($('#searchBar').val())
		if( $('#searchBar').val() == "") {
			alert("입력하세요")
		} else {
			$('#tableH').css('display','block')
		createTag()
			
		}
	})
	
	
	function createTag(){
		
		let tagHtml = "<tr>"+
              "<td>1</td> "+
              "<td>제목</td> "+
              "<td>지은이</td> "+
              "<td>상태</td> "+
              "<td>날짜</td> "+
            "</tr>"
		
		
		$('.table > tbody').append(tagHtml);
		
	}
	
})


</script>
</html>