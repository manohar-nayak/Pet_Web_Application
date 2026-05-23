<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="dao.WishlistDAO" %>
<%@ page import="model.Wishlist" %>

<%

String username =
(String)session.getAttribute("username");

if(username == null){

    response.sendRedirect(
    "login.jsp");

    return;
}

WishlistDAO dao =
new WishlistDAO();

List<Wishlist> list =
dao.getWishlistItems(username);

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>💖 Wishlist - Pet Paradise</title>

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
        transform:translateY(-10px);
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

    font-size:70px;

    font-weight:800;

    margin-bottom:15px;
}

.hero p{

    font-size:22px;

    background:
    rgba(255,255,255,0.15);

    padding:14px 30px;

    border-radius:50px;

    backdrop-filter:blur(10px);
}

/* ================= CONTAINER ================= */

.wishlist-container{

    width:92%;

    margin:50px auto 90px;

    display:grid;

    grid-template-columns:
    repeat(auto-fit,minmax(340px,1fr));

    gap:35px;
}

/* ================= CARD ================= */

.wishlist-card{

    background:white;

    border-radius:30px;

    overflow:hidden;

    box-shadow:
    0 10px 25px rgba(0,0,0,0.08);

    transition:0.4s;

    display:flex;

    flex-direction:column;

    position:relative;

    animation:floating 4s ease-in-out infinite;
}

.wishlist-card:hover{

    transform:
    translateY(-10px);

    box-shadow:
    0 18px 40px rgba(0,0,0,0.15);
}

/* IMAGE */

.wishlist-card img{

    width:100%;

    height:300px;

    object-fit:cover;

    transition:0.4s;
}

.wishlist-card:hover img{

    transform:scale(1.05);
}

/* BADGE */

.badge{

    position:absolute;

    top:20px;
    right:20px;

    background:
    linear-gradient(
    135deg,
    #ff416c,
    #ff4b2b);

    color:white;

    padding:8px 16px;

    border-radius:30px;

    font-size:14px;

    font-weight:700;

    box-shadow:
    0 5px 15px rgba(0,0,0,0.2);
}

/* CONTENT */

.wishlist-content{

    padding:28px;

    text-align:center;
}

.wishlist-content h2{

    font-size:40px;

    color:#222;

    margin-bottom:20px;

    font-weight:800;
}

/* PRICE */

.wishlist-price{

    color:#00a651;

    font-size:48px;

    font-weight:800;

    margin-bottom:25px;
}

/* BUTTON GROUP */

.btn-group{

    display:flex;

    flex-direction:column;

    gap:15px;
}

/* BUTTONS */

.buy-btn,
.remove-btn{

    width:100%;

    padding:16px;

    border:none;

    border-radius:50px;

    font-size:18px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.buy-btn{

    background:
    linear-gradient(
    135deg,
    #00c9a7,
    #92fe9d);

    color:white;
}

.remove-btn{

    background:
    linear-gradient(
    135deg,
    #ff416c,
    #ff4b2b);

    color:white;
}

.buy-btn:hover,
.remove-btn:hover{

    transform:scale(1.03);

    box-shadow:
    0 8px 20px rgba(0,0,0,0.15);
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

    transition:0.3s;
}

.shop-btn:hover{

    transform:scale(1.05);
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

    font-size:48px;
}

.hero p{

    font-size:18px;
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

        <a href="wishlist.jsp"
           class="active">

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

        💖 My Wishlist

    </h1>

    <p>

        Your favorite furry friends are saved here ❤️

    </p>

</div>

<%

if(list.size() == 0){

%>

<!-- ================= EMPTY ================= -->

<div class="empty-box">

    <h1>

        😔 Wishlist Empty

    </h1>

    <p>

        Add adorable pets to your wishlist 🐾

    </p>

    <a href="pets.jsp"
       class="shop-btn">

       🐶 Explore Pets

    </a>

</div>

<%

}else{

%>

<!-- ================= WISHLIST ================= -->

<div class="wishlist-container">

<%

for(Wishlist w : list){

%>

<div class="wishlist-card">

    <div class="badge">

        ❤️ Favorite

    </div>

    <img src="<%= w.getImage() %>">

    <div class="wishlist-content">

        <h2>

            🐾 <%= w.getPetname() %>

        </h2>

        <p class="wishlist-price">

            ₹ <%= w.getPrice() %>

        </p>

        <div class="btn-group">

            <!-- BUY NOW -->

            <a href="petDetails.jsp?id=<%= w.getPetId() %>">

                <button class="buy-btn">

                    🛒 Buy Now

                </button>

            </a>

            <!-- REMOVE -->

            <a href="../removeWishlist?id=<%= w.getId() %>">

                <button class="remove-btn">

                    ❌ Remove

                </button>

            </a>

        </div>

    </div>

</div>

<%

}

%>

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