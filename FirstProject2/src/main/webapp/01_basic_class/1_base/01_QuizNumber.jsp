<%@ page import="java.util.*" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><title> Number Guess </title></head>
<body>
	<!-- HTML 주석 -->
	<%-- JSP 주석 --%>
	
	<!-- 선언부 : 변수선언, 메소드 선언 등등 할떄  -->
	<%! int answer = 0; %>
	<%! int num = 0; %>
	
	<!-- 스크립트릿 : 자바의 구현코드가 기술되는 부분 -->
	<%
		// request.getParameter
		// 페이지가 열릴때 파라미터를 가져오는 메소드
		// 주소창뒤에 메소드가 없다면 null 로 표현됩니다. >> ? 뒤에 찾는 파라미터가 없다면 null
		String guess = request.getParameter("guess");

		System.out.println("*****************");
		System.out.println(answer);
		System.out.println(num);
		System.out.println(guess);
		
		if ( guess == null ){
			System.out.println("시작");
			// random 숫자 하나 생성 > answer 저장
			answer = (int)(Math.random()*100)+1;
			// num 초기화 : 게임횟수
			num = 0;
			out.print("게임을 시작하겠습니다.");
		}else {
			System.out.println("중간");
			// answer , guess 비교
			int value = Integer.parseInt(guess);
			
			if ( answer == value ){
				// 정답처리
				out.print("정답입니다<br>");
				out.print(num+"번 만에 맞췄습니다.<br>");
				out.print("한번 더 하시겠습니까 ? <a href='01_QuizNumber.jsp' > try.Again </a> ");
			}
			else {
				// 오답처리
				out.print("오답입니다<br>");
				num++;
				// 크다 작다 비교
				if( answer > value){
					out.print("<b>UP !!</b>");
				}else{
					out.print("<b>DOWN !!</b>");
				}
			}
			
		}
	%>
	
		<p>I'm thinking of a number between 1 and 100. </p>
		<%
		/*
			form 태그 : 제출용 양식 태그
			Method 속성 : 제출시 사용하는 방법 , get / post
			Action 속성 : 제출하고 난 페이지, 없다면 제자리로 복귀 
			submit 기능 : 서버에 작성한 input태그 값을 전달
			 >> 전달방법 : input 태그의 name속성을 이용하여 키와 값의 형태로 이용
						name속성명=value값
			submit 기능 이용하는 방법 : <button태그> / <input type=submit> / js로 강제설정
			* submit 기능을 위해선 form 태그안에 작성되어야 합니다.
			
		*/
		%>
		
		<form method='get'>
				What's your guess?
				<input type='text' name='guess'>
				
				<input type='submit' value="Submit">
		</form>
	</body>
</html>
