<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/RegisterServlet.do" onsubmit="return validateForm(this);">
		아이디 : <input type="text" name="id"><br>
		패스워드 : <input type="password" name="password"><br>
		이름 : <input type="text" name="name"><br>
		주민등록번호 : <input type="text" name="rrn1"> - <input type="text" name="rrn2"><br>
		휴대번호 : <select name="phone1">
		<option value="010" selected="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
		</select> -
		<input type="text" name="phone2"> - <input type="text" name="phone3"><br>
		<input type="submit" value="회원가입" >	
	</form>
	
	 <script type="text/javascript">
	 	function validateForm(form) {
	 		if(form.id.value == "") {
	 			alert('아이디를 입력해주세요.');
	 			form.id.focus();
	 			return false;
	 		}
	 		if(form.password.value == "") {
	 			alert('비밀번호를 입력해주세요.');
	 			form.password.focus();
	 			return false;
	 		}
	 		if(form.name.value == "") {
	 			alert('이름을 입력해주세요.');
	 			form.name.focus();
	 			return false;
	 		}
	 		if(form.rrn1.value == "" || form.rrn2.value == "") {
	 			alert('주민등록번호를 입력해주세요.');
	 			form.rrn1.focus();
	 			return false;
	 		}
	 		if(form.phone1.value == "" || form.phone2.value == "" || form.phone3.value == "") {
	 			alert('휴대번호를 입력해주세요.');
	 			form.phone1.focus();
	 			return false;
	 		}return true;
	 	}
	 </script>
</body>
</html>