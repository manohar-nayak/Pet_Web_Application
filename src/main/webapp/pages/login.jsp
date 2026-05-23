<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>🐾 Pet Paradise Login</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:'Poppins',sans-serif;

    min-height:100vh;

    background:
    linear-gradient(
    rgba(0,0,0,0.45),
    rgba(0,0,0,0.45)),

    url('https://images.unsplash.com/photo-1543466835-00a7907e9de1');

    background-size:cover;

    background-position:center;

    display:flex;

    flex-direction:column;
}

/* NAVBAR */

.navbar{

    width:100%;

    padding:22px 60px;

    display:flex;

    justify-content:space-between;

    align-items:center;

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #dd2476);

    box-shadow:
    0 5px 20px rgba(0,0,0,0.2);
}

.logo{

    color:white;

    font-size:38px;

    font-weight:800;

    letter-spacing:1px;
}

.logo span{

    font-size:42px;
}

/* MAIN */

.main-container{

    flex:1;

    display:flex;

    justify-content:center;

    align-items:center;

    padding:40px;
}

/* LOGIN BOX */

.login-container{

    width:450px;

    background:
    rgba(255,255,255,0.15);

    backdrop-filter:blur(14px);

    border:
    1px solid rgba(255,255,255,0.25);

    padding:45px;

    border-radius:30px;

    box-shadow:
    0 10px 35px rgba(0,0,0,0.3);

    animation:fadeIn 1s ease;
}

@keyframes fadeIn{

    from{
        opacity:0;
        transform:translateY(30px);
    }

    to{
        opacity:1;
        transform:translateY(0);
    }
}

.login-container h1{

    color:white;

    text-align:center;

    font-size:42px;

    margin-bottom:10px;

    font-weight:800;
}

.caption{

    text-align:center;

    color:#f1f1f1;

    font-size:16px;

    margin-bottom:35px;

    line-height:28px;
}

/* INPUT */

.input-box{

    width:100%;

    padding:18px;

    margin-bottom:22px;

    border:none;

    border-radius:15px;

    font-size:16px;

    outline:none;

    background:
    rgba(255,255,255,0.9);

    transition:0.3s;
}

.input-box:focus{

    transform:scale(1.02);

    box-shadow:
    0 0 15px rgba(255,255,255,0.5);
}

/* BUTTON */

.login-btn{

    width:100%;

    padding:18px;

    border:none;

    border-radius:50px;

    background:
    linear-gradient(
    135deg,
    #00c9ff,
    #92fe9d);

    color:#111;

    font-size:20px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.login-btn:hover{

    transform:translateY(-3px);

    box-shadow:
    0 12px 25px rgba(0,201,255,0.35);
}

/* REGISTER */

.register-link{

    text-align:center;

    margin-top:25px;

    color:white;

    font-size:16px;
}

.register-link a{

    color:#92fe9d;

    text-decoration:none;

    font-weight:700;
}

.register-link a:hover{

    text-decoration:underline;
}

/* FOOTER CAPTION */

.footer-caption{

    margin-top:30px;

    text-align:center;

    color:#f8f8f8;

    font-size:15px;

    line-height:28px;
}

.footer-caption span{

    color:#92fe9d;

    font-weight:700;
}

/* MOBILE */

@media(max-width:600px){

    .navbar{

        padding:20px;
    }

    .logo{

        font-size:30px;
    }

    .login-container{

        width:100%;

        padding:35px 25px;
    }

    .login-container h1{

        font-size:34px;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">

        🐾 Pet Paradise

    </div>

</div>

<!-- LOGIN -->

<div class="main-container">

<div class="login-container">

    <h1>

        Welcome Back 🐶

    </h1>

    <p class="caption">

        Login to explore adorable pets,<br>
        manage your orders and bring home<br>
        your perfect furry friend ❤️

    </p>

    <form action="/pet-webapp/login"
          method="post">

        <input type="email"
               name="email"
               placeholder="📧 Enter Email"
               class="input-box"
               required>

        <input type="password"
               name="password"
               placeholder="🔒 Enter Password"
               class="input-box"
               required>

        <button type="submit"
                class="login-btn">

            🐾 Login Now

        </button>

    </form>

    <div class="register-link">

        Don't have an account?

        <a href="register.jsp">

            Register

        </a>

    </div>

    <div class="footer-caption">

        🐕 Find loyal companions<br>

        🐈 Adopt happiness<br>

        <span>
            Your perfect pet is waiting for you ✨
        </span>

    </div>

</div>

</div>

</body>

</html>