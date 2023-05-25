
   /* form의 validation
      : jquery.validate.js나 jquery.validate.min.js  파일에서 확인한다. 

      - required : 필수입력
      - email : 이메일형식
      - url : 웹주소형식
      - minlength, maxlength : 글자길이
      - equalTo : 동일한지 여부

      - success 콜백함수로 label에 값과 클래스를 지정하여 추가한다.
      (*) label에 valid 클래스는 form.css에 이미 정의되어 있음
      (*) Firebug로 확인
   */

$(function() {

	$('#signup form').validate( {
		rules: {
		      name: { // id가 name인
		        required: true
		      },
		      email: {
		        required: true,
		        email: true  // @이 표시
		      },
		      website: {
		        url: true // 웹주소의 형식 .com 등등...
		      },
		      password: {
		        minlength: 6,
		        required: true
		      },
		      passconf: { // 아이디가 같냐 id password랑 같냐
		        equalTo: "#password"  
		      }
		    },

		    success: function(label) {
		      label.addClass('valid');
		      label.text('성공'); // 출력은 안되지만 이거 없으면 녹색체크가 화면에 안 뜬다
		    }
	});
	
	$('.check-all').click(function(){

		   if( $(this).is(':checked') ){
		      $('.agree').prop('checked', true);
		   }else{
		      $('.agree').prop('checked', false);
		   }
		   
		   });
	
	
	
});