<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<style type="text/css">

#button-addon2{
    width: 100%;
    height: 100%;
    display: inline-block;
}

.input-group.mb-3{

	margin: 16px 0px;
}

</style>  
</head>
<body>
<div class="container">
	<div class="col-lg-4 mx-auto text-center pt-5">
		<h2 class="mb-5">대여관리</h2>
	</div>
	
	<div class="row mb-3 text-center mx-auto ">
      <div class="col-md-8 themed-grid-col">
      	<div class="row">
      		<div class="col-md-1 themed-grid-col"></div>
	          <div class="col-md-10 themed-grid-col">
				<div class="input-group mb-3">
				  <div class="input-group-text">
	<!-- 			    <input class="form-check-input mt-0" type="checkbox" value="" aria-label="Checkbox for following text input"> -->
						<input class="form-check-input" type="checkbox" value="" id="flexCheck1" aria-label="Checkbox for following text input">
					     <label class="form-check-label" for="flexCheck1">&nbsp;&nbsp;제 목</label>
				  </div>
				  <input type="text" class="form-control" aria-label="Text input with checkbox" disabled>
				</div>
			  </div>
	          <div class="col-md-1 themed-grid-col"></div>
        </div>
        <div class="row">
	          <div class="col-md-1 themed-grid-col"></div>
	          <div class="col-md-10 themed-grid-col">
				<div class="input-group mb-3">
				  <div class="input-group-text">
	<!-- 			    <input class="form-check-input mt-0" type="checkbox" value="" aria-label="Checkbox for following text input"> -->
						<input class="form-check-input" type="checkbox" value="" id="flexCheck2" aria-label="Checkbox for following text input">
					     <label class="form-check-label" for="flexCheck2">&nbsp;&nbsp;감 독</label>
				  </div>
				  <input type="text" class="form-control" aria-label="Text input with checkbox" disabled>
				</div>
			  </div>
	          <div class="col-md-1 themed-grid-col"></div>
        </div>
        
	  </div>
      <div class="col-md-4 themed-grid-col">
		<button class="btn btn-outline-secondary" type="button" id="button-addon2">검  색</button>
	  </div>
    </div>
    
    <div class="table-responsive">
        <table class="table table-striped table-sm text-center">
          <thead>
            <tr>
              <th scope="col">순번</th>
              <th scope="col">제목</th>
              <th scope="col">감독</th>
              <th scope="col">대여상태</th>
              <th scope="col">반납일자</th>
            </tr>
          </thead>
          <tbody>
            
          </tbody>
        </table>
      </div>
</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		let chkBtn1 = $('#flexCheck1')
		let chkBtn2 = $('#flexCheck2')
		$('#flexCheck1').click(chkDisabled);
		
		$('#flexCheck2').click(chkDisabled);
		
		$('#button-addon2').click(function(){
			if ( chkBtn1.is(':checked') || chkBtn2.is(':checked') ){
				
				alert('올바른체크');
				
				createTag();
			}else {
				
				alert('검색항목을 체크해주세요');
				
			}
		});
				
				
		function chkDisabled(){
			var thisInput = $(this).parent().next();
			
			console.log($(this));
			console.log($(this).parent());
			console.log(thisInput);
			
			if(thisInput.is(":disabled")){
				thisInput.val('test1');
				thisInput.attr("disabled",false); 
			}else{
				thisInput.val('');
				thisInput.attr("disabled",true); 
			}
		}
		
		
		function createTag(){
			
			let tagHtml = "<tr>"+
	              "<td>1</td> "+
	              "<td>제목</td> "+
	              "<td>감독</td> "+
	              "<td>날짜</td> "+
	              "<td>상태</td> "+
	            "</tr>"
			
			
			$('.table > tbody').append(tagHtml);
			
		}
	});

</script>

</html>