<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
</head>
 <body>
	<h4> 게시판 글 쓰기 </h4><br/>
	나중에 이쁘게 만드시오 <br/><br/>
	<form name='frm' method='get'>
	작성자 : <input type='text' name="writerName" ><br/><br/>
	제  목 : <input type='text' name="title" ><br/><br/>
	내  용 : <textarea rows='10' cols='40' name="content" ></textarea><br/><br/>
	패스워드(수정/삭제시 필요) :
			 <input type='password' name="password" ><br/><br/>
	<input type='button' value='작성' onclick="clickBtn()">
	<input type='reset' value='취소'>
	</form>

</body>
<script type="text/javascript">

	function clickBtn() {
		// 1. action 옵션을 만들기
		document.frm.setAttribute("action","BoardSave.jsp");
		// 2. submit 제출시키기
		document.frm.submit();
		// BoardSave.jsp 해당페이지를 호출할떄 input 태그안에 데이터를 서버에게 제출하겟다
		// 제출방식 Method : get / post
	}

</script>
</html>