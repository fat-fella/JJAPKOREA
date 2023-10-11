<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="icon" href="resources/favicon.ico">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 400px;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        form {
            margin-top: 20px;
            text-align: left;
        }

        label {
            display: inline-block;
            width: 30%;
            margin-top: 10px;
            color: #333;
            text-align: left;
        }

        input {
            display: inline-block;
            width: 60%;
            padding: 10px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        #find-password-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
        }

        #find-password-button:hover {
            background-color: #0056b3;
        }

        .center-align {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
    	<a href="index" class="logo linkLogo">
			<img src="<%=request.getContextPath()%>/resources/images/짭코리아2.png"
				alt="JJAPKOREA" class="logoimg">
		</a>
        <h1>비밀번호 찾기</h1>
        <form action="<%=request.getContextPath()%>/findPassword" method="post">
            <label for="mid" style="text-align: left;">아이디</label>
            <input type="text" id="mid" name="mid" placeholder="아이디를 입력하세요">
            <label for="pphone" style="text-align: left;">휴대폰 번호</label>
            <input type="text" id="pphone" name="pphone" placeholder="휴대폰 번호를 입력하세요">
            <div class="center-align">
                <button id="find-password-button" type="submit">비밀번호 찾기</button>
            </div>
        </form>
    </div>
</body>
</html>
