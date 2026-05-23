<%@ page import="jakarta.servlet.http.HttpSession" %>

<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="dao.PetDAO" %>
<%@ page import="model.Pet" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>🐾 Pet Paradise</title>

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

/* ACTIVE PAGE */

.menu a.active{

    background:white;

    color:#dd2476;

    box-shadow:
    0 8px 25px rgba(255,255,255,0.35);

    transform:scale(1.04);
}

/* SHINE EFFECT */

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

.user-name{

    background:white;

    color:#dd2476;

    padding:12px 22px;

    border-radius:50px;

    font-weight:700;

    box-shadow:
    0 8px 25px rgba(255,255,255,0.35);
}

/* ================= HERO ================= */

.hero{

    width:92%;

    margin:35px auto;

    height:420px;

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

    position:relative;

    overflow:hidden;
}

.hero::before{

    content:'';

    position:absolute;

    width:300px;

    height:300px;

    background:
    rgba(255,255,255,0.08);

    border-radius:50%;

    top:-80px;

    right:-80px;
}

.hero h1{

    font-size:76px;

    font-weight:800;

    margin-bottom:18px;

    z-index:1;
}

.hero p{

    font-size:24px;

    background:
    rgba(255,255,255,0.15);

    padding:14px 30px;

    border-radius:50px;

    backdrop-filter:blur(10px);

    z-index:1;
}

/* ================= SEARCH ================= */

.search-section{

    width:90%;

    margin:-45px auto 60px;

    position:relative;

    z-index:10;
}

.search-box{

    background:white;

    padding:25px;

    border-radius:80px;

    display:flex;

    justify-content:center;

    align-items:center;

    gap:20px;

    flex-wrap:wrap;

    box-shadow:
    0 12px 35px rgba(0,0,0,0.12);
}

.search-box input{

    width:320px;

    padding:16px 20px;

    border:none;

    outline:none;

    background:#f3f5ff;

    border-radius:50px;

    font-size:17px;
}

.search-box select{

    padding:16px 22px;

    border:none;

    outline:none;

    background:#f3f5ff;

    border-radius:50px;

    font-size:17px;
}

.search-box button{

    padding:16px 35px;

    border:none;

    border-radius:50px;

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #dd2476);

    color:white;

    font-size:18px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.search-box button:hover{

    transform:scale(1.05);
}

/* ================= PET CONTAINER ================= */

.pet-container{

    width:92%;

    margin:auto auto 90px;

    display:grid;

    grid-template-columns:
    repeat(auto-fit,minmax(330px,1fr));

    gap:35px;
}

/* ================= CARD ================= */

.card{

    background:white;

    border-radius:30px;

    overflow:hidden;

    box-shadow:
    0 10px 25px rgba(0,0,0,0.08);

    transition:0.4s;

    display:flex;

    flex-direction:column;

    min-height:790px;

    position:relative;

    animation:floating 4s ease-in-out infinite;
}

.card:hover{

    transform:
    translateY(-10px);

    box-shadow:
    0 18px 40px rgba(0,0,0,0.15);
}

/* IMAGE */

.card img{

    width:100%;

    height:290px;

    object-fit:cover;

    transition:0.4s;
}

.card:hover img{

    transform:scale(1.05);
}

/* BADGE */

.pet-badge{

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

.card-content{

    padding:28px;

    display:flex;

    flex-direction:column;

    flex:1;
}

/* TITLE */

.card-content h2{

    font-size:42px;

    font-weight:800;

    color:#222;

    margin-bottom:22px;

    line-height:1.2;
}

/* DETAILS */

.pet-info{

    display:flex;

    flex-direction:column;

    gap:15px;

    margin-bottom:28px;
}

.pet-info p{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding-bottom:10px;

    border-bottom:
    1px solid #f1f1f1;

    font-size:18px;

    color:#555;
}

.pet-info strong{

    color:#111;
}

/* PRICE */

.price-box{

    background:
    linear-gradient(
    135deg,
    #f8fff8,
    #eafff1);

    padding:22px;

    border-radius:20px;

    text-align:center;

    margin-top:auto;

    margin-bottom:20px;
}

.price-label{

    color:#666;

    font-size:18px;

    margin-bottom:5px;
}

.price{

    color:#00a651;

    font-size:50px;

    font-weight:800;
}

/* RATING */

.rating{

    text-align:center;

    margin-bottom:20px;

    color:#ff9800;

    font-size:20px;

    font-weight:700;
}

/* BUTTONS */

.button-group{

    display:flex;

    flex-direction:column;

    gap:15px;
}

.wishlist-btn,
.buy-btn{

    width:100%;

    padding:16px;

    border:none;

    border-radius:50px;

    font-size:18px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.wishlist-btn{

    background:
    linear-gradient(
    135deg,
    #ff416c,
    #ff4b2b);

    color:white;
}

.buy-btn{

    background:
    linear-gradient(
    135deg,
    #00c9a7,
    #92fe9d);

    color:white;
}

.wishlist-btn:hover,
.buy-btn:hover{

    transform:scale(1.03);

    box-shadow:
    0 8px 20px rgba(0,0,0,0.15);
}

/* ADMIN BUTTONS */

.admin-btn{

    width:100%;

    padding:15px;

    border:none;

    border-radius:50px;

    color:white;

    font-size:17px;

    font-weight:700;

    cursor:pointer;

    margin-top:14px;

    transition:0.3s;
}

.edit-btn{

    background:#007bff;
}

.delete-btn{

    background:red;
}

.admin-btn:hover{

    transform:scale(1.03);
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

.search-box{

    border-radius:30px;
}

.search-box input{

    width:100%;
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

<%

String username =
(String)session.getAttribute("username");

PetDAO dao =
new PetDAO();

String keyword =
request.getParameter("keyword");

String category =
request.getParameter("category");

List<Pet> pets;

if(keyword != null ||
category != null){

    if(keyword == null){

        keyword = "";
    }

    pets =
    dao.searchPets(
    keyword,
    category);

}else{

    pets =
    dao.getAllPets();
}

%>

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

        <a href="pets.jsp"
           class="active">

            🐶 Pets

        </a>

        <a href="cart.jsp">

            🛒 Cart

        </a>

        <a href="wishlist.jsp">

            💖 Wishlist

        </a>

        <a href="orders.jsp">

            📦 Orders

        </a>

<%

if(username == null){

%>

        <a href="login.jsp">

            🔐 Login

        </a>

        <a href="register.jsp">

            ✨ Register

        </a>

<%

}else{

%>

        <span class="user-name">

            👋 <%= username %>

        </span>

        <a href="../logout">

            🚪 Logout

        </a>

<%

}

%>

    </div>

</div>

<!-- ================= HERO ================= -->

<div class="hero">

    <h1>

        🐶 Find Your Favorite Pet 🐱

    </h1>

    <p>

        Healthy • Cute • Trusted Companions ❤️

    </p>

</div>

<!-- ================= SEARCH ================= -->

<div class="search-section">

<form action="pets.jsp"
      method="get"
      class="search-box">

    <input type="text"
           name="keyword"
           placeholder="🔍 Search pets...">

    <select name="category">

        <option value="">
            All Categories
        </option>

        <option value="Dog">
            🐶 Dog
        </option>

        <option value="Cat">
            🐱 Cat
        </option>

        <option value="Bird">
            🐦 Bird
        </option>

        <option value="Rabbit">
            🐰 Rabbit
        </option>

    </select>

    <button type="submit">

        🔍 Search

    </button>

</form>

</div>

<!-- ================= PETS ================= -->

<div class="pet-container">

<%

for(Pet p : pets){

%>

<div class="card">

    <div class="pet-badge">

        ⭐ Popular

    </div>

    <img src="<%= p.getImage() %>">

    <div class="card-content">

        <h2>

            🐾 <%= p.getName() %>

        </h2>

        <div class="pet-info">

            <p>

                <strong>Breed</strong>

                <span>
                    🦴 <%= p.getBreed() %>
                </span>

            </p>

            <p>

                <strong>Category</strong>

                <span>
                    🐶 <%= p.getCategory() %>
                </span>

            </p>

            <p>

                <strong>Age</strong>

                <span>
                    ⭐ <%= p.getAge() %> years
                </span>

            </p>

        </div>

        <div class="price-box">

            <div class="price-label">

                💰 Price

            </div>

            <div class="price">

                ₹ <%= p.getPrice() %>

            </div>

        </div>

        <div class="rating">

            ⭐ 4.9 Premium Rating

        </div>

        <div class="button-group">

            <!-- WISHLIST -->

            <form action="../addWishlist"
                  method="post">

                <input type="hidden"
                       name="id"
                       value="<%= p.getId() %>">

                <button type="submit"
                        class="wishlist-btn">

                    💖 Add Wishlist

                </button>

            </form>

            <!-- BUY NOW -->

            <form action="petDetails.jsp"
                  method="get">

                <input type="hidden"
                       name="id"
                       value="<%= p.getId() %>">

                <button type="submit"
                        class="buy-btn">

                    🛒 Buy Now

                </button>

            </form>

        </div>

<%

if(username != null &&
username.equals("admin@gmail.com")){

%>

<a href="editPet.jsp?id=<%= p.getId() %>">

    <button class=
    "admin-btn edit-btn">

        ✏️ Edit Pet

    </button>

</a>

<a href="../deletePet?id=<%= p.getId() %>">

    <button class=
    "admin-btn delete-btn">

        ❌ Delete Pet

    </button>

</a>

<%

}

%>

    </div>

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