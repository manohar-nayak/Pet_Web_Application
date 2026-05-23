<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link rel="stylesheet" href="../css/style.css">

<style>

.form-container{
    width:400px;
    background:white;
    margin:60px auto;
    padding:40px;
    border-radius:12px;
    box-shadow:0 0 15px rgba(0,0,0,0.1);
}

.form-container h1{
    text-align:center;
    margin-bottom:30px;
    color:#333;
}

.input-box{
    width:100%;
    padding:14px;
    margin-bottom:20px;
    border:1px solid #ccc;
    border-radius:5px;
    font-size:16px;
}

.register-btn{
    width:100%;
    padding:14px;
    background:#ff6b6b;
    color:white;
    border:none;
    border-radius:5px;
    font-size:18px;
    cursor:pointer;
}

.register-btn:hover{
    background:#ff4d4d;
}

.login-link{
    text-align:center;
    margin-top:20px;
}

.login-link a{
    color:#ff6b6b;
    text-decoration:none;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="navbar">

    <div class="logo">
        Pet Shop
    </div>

    <div class="menu">
        <a href="../index.jsp">Home</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </div>

</div>

<div class="form-container">

    <h1>Create Account</h1>

    <form action="/pet-webapp/register" method="post">

        <input type="text"
               name="fullname"
               placeholder="Enter Full Name"
               class="input-box"
               required>

        <input type="email"
               name="email"
               placeholder="Enter Email"
               class="input-box"
               required>

        <input type="password"
               name="password"
               placeholder="Create Password"
               class="input-box"
               required>

        <input type="text"
               name="phone"
               placeholder="Enter Phone Number"
               class="input-box"
               required>

        <button type="submit" class="register-btn">
            Register
        </button>

    </form>

    <div class="login-link">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>

</div>

</body>
</html>