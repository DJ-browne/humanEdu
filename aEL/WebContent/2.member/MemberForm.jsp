<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function checkFields()
{
   var frmObj = document.frm;
   document.frm.submit();  
   // 서버에 제출
   // 제출 : action / 각 태그의 name 중요
   // action : 내가 제출할 페이지의 정보
   // -- InsertMember.jsp 을 요청하면서 제출
   // 각 태그의 name : 제출할때 함께 제출되는 데이터(입력)
   // -- id / password / name / tel / addr
} 

function isDuplicatedId()
{
   var frmObj = document.frm;
   var userId = document.frm.id.value;
   
   if( userId == null || userId == ""){
      alert( "아이디를 입력하세요." )
        frmObj.id.focus()
        return
   }

   winObj = window.open("CheckId.jsp?userId="+userId, "chkId","width=100, height=100");
}


</script>
</head>
<body>
<div data-role="content">
<h1>회원가입서 작성하기</h1>
   <form action="InsertMember.jsp" method="post" name="frm">
      <table>
         <tr>
            <td width="100">
            <font color="blue">아이디</font>
            </td>
            <td width="100">
            <input type="text" name="id">
            <input type="button" value="중복확인" onclick="isDuplicatedId()"><br/>
            </td>
         </tr>
         <tr>
            <td width="100">
            <font color="blue">비밀번호</font>
            </td>
            <td width="100">
            <input type="password" name="password"/><br/>
            </td>
         </tr>
         <tr>
            <td width="100">
            <font color="blue">비밀번호학인</font>
            </td>
            <td width="100">
            <input type="password" name="repassword"/><br/>
            </td>
         </tr>
         <tr>
            <td width="100">
            <font color="blue">이름</font>
            </td>
            <td width="100">
            <input type="text" name="name"/><br/>
            </td>
         </tr>
         <tr>
            <td width="100">
            <font color="blue">전화번호</font>
            </td>
            <td>
            <input type="text" size="15" name="tel"/>
            <br/>
            </td>
         </tr>
         <tr>
            <td width="100">
            <font color="blue">주소</font>
            </td>
            <td>
            <input type="text" size="50" name="addr"/><br/>
            </td>
         </tr>
         <tr>
            <td width="100">
             <!--로그인 버튼-->
             <input type="button" value="회원가입" onclick="checkFields()">
            </td>
            <td width="100">
            <input type="reset" name="cancel" value="취소"><br/>
            </td>
         </tr>
      </table>
   </form>
</div>
</body>
</html>