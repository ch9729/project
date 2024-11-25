<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 추가</title>
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
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        width: 400px;
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .form-container h1 {
        text-align: center;
        font-size: 24px;
        color: #333;
        margin-bottom: 20px;
    }

    .form-container label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #555;
    }

    .form-container input[type="text"],
    .form-container input[type="number"],
    .form-container textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 14px;
    }

    .form-container input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .form-container input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="form-container">
        <h1>책 추가</h1>
        
        <form method="post" action="${pageContext.request.contextPath}/addBook">
            <label for="bname">책 이름</label>
            <input type="text" id="bname" name="bname" placeholder="책 이름을 입력해주세요." required>

            <label for="bdetail">책 내용</label>
            <textarea id="bdetail" name="bdetail" rows="4" placeholder="내용을 입력해주세요." required></textarea>

            <label for="age">연령</label>
            <input type="number" id="age" name="age" placeholder="연령을 적어주세요." required>

            <input type="submit" value="저장">
        </form>
    </div>
</body>
</html>
