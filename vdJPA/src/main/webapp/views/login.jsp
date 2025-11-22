<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #6B5BFF, #7A8AFE);
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .container {
        width: 900px;
        background: white;
        border-radius: 28px;
        box-shadow: 0px 20px 40px rgba(0,0,0,0.15);
        display: flex;
        overflow: hidden;
    }

    /* Left Banner */
    .left-box {
        width: 50%;
        padding: 50px;
        color: white;
        background: linear-gradient(135deg, #6B5BFF, #7A8AFE);
    }

    .left-box h1 {
        font-size: 48px;
        margin-bottom: 10px;
    }

    .left-box p {
        opacity: .9;
        font-size: 15px;
        margin-top: 20px;
    }

    /* Right Login Box */
    .right-box {
        width: 50%;
        padding: 50px;
    }

    .right-box h2 {
        font-size: 26px;
        margin-bottom: 10px;
    }

    input {
        width: 100%;
        padding: 14px;
        border-radius: 12px;
        border: 1px solid #ccc;
        outline: none;
        margin-top: 15px;
        font-size: 15px;
    }

    .btn-login {
        width: 100%;
        padding: 14px;
        margin-top: 25px;
        background: #6B5BFF;
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 18px;
        cursor: pointer;
        transition: 0.2s;
    }

    .btn-login:hover {
        background: #5948e8;
    }

    .forgot {
        display: block;
        text-align: right;
        margin-top: 8px;
        font-size: 14px;
        color: #6B5BFF;
        text-decoration: none;
    }

    .or-line {
        margin: 25px 0;
        text-align: center;
        color: gray;
        position: relative;
    }

    .or-line:before,
    .or-line:after {
        content: "";
        width: 40%;
        height: 1px;
        background: #ddd;
        position: absolute;
        top: 50%;
    }

    .or-line:before {
        left: 0;
    }

    .or-line:after {
        right: 0;
    }

    .social-btn {
        width: 48%;
        padding: 12px;
        border-radius: 12px;
        border: 1px solid #ccc;
        background: #f7f7f7;
        cursor: pointer;
        font-size: 15px;
    }

    .social-box {
        display: flex;
        gap: 4%;
        margin-top: 10px;
    }

    .signup {
        text-align: center;
        margin-top: 20px;
        font-size: 14px;
    }

    .signup a {
        color: #6B5BFF;
        text-decoration: none;
        font-weight: bold;
    }

</style>
</head>

<body>

<div class="container">

    <!-- Left section -->
    <div class="left-box">
        <h1>Hey, Hello!</h1>
        <p>Join our system and enjoy simplified service management.</p>
    </div>

    <!-- Right section -->
    <div class="right-box">
        <h2>Welcome Back</h2>
        <p>Let's get started with your account.</p>

        <form action="login" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>

            <a href="${pageContext.request.contextPath}/forget">Forgot Password?</a>

            <button class="btn-login">Login</button>
        </form>

        
        <div class="signup">
            Don’t have an account?
            <a href="${pageContext.request.contextPath}/register">Sign Up</a>
        </div>
    </div>

</div>

</body>
</html>
