<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	char[] buff = new char[1024];

	int len = -1;
	// FileReader : 실제파일을 불러오는 클래스
	// New FileReader("파일경로");
	// 상대경로 설정
// 	FileReader fr = new FileReader("07_file.txt");
	
	// 절대경로 설정
	FileReader fr = new FileReader("C:\\Users\\human\\Desktop\\WebEclipse\\FirstProject\\src\\main\\webapp\\01_basic_class\\3_objects\\07_file.txt");

	while ( ( len=fr.read(buff) ) != -1 ){
		out.print( new String ( buff, 0 , len ));
	}
	fr.close();

%>

</body>
</html>

<!-- 

	경로 : 코딩 상에서는 마우스로 파일을 탐색할 수 없습니다.
			>> 경로를 선택할수없어요.
			>> 하나의 문자열로 내가 원하는 파일 위치를 작성해야합니다.

		현재 작업공간(실행중인파일)에서 다른 파일을 참고하거나 불러올때
		지정하는 경로 선언 방식
		* 컴퓨터를 사용하려면 필수적으로 알아야하는 정보
		
		Windows : GUI 환경 
		> Graphical User Interface : 마우스로 제어하는것이 특징
		
		명령프롬프트, Linux, Dos : CLI 환경
		> Command Line Interface : 명령어를 통해서 제어(키보드)


		img 태그나 style 옵션 Filereader등등 .. 코딩중에 파일을 탐색해야하는 경우
		>> 마우스로 제어가 불가능하기때문에 명령어를 통해서 제어
		>> CLI 환경 처럼 명령어로 제어를 해야합니다.
		
		경로를 작성하여서 필요한 파일을 호출하는 방법을 이용
		
		호출 방법 2가지 있습니다.
		
		1. 절대경로
		- 절대적 : 변함이 없는것 
		- 항상 최정상 폴더에서 출발하는 경로
		
		2. 상대경로
		- 상대적 : 변함이 있는것 
		- 내 위치에서부터 출발하는 경로
	
			
		1. 07_file.txt 를 찾기
		2. 최정상을 01_basic_class 파일로 생각해보자
		3. 실행위치는 07_file.jsp 파일로 생각해보자
		절대경로 : 01_basic_class 안에 3_objects 안에 07_file.txt 
		상대경로 : 07_file.jsp 와 같은 공간에 있는 07_file.txt 
		

		1. dokdo.jpg 를 찾기
		2. 최정상을 01_basic_class 파일로 생각해보자
		3. 실행위치는 07_file.jsp 파일로 생각해보자
		절대경로 : 01_basic_class 안에 3_objects 안에 imgs 안에 dokdo.jpg 
		상대경로 : 07_file.jsp 와 같은 공간에 있는 imgs 안에 dokdo.jpg


		경로를 설정할떄 사용하는 문자 2개
		
		/ : 2가지 역할
			1. 경로간의 구분자
				이름과 이름 사이의 구분자
				( 현재폴더/하위폴더, 현재폴더/현재파일 )
				* 구분자 : /, \, \\ 으로 사용
				> img/src/java/1.jpg
				현재폴더 안에 img 폴더가 있고
				img 폴더 안에 src 폴더가 있고
				src 폴더 안에 java 폴더가 있고
				java 폴더 안에 1.jpg 이미지 파일을 선택
				
			2. 경로 작성시 맨앞에 작성이 된다면 "루트" 라는 의미를 가짐
				루트 : 최상위폴더를 표현하는 단어, 절대경로를 설정할떄 사용
				> /img/src/java/1.jpg
				최상위폴더 안에 img 폴더가 있고
				img 폴더 안에 src 폴더가 있고
				src 폴더 안에 java 폴더가 있고
				java 폴더 안에 1.jpg 이미지 파일을 선택
		
		. : 폴더를 의미 :  . 1개일때 : 현재폴더를 의미
						.. 2개일때 : 상위폴더를 의미
		

 -->