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
    		font-family: 'Roboto', sans-serif;
		}
		
		body {
			background-image: url("./img/main.jpg");
			background-size: cover;           /* 배경 이미지가 화면에 맞게 조정 */
			background-repeat: no-repeat;     /* 이미지 반복 방지 */
			height: 100vh;                    /* 화면 전체 높이 */
			display: flex;                    /* 플렉스 박스 사용 */
			justify-content: center;          /* 수평 정렬 */
			align-items: center;              /* 수직 정렬 */
			position: relative;               /* 오버레이를 위한 위치 지정 */
		}
		
		body::before {
			content: "";
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(255, 255, 255, 0.2); /* 흰색 반투명 오버레이 */
			z-index: 1; /* 배경 이미지 위에 위치 */
			pointer-events: none; /* 클릭 이벤트 방지 */
		}
		
		.button-container {
			position: relative;
			z-index: 2; /* 버튼을 오버레이 위로 가져오기 */
			text-align: center;
		}
		
		.button-container a button {
			width: 300px;          /* 버튼 너비 */
			height: 300px;          /* 버튼 높이 */
			margin: 20px;          /* 버튼 간격 */
			font-size: 30px;       /* 버튼 텍스트 크기 */
			background-color: #d3e3fd; /* 버튼 배경색 */
			color: black;          /* 버튼 텍스트 색상 */
			border: none;          /* 버튼 테두리 제거 */
			border-radius: 8px;    /* 버튼 모서리 둥글게 */
			cursor: pointer;       /* 마우스 포인터 변경 */
			transition: all 0.3s;  /* 애니메이션 효과 */
		}
		
		.button-container a button:hover {
			background-color: #45a049; /* 호버 시 색상 */
			transform: scale(1.1);     /* 호버 시 크기 확대 */
		}
		
	</style>
</head>
<body>
	<div class="button-container">
		<a href="JoinServlet" class="btn1"> <button> 회원가입 </button></a>
		<a href="LoginServlet.do"><button>로그인</button></a>
	</div>
</body>
</html>