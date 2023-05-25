$(function(){
	// 사용자의 자료 입력여부를 검사하는 함수
	$('#confirm').click(function(){
    	if( $.trim($("#userId").val()) == '' ){
            alert("아이디를 입력해 주세요.");
            $("#userId").focus();
            return;
        }
    	
    	if($.trim($('#userPass').val())==''){
    		alert("비번입력해주세요.");
    		$('#userPass').focus();
    		return;
    	}
    	
    	if($.trim($('#userPass').val()) != $.trim($('#userPass2').val())){
    		alert("비밀번호가 일치하지 않습니다..");
    		$('#userPass2').focus();
    		return;
    	}
    	
    	
    	if($.trim($('#userName').val())==''){
    		alert("이름입력해주세요.");
    		$('#userName').foucs();
    		return;
    	}
       
        // 자료를 전송합니다.
        document.userinput.submit();
	});
	
	//아이디 중복체크
	// id가 userId인 태그에서 키보드가 올라갈때
	$('#userId').keyup(function(){
		
		// 화면상에서 사용자가 입력한 값을"가지고" DB에 가서 select문을 통해 결과를 화면에 공유
		var id = $('#userId').val() // 화면상에서 사용자가 입력한 값
//        console.log("id: "+id)
        // 언제? 키보드가 올라갈때마다
       
        // 비동기 통신(ajax 통해서) : 요청에 대한 응답을 데이터로 받는다 
        // MVC패턴 이니까 요청할 페이지이름이 .do일것
        $.ajax({
        	type: 'post',
        	url: 'idCheck.do',     // action > controller 맵핑이 존재해야함
        	data: {'userId' : id},   // 맵핑된 controller의 메소드의 파라미터와 규칙을 정의
        	contentType : 'application/x-www-form-urlencoded;charset=UTF-8', // contentType : 전송데이터의 형태
        	dataType:'text',
        	success: function(resultData) {
        		// controller에서 리턴된 것을 resultData로 받는다
//        		console.log("resultData: "+resultData)
        		$('#idCheckResult').html(resultData);
        		// 보여줄 화면에 id가 idCheckResult인 애의 innerHTML로 넣기 
				
			},
        	error: function(err) {
				console.log("err: "+err)
			}
        
        })
        
        // contentType : url로 요청할때의 데이터 형태 
        // dataType : 요청이 완료되고 성공시 응답할때 받아오는 데이터 형식
        
        
	})
})
	
	
	
	
	
	
	
	
	