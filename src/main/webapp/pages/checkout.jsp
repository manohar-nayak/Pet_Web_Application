<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

String username =
(String)session.getAttribute("username");

if(username == null){

    response.sendRedirect("login.jsp");
    return;
}

String pet =
request.getParameter("pet");

String total =
request.getParameter("total");

String image =
request.getParameter("image");

if(pet == null){

    pet = "Selected Pet";
}

if(total == null){

    total = "0";
}

if(image == null){

    image =
    "https://images.unsplash.com/photo-1517849845537-4d257902454a?q=80&w=1200";
}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>💳 Checkout - Pet Paradise</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href=
"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
rel="stylesheet">

<script src=
"https://checkout.razorpay.com/v1/checkout.js">
</script>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;

    font-family:
    'Segoe UI Emoji',
    'Noto Color Emoji',
    'Apple Color Emoji',
    'Poppins',
    sans-serif;
}

body{

    min-height:100vh;

    background:
    linear-gradient(
    135deg,
    #f3f5ff,
    #eef2ff);

    overflow-x:hidden;

    animation:fadeIn 0.8s ease;
}

/* ================= ANIMATION ================= */

@keyframes fadeIn{

    from{

        opacity:0;
        transform:translateY(10px);
    }

    to{

        opacity:1;
        transform:translateY(0);
    }
}

@keyframes floating{

    0%{
        transform:translateY(0px);
    }

    50%{
        transform:translateY(-8px);
    }

    100%{
        transform:translateY(0px);
    }
}

@keyframes shine{

    100%{

        left:100%;
    }
}

/* ================= NAVBAR ================= */

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

    position:sticky;

    top:0;

    z-index:999;

    box-shadow:
    0 8px 25px rgba(0,0,0,0.12);
}

/* LOGO */

.logo{

    color:white;

    font-size:28px;

    font-weight:800;

    letter-spacing:0.5px;

    text-decoration:none;

    display:flex;

    align-items:center;

    gap:10px;
}

/* MENU */

.menu{

    display:flex;

    align-items:center;

    gap:18px;

    flex-wrap:wrap;

    white-space:nowrap;
}

/* MENU LINKS */

.menu a{

    color:white;

    text-decoration:none;

    font-size:17px;

    font-weight:600;

    padding:12px 24px;

    border-radius:50px;

    transition:0.35s;

    position:relative;

    display:flex;

    align-items:center;

    gap:8px;

    min-width:max-content;
}

/* HOVER */

.menu a:hover{

    background:
    rgba(255,255,255,0.18);

    transform:
    translateY(-3px);

    box-shadow:
    0 8px 20px rgba(255,255,255,0.18);
}

/* ACTIVE */

.menu a.active{

    background:white;

    color:#dd2476;

    box-shadow:
    0 8px 25px rgba(255,255,255,0.35);

    transform:scale(1.04);
}

/* SHINE */

.menu a.active::after{

    content:"";

    position:absolute;

    top:0;
    left:-100%;

    width:100%;
    height:100%;

    background:
    linear-gradient(
    120deg,
    transparent,
    rgba(255,255,255,0.7),
    transparent);

    animation:shine 2s infinite;
}

/* ================= BACK BUTTON ================= */

.back-wrapper{

    width:90%;

    margin:35px auto 0;
}

.back-btn{

    border:none;

    padding:14px 28px;

    border-radius:50px;

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #dd2476);

    color:white;

    font-size:16px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;

    box-shadow:
    0 10px 25px rgba(221,36,118,0.25);
}

.back-btn:hover{

    transform:
    translateY(-3px);

    box-shadow:
    0 15px 30px rgba(221,36,118,0.4);
}

/* ================= MAIN BOX ================= */

.checkout-wrapper{

    width:90%;

    max-width:1300px;

    margin:35px auto 70px;

    display:grid;

    grid-template-columns:
    1fr 1fr;

    gap:40px;
}

/* ================= LEFT SIDE ================= */

.left-box{

    background:white;

    border-radius:35px;

    overflow:hidden;

    box-shadow:
    0 15px 40px rgba(0,0,0,0.08);

    animation:floating 4s ease-in-out infinite;
}

.pet-image{

    width:100%;

    height:500px;

    object-fit:cover;

    display:block;
}

.left-content{

    padding:35px;
}

.pet-title{

    font-size:48px;

    font-weight:800;

    color:#222;

    margin-bottom:15px;
}

.pet-desc{

    font-size:18px;

    color:#666;

    line-height:1.8;

    margin-bottom:25px;
}

/* FEATURES */

.features{

    display:flex;

    flex-wrap:wrap;

    gap:14px;

    margin-top:10px;
}

.feature{

    padding:12px 20px;

    border-radius:50px;

    background:#f5f6ff;

    font-weight:600;

    color:#444;

    font-size:15px;
}

/* ================= RIGHT SIDE ================= */

.right-box{

    background:
    rgba(255,255,255,0.75);

    backdrop-filter:blur(15px);

    border-radius:35px;

    padding:45px;

    box-shadow:
    0 15px 40px rgba(0,0,0,0.08);
}

.checkout-title{

    font-size:52px;

    font-weight:800;

    color:#222;

    margin-bottom:12px;
}

.subtitle{

    color:#666;

    font-size:18px;

    margin-bottom:35px;
}

/* PRICE BOX */

.price-box{

    background:
    linear-gradient(
    135deg,
    #f1fff7,
    #e9fff2);

    padding:30px;

    border-radius:25px;

    text-align:center;

    margin-bottom:35px;
}

.price-box h3{

    color:#666;

    font-weight:500;

    margin-bottom:10px;
}

.price{

    color:#00a651;

    font-size:58px;

    font-weight:800;
}

/* INPUTS */

.input-box{

    margin-bottom:22px;
}

.input-box label{

    display:block;

    margin-bottom:10px;

    font-weight:600;

    color:#333;
}

.input-box input,
.input-box textarea{

    width:100%;

    padding:18px;

    border:2px solid #e6e6e6;

    border-radius:18px;

    outline:none;

    font-size:16px;

    transition:0.3s;

    background:white;
}

.input-box input:focus,
.input-box textarea:focus{

    border-color:#dd2476;

    box-shadow:
    0 0 15px rgba(221,36,118,0.2);
}

textarea{

    resize:none;
}

/* PAYMENT BUTTON */

.pay-btn{

    width:100%;

    margin-top:15px;

    padding:22px;

    border:none;

    border-radius:60px;

    font-size:22px;

    font-weight:700;

    color:white;

    cursor:pointer;

    background:
    linear-gradient(
    135deg,
    #ff416c,
    #ff4b2b);

    transition:0.4s;

    box-shadow:
    0 15px 30px rgba(255,65,108,0.3);
}

.pay-btn:hover{

    transform:
    translateY(-4px)
    scale(1.02);

    box-shadow:
    0 20px 40px rgba(255,65,108,0.45);
}

/* SECURITY */

.secure-box{

    margin-top:25px;

    display:flex;

    justify-content:center;

    gap:15px;

    flex-wrap:wrap;
}

.secure-item{

    background:#fff5f8;

    color:#dd2476;

    padding:12px 18px;

    border-radius:50px;

    font-size:14px;

    font-weight:600;
}

/* ================= FOOTER ================= */

.footer{

    background:#111;

    color:white;

    text-align:center;

    padding:60px 20px;
}

.footer h2{

    font-size:42px;

    margin-bottom:12px;
}

.footer p{

    color:#ccc;

    font-size:18px;
}

/* ================= RESPONSIVE ================= */

@media(max-width:1000px){

.checkout-wrapper{

    grid-template-columns:1fr;
}

.pet-image{

    height:350px;
}

}

@media(max-width:900px){

.navbar{

    flex-direction:column;

    gap:20px;

    padding:20px;
}

.menu{

    flex-wrap:wrap;

    justify-content:center;
}

.logo{

    font-size:24px;
}

}

@media(max-width:650px){

.checkout-title{

    font-size:38px;
}

.pet-title{

    font-size:36px;
}

.price{

    font-size:42px;
}

.right-box,
.left-content{

    padding:28px;
}

}

@media(max-width:600px){

.menu a{

    font-size:14px;

    padding:10px 16px;
}

}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <a href="../index.jsp"
       class="logo">

        🐾 Pet Paradise

    </a>

    <div class="menu">

        <a href="../index.jsp">

            🏠 Home

        </a>

        <a href="pets.jsp">

            🐶 Pets

        </a>

        <a href="cart.jsp"
           class="active">

            🛒 Checkout

        </a>

        <a href="wishlist.jsp">

            💖 Wishlist

        </a>

        <a href="orders.jsp">

            📦 Orders

        </a>

        <a href="../logout">

            🚪 Logout

        </a>

    </div>

</div>

<!-- ================= BACK BUTTON ================= -->

<div class="back-wrapper">

    <button class="back-btn"
            onclick="goBackPage()">

        ← Back

    </button>

</div>

<!-- ================= MAIN ================= -->

<div class="checkout-wrapper">

    <!-- LEFT -->

    <div class="left-box">

        <img src="<%= image %>"
             class="pet-image">

        <div class="left-content">

            <div class="pet-title">

                🐾 <%= pet %>

            </div>

            <div class="pet-desc">

                Your adorable furry friend is ready to
                become part of your family ❤️
                Fully vaccinated, healthy and safely
                delivered to your doorstep.

            </div>

            <div class="features">

                <div class="feature">
                    ✅ Vaccinated
                </div>

                <div class="feature">
                    🚚 Fast Delivery
                </div>

                <div class="feature">
                    🏥 Health Checked
                </div>

                <div class="feature">
                    ❤️ Friendly Nature
                </div>

            </div>

        </div>

    </div>

    <!-- RIGHT -->

    <div class="right-box">

        <div class="checkout-title">

            💳 Secure Checkout

        </div>

        <div class="subtitle">

            Complete your adorable pet purchase 🐾

        </div>

        <div class="price-box">

            <h3>Total Amount</h3>

            <div class="price">

                ₹ <%= total %>

            </div>

        </div>

        <div class="input-box">

            <label>👤 Full Name</label>

            <input type="text"
                   id="fullname"
                   placeholder="Enter Full Name">

        </div>

        <div class="input-box">

            <label>📞 Phone Number</label>

            <input type="text"
                   id="phone"
                   placeholder="Enter Phone Number">

        </div>

        <div class="input-box">

            <label>📍 Delivery Address</label>

            <textarea rows="5"
                      id="address"
                      placeholder="Enter Delivery Address"></textarea>

        </div>

        <button class="pay-btn"
                onclick="payNow()">

            🐾 Pay With Razorpay

        </button>

        <div class="secure-box">

            <div class="secure-item">
                🔒 100% Secure
            </div>

            <div class="secure-item">
                💳 Razorpay Protected
            </div>

            <div class="secure-item">
                ⚡ Instant Payment
            </div>

        </div>

    </div>

</div>

<!-- ================= FOOTER ================= -->

<div class="footer">

    <h2>

        🐾 Pet Paradise

    </h2>

    <p>

        Bringing happiness home with every paw ❤️

    </p>

</div>

<script>

function goBackPage(){

    if(document.referrer !== ""){

        window.history.back();
    }

    else{

        window.location.href =
        "pets.jsp";
    }
}

function payNow(){

    var name =
    document.getElementById("fullname").value;

    var phone =
    document.getElementById("phone").value;

    var address =
    document.getElementById("address").value;

    if(name == "" ||
       phone == "" ||
       address == ""){

        alert("Please fill all details");

        return;
    }

    var options = {

        "key":
        "rzp_test_SoxNW0wzQGl50h",

        "amount":
        "<%= (int)(Double.parseDouble(total) * 100) %>",

        "currency":
        "INR",

        "name":
        "Pet Paradise",

        "description":
        "Pet Purchase Payment",

        "image":
        "https://cdn-icons-png.flaticon.com/512/616/616408.png",

        "handler":
        function (response){

            window.location.href =

            "../saveOrder?" +

            "username=<%= username %>" +

            "&pet=<%= pet %>" +

            "&amount=<%= total %>" +

            "&address=" +

            encodeURIComponent(address) +

            "&phone=" +

            phone;
        },

        "prefill": {

            "name": name,

            "contact": phone
        },

        "theme": {

            "color": "#ff416c"
        }
    };

    var rzp1 =
    new Razorpay(options);

    rzp1.open();
}

</script>

</body>

</html>