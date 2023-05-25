<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
<!-- favicon.ico  -->
</head>
<body>

<h1>글 등록</h1>
<hr>
<!-- enctype="multipart/form-data" 얘 때문에 변환해줘야함 
	파일의 형태가 있어도 다른 애들은 원래 형태로 있게 해준다
	servlet-context.xml 에 가서 MultipartResolver beans를 추가해줘야함
 -->
<form action="saveBoard.do" method="post" enctype="multipart/form-data" >

   <table border="1" cellpadding="0" cellspacing="0">
      <tr>
         <td bgcolor="orange" width="70" >제목</td>
         <td align="left"><input type="text" name="b_title"/> </td>
      </tr>
      <tr>
         <td bgcolor="orange">작성자</td>
         <td align="left"><input type="text" name="b_name" size="10" value="${userName}" readonly="readonly"/> </td>
      </tr>
      <tr>
         <td bgcolor="orange">내용</td>
         <td align="left"><textarea cols="40" rows="10" name="b_content"></textarea></td>
      </tr>
      <tr>
         <td bgcolor="orange">이메일</td>
         <td align="left"><input type="text" name="b_email"/> </td>
      </tr>
      <tr>
         <td bgcolor="orange">비밀번호</td>
         <td align="left"><input type="text" name="b_pwd"/> </td>
      </tr>
      <tr>
         <td bgcolor="orange" width="70">파일추가</td>
         <td align="left"><input type="file" name="file" maxlength="60" size="40"/> </td>
      </tr>
      <tr>
         <td colspan="2" align="center"><input type="submit" value="새글 등록"></td>
      </tr>
   </table>
   <input type="hidden" name="b_ip" value="<%=request.getRemoteAddr() %>"/>
</form>
<hr>
<a href="getBoardList.do">글 목록 가기</a>
</body>
</html>