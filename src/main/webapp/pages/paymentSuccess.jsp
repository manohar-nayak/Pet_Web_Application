<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Payment Success</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link href=
"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    height:100vh;

    display:flex;

    justify-content:center;

    align-items:center;

    background:
    linear-gradient(
    135deg,
    #f5f7ff,
    #eef2ff);
}

.success-box{

    background:white;

    padding:60px;

    border-radius:35px;

    text-align:center;

    box-shadow:
    0 15px 40px rgba(0,0,0,0.12);

    width:550px;

    animation:pop 0.6s ease;
}

@keyframes pop{

    from{

        opacity:0;
        transform:scale(0.9);
    }

    to{

        opacity:1;
        transform:scale(1);
    }
}

.success-icon{

    font-size:90px;

    margin-bottom:20px;
}

.success-box h1{

    color:#00b894;

    font-size:48px;

    margin-bottom:20px;
}

.success-box p{

    font-size:20px;

    color:#555;

    margin-bottom:14px;
}

.home-btn{

    display:inline-block;

    margin-top:25px;

    padding:16px 35px;

    background:
    linear-gradient(
    135deg,
    #ff416c,
    #ff4b2b);

    color:white;

    text-decoration:none;

    border-radius:50px;

    font-size:18px;

    font-weight:700;

    transition:0.3s;
}

.home-btn:hover{

    transform:translateY(-3px);
}

</style>

</head>

<body>

<div class="success-box">

    <div class="success-icon">

        ✅

    </div>

    <h1>

        Payment Successful

    </h1>

    <p>

        🐾 Pet:
        <%= request.getParameter("pet") %>

    </p>

    <p>

        💰 Amount:
        ₹ <%= request.getParameter("amount") %>

    </p>

    <p>

        🧾 Payment ID:
        <%= request.getParameter("paymentId") %>

    </p>

    <a href="pets.jsp"
       class="home-btn">

        Back To Pets

    </a>

</div>

</body>
</html>