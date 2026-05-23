<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="dao.CartDAO" %>
<%@ page import="model.Cart" %>

<%

String username =
(String)session.getAttribute("username");

if(username == null){

    response.sendRedirect(
    "login.jsp");

    return;
}

CartDAO dao =
new CartDAO();

List<Cart> cartItems =
dao.getCartItems();

double total = 0;

for(Cart c : cartItems){

    total +=
    c.getPrice() *
    c.getQuantity();
}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>🛒 Cart - Pet Paradise</title>

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

.menu a:hover{

    background:
    rgba(255,255,255,0.18);

    transform:
    translateY(-3px);
}

.menu a.active{

    background:white;

    color:#dd2476;

    box-shadow:
    0 8px 25px rgba(255,255,255,0.35);
}

/* ================= HERO ================= */

.hero{

    width:92%;

    margin:35px auto;

    height:280px;

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

    color:white;

    text-align:center;
}

.hero h1{

    font-size:68px;

    font-weight:800;

    margin-bottom:15px;
}

.hero p{

    font-size:22px;

    background:
    rgba(255,255,255,0.15);

    padding:14px 30px;

    border-radius:50px;
}

/* ================= CART ================= */

.cart-container{

    width:92%;

    margin:50px auto;
}

.cart-card{

    background:white;

    border-radius:35px;

    padding:25px;

    margin-bottom:35px;

    display:flex;

    justify-content:space-between;

    align-items:center;

    box-shadow:
    0 10px 25px rgba(0,0,0,0.08);

    transition:0.3s;
}

.cart-card:hover{

    transform:
    translateY(-8px);

    box-shadow:
    0 18px 40px rgba(0,0,0,0.14);
}

.cart-left{

    display:flex;

    align-items:center;

    gap:30px;
}

.cart-left img{

    width:220px;

    height:180px;

    object-fit:cover;

    border-radius:25px;
}

.cart-details h2{

    font-size:42px;

    color:#222;

    margin-bottom:15px;
}

.cart-details p{

    font-size:20px;

    color:#666;

    margin-bottom:12px;
}

.price{

    font-size:48px !important;

    color:#00a651 !important;

    font-weight:800;
}

/* REMOVE */

.remove-btn{

    border:none;

    background:
    linear-gradient(
    135deg,
    #ff416c,
    #ff4b2b);

    color:white;

    padding:16px 32px;

    border-radius:50px;

    font-size:18px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.remove-btn:hover{

    transform:scale(1.05);
}

/* ================= TOTAL ================= */

.total-box{

    width:92%;

    margin:70px auto 100px;

    background:white;

    border-radius:35px;

    padding:60px;

    text-align:center;

    box-shadow:
    0 10px 25px rgba(0,0,0,0.08);
}

.total-box h1{

    font-size:60px;

    color:#222;

    margin-bottom:20px;
}

.total-price{

    font-size:70px;

    color:#00a651;

    font-weight:800;

    margin-bottom:35px;
}

/* CHECKOUT BUTTON */

.checkout-btn{

    border:none;

    padding:20px 45px;

    border-radius:50px;

    background:
    linear-gradient(
    135deg,
    #00c9a7,
    #92fe9d);

    color:white;

    font-size:22px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.checkout-btn:hover{

    transform:scale(1.05);
}

/* ================= EMPTY ================= */

.empty-box{

    width:92%;

    margin:80px auto;

    background:white;

    padding:80px 30px;

    border-radius:35px;

    text-align:center;

    box-shadow:
    0 10px 25px rgba(0,0,0,0.08);
}

.empty-box h1{

    font-size:60px;

    margin-bottom:20px;
}

.empty-box p{

    font-size:22px;

    color:#666;

    margin-bottom:35px;
}

.shop-btn{

    display:inline-block;

    padding:18px 38px;

    border-radius:50px;

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #dd2476);

    color:white;

    font-size:20px;

    font-weight:700;

    text-decoration:none;
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

    justify-content:center;
}

.cart-card{

    flex-direction:column;

    gap:30px;

    text-align:center;
}

.cart-left{

    flex-direction:column;
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

            🛒 Cart

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

<!-- ================= HERO ================= -->

<div class="hero">

    <h1>

        🛒 Your Cart

    </h1>

    <p>

        Your adorable furry friends are waiting ❤️

    </p>

</div>

<%

if(cartItems.size() == 0){

%>

<div class="empty-box">

    <h1>

        😔 Cart Empty

    </h1>

    <p>

        Add cute pets to continue shopping 🐾

    </p>

    <a href="pets.jsp"
       class="shop-btn">

       🐶 Explore Pets

    </a>

</div>

<%

}else{

%>

<!-- ================= CART ITEMS ================= -->

<div class="cart-container">

<%

for(Cart c : cartItems){

%>

<div class="cart-card">

    <div class="cart-left">

        <img src="<%= c.getImage() %>">

        <div class="cart-details">

            <h2>

                🐾 <%= c.getName() %>

            </h2>

            <p>

                📦 Quantity :
                <%= c.getQuantity() %>

            </p>

            <p class="price">

                ₹ <%= c.getPrice() * c.getQuantity() %>

            </p>

        </div>

    </div>

    <a href="../removeCart?id=<%= c.getId() %>">

        <button class="remove-btn">

            ❌ Remove

        </button>

    </a>

</div>

<%

}

%>

</div>

<!-- ================= TOTAL ================= -->

<div class="total-box">

    <h1>

        💰 Total Amount

    </h1>

    <div class="total-price">

        ₹ <%= total %>

    </div>

    <!-- FIXED CHECKOUT -->

    <form action="checkout.jsp"
          method="get">

        <input type="hidden"
               name="pet"
               value="<%= cartItems.get(0).getName() %>">

        <input type="hidden"
               name="total"
               value="<%= total %>">

        <input type="hidden"
               name="image"
               value="<%= cartItems.get(0).getImage() %>">

        <button type="submit"
                class="checkout-btn">

            🚀 Proceed To Checkout

        </button>

    </form>

</div>

<%

}

%>

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