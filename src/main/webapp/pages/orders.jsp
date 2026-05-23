<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="dao.OrderDAO" %>
<%@ page import="model.Order" %>

<%

String username =
(String)session.getAttribute("username");

if(username == null){

    response.sendRedirect(
    "login.jsp");

    return;
}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>📦 My Orders - Pet Paradise</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href=
"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
rel="stylesheet">

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

    background:
    linear-gradient(
    135deg,
    #f3f4f6,
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

/* ================= HERO ================= */

.hero{

    width:92%;

    margin:35px auto;

    height:320px;

    border-radius:35px;

    background:
    linear-gradient(
    rgba(0,0,0,0.55),
    rgba(0,0,0,0.55)),

    url('https://images.unsplash.com/photo-1517849845537-4d257902454a?q=80&w=1600');

    background-size:cover;

    background-position:center;

    display:flex;

    flex-direction:column;

    justify-content:center;

    align-items:center;

    text-align:center;

    color:white;

    overflow:hidden;

    position:relative;
}

.hero h1{

    font-size:72px;

    font-weight:800;

    margin-bottom:15px;
}

.hero p{

    font-size:24px;

    background:
    rgba(255,255,255,0.15);

    padding:14px 30px;

    border-radius:50px;

    backdrop-filter:blur(10px);
}

/* ================= TOP ACTION ================= */

.top-action{

    width:92%;

    margin:40px auto 10px;

    display:flex;

    justify-content:flex-end;
}

.clear-btn{

    background:
    linear-gradient(
    135deg,
    #ff3b5f,
    #ff512f);

    color:white;

    text-decoration:none;

    padding:16px 30px;

    border-radius:50px;

    font-size:17px;

    font-weight:700;

    transition:0.3s;

    box-shadow:
    0 10px 20px rgba(255,59,95,0.25);
}

.clear-btn:hover{

    transform:
    translateY(-4px)
    scale(1.03);
}

/* ================= ORDERS ================= */

.orders-container{

    width:92%;

    margin:40px auto 90px;

    display:grid;

    grid-template-columns:
    repeat(auto-fit,minmax(420px,1fr));

    gap:40px;
}

/* ================= CARD ================= */

.order-card{

    background:white;

    border-radius:35px;

    overflow:hidden;

    box-shadow:
    0 12px 30px rgba(0,0,0,0.08);

    transition:0.35s;

    position:relative;

    animation:floating 4s ease-in-out infinite;
}

.order-card:hover{

    transform:
    translateY(-10px);

    box-shadow:
    0 22px 45px rgba(0,0,0,0.14);
}

/* ================= CARD TOP ================= */

.order-top{

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #dd2476);

    padding:35px;

    color:white;

    position:relative;
}

.order-top::after{

    content:"";

    position:absolute;

    width:120px;
    height:120px;

    background:
    rgba(255,255,255,0.12);

    border-radius:50%;

    top:-30px;
    right:-30px;
}

.order-top h2{

    font-size:40px;

    margin-bottom:10px;
}

.order-top p{

    font-size:17px;

    opacity:0.95;
}

/* ================= BODY ================= */

.order-body{

    padding:35px;
}

/* DETAILS */

.detail{

    margin-bottom:22px;

    font-size:19px;

    color:#555;

    line-height:1.7;
}

.detail strong{

    color:#111;
}

/* PAYMENT */

.payment{

    display:inline-block;

    padding:12px 26px;

    border-radius:50px;

    color:white;

    font-size:15px;

    font-weight:700;
}

.upi{

    background:
    linear-gradient(
    135deg,
    #6a11cb,
    #2575fc);
}

.cod{

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #ff9966);
}

/* PRICE */

.price{

    margin-top:25px;

    font-size:50px;

    color:#00a651;

    font-weight:800;
}

/* STATUS */

.status{

    display:inline-block;

    margin-top:10px;

    padding:12px 28px;

    border-radius:50px;

    color:white;

    font-size:16px;

    font-weight:700;
}

.pending{

    background:#f39c12;
}

.delivered{

    background:#27ae60;
}

.cancelled{

    background:#e74c3c;
}

/* BUTTON */

.cancel-btn{

    margin-top:30px;

    background:
    linear-gradient(
    135deg,
    #ff3b3b,
    #ff0000);

    color:white;

    border:none;

    padding:16px 30px;

    border-radius:50px;

    font-size:17px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.cancel-btn:hover{

    transform:scale(1.05);

    box-shadow:
    0 12px 22px rgba(255,0,0,0.25);
}

/* ================= EMPTY ================= */

.no-orders{

    width:90%;

    margin:80px auto;

    background:white;

    padding:80px;

    border-radius:30px;

    text-align:center;

    font-size:34px;

    color:#666;

    box-shadow:
    0 10px 25px rgba(0,0,0,0.08);
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

/* ================= MOBILE ================= */

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

@media(max-width:768px){

.hero h1{

    font-size:50px;
}

.hero p{

    font-size:20px;
}

.orders-container{

    grid-template-columns:1fr;
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

        <a href="cart.jsp">

            🛒 Cart

        </a>

        <a href="wishlist.jsp">

            💖 Wishlist

        </a>

        <a href="orders.jsp"
           class="active">

            📦 Orders

        </a>

        <a href="../logout">

            🚪 Logout

        </a>

    </div>

</div>

<!-- ================= HERO ================= -->

<div class="hero">

    <h1>

        📦 My Orders

    </h1>

    <p>

        Track your lovely pet purchases 🐶🐱🐦

    </p>

</div>

<!-- ================= CLEAR BUTTON ================= -->

<div class="top-action">

    <a href="../clearOrders"

       onclick="return confirm('Clear all order history?')"

       class="clear-btn">

       🗑 Clear Order History

    </a>

</div>

<%

OrderDAO dao =
new OrderDAO();

List<Order> orders =
dao.getAllOrders();

%>

<!-- ================= ORDERS ================= -->

<div class="orders-container">

<%

if(orders.size() > 0){

for(Order o : orders){

String status =
o.getStatus();

if(status == null){

    status = "Pending";
}

%>

<div class="order-card">

    <!-- TOP -->

    <div class="order-top">

        <h2>

            🐾 <%= o.getPetname() %>

        </h2>

        <p>

            Ordered by:
            <%= o.getFullname() %>

        </p>

    </div>

    <!-- BODY -->

    <div class="order-body">

        <div class="detail">

            <strong>👤 Customer:</strong>

            <%= o.getFullname() %>

        </div>

        <div class="detail">

            <strong>🐾 Pet Name:</strong>

            <%= o.getPetname() %>

        </div>

        <div class="detail">

            <strong>📍 Address:</strong>

            <%= o.getAddress() %>

        </div>

        <div class="detail">

            <strong>📞 Phone:</strong>

            <%= o.getPhone() %>

        </div>

        <div class="detail">

            <strong>💳 Payment:</strong>

            <br><br>

            <span class="payment
            <%= o.getPayment().equals("UPI")
            || o.getPayment().equals("Razorpay")
            ? "upi" : "cod" %>">

                <%= o.getPayment() %>

            </span>

        </div>

        <div class="price">

            ₹ <%= o.getTotal() %>

        </div>

        <div class="detail">

            <strong>📦 Order Status:</strong>

            <br><br>

            <span class="status
            <%= status.toLowerCase() %>">

                <%= status %>

            </span>

        </div>

        <%

        if(status.equals("Pending")){

        %>

        <a href="../cancelOrder?id=<%= o.getId() %>">

            <button class="cancel-btn">

                ❌ Cancel Order

            </button>

        </a>

        <%

        }

        %>

    </div>

</div>

<%

}

}else{

%>

<div class="no-orders">

    No Orders Found 🐾

</div>

<%

}

%>

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

</body>

</html>