<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Arial', sans-serif;
    }

    body {
    	background-image: url("./img/main.jpg");
        background-color: #f4f4f4;
        display: flex;
        justify-content: center; /* 수평 중앙 정렬 */
        align-items: center;    /* 수직 중앙 정렬 */
        height: 100vh;          /* 화면 전체 높이 */
    }

    .form-container {
        background: white;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        width: 400px;
    }

    .form-container h1 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    .form-container label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
    }

    .form-container input[type="text"],
    .form-container input[type="password"],
    .form-container select {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
    }

    .form-container input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .form-container input[type="submit"]:hover {
        background-color: #45a049;
    }

    .form-container small {
        display: block;
        margin-top: 10px;
        color: red;
        text-align: center;
    }
</style>
</head>
<body>

	<div class="form-container">
        <h1>회원가입</h1>
        <form method="post" action="${pageContext.request.contextPath}/JoinServlet" onsubmit="return validateForm(this);">
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" placeholder="아이디를 입력하세요">

            <label for="password">패스워드:</label>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">

            <label for="name">이름:</label>
            <input type="text" id="name" name="name" placeholder="이름을 입력하세요">

            <label for="rrn1">주민등록번호:</label>
            <div style="display: flex; gap: 10px;">
                <input type="text" id="rrn1" name="rrn1" placeholder="앞자리">
                <span style="align-self: center;">-</span>
                <input type="text" id="rrn2" name="rrn2" placeholder="뒷자리">
            </div>

            <label for="phone1">휴대번호:</label>
            <div style="display: flex; gap: 10px;">
                <select id="phone1" name="phone1">
                    <option value="010" selected="selected">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                </select>
                <input type="text" id="phone2" name="phone2" placeholder="중간번호">
                <input type="text" id="phone3" name="phone3" placeholder="마지막번호">
            </div>

            <input type="submit" value="회원가입">
        </form>
        <small id="error-message"></small>
    </div>
	
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
	 	if (request.getAttribute("successMessage") != null) {
	 		alert("<%= request.getAttribute("successMessage") %>");
	 	}
	 </script>
</body>
</html>