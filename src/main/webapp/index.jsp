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
			background-size: cover;           
			background-repeat: no-repeat;     
			height: 100vh;                    
			display: flex;                    
			justify-content: center;          
			align-items: center;              
			position: relative;               
		}
		
		body::before {
			content: "";
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(255, 255, 255, 0.2); 
			z-index: 1; 
			pointer-events: none; 
		}
		
		.button-container {
			position: relative;
			z-index: 2; 
			text-align: center;
		}
		
		.button-container a button {
			width: 300px;          
			height: 300px;          
			margin: 20px;          
			font-size: 30px;       
			background-color: #d3e3fd; 
			color: black;          
			border: none;          
			border-radius: 8px;    
			cursor: pointer;       
			transition: all 0.3s;  
		}
		
		.button-container a button:hover {
			background-color: #45a049; 
			transform: scale(1.1);     
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