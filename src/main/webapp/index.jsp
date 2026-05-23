<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="dao.PetDAO" %>
<%@ page import="model.Pet" %>

<%

PetDAO dao =
new PetDAO();

List<Pet> pets =
dao.getAllPets();

%>

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

html{
    scroll-behavior:smooth;
}

body{

    background:
    linear-gradient(
    135deg,
    #f4f7fb,
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

    position:fixed;

    top:0;

    z-index:1000;

    background:
    linear-gradient(
    135deg,
    rgba(255,81,47,0.95),
    rgba(221,36,118,0.95));

    backdrop-filter:blur(10px);

    box-shadow:
    0 5px 20px rgba(0,0,0,0.15);
}

/* LOGO */

.logo{

    color:white;

    font-size:32px;

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
}

/* ================= HERO ================= */

.hero{

    width:100%;

    height:100vh;

    background:
    linear-gradient(
    rgba(0,0,0,0.55),
    rgba(0,0,0,0.55)),

    url("https://images.unsplash.com/photo-1525253086316-d0c936c814f8?q=80&w=1600");

    background-size:cover;

    background-position:center;

    display:flex;

    justify-content:center;

    align-items:center;

    flex-direction:column;

    text-align:center;

    padding:20px;

    animation:zoomBg 15s infinite alternate;
}

/* HERO ANIMATION */

@keyframes zoomBg{

    from{
        background-size:100%;
    }

    to{
        background-size:110%;
    }
}

/* HERO TITLE */

.hero h1{

    color:white;

    font-size:90px;

    font-weight:800;

    text-shadow:
    0 8px 25px rgba(0,0,0,0.5);

    animation:fadeUp 1s ease;
}

/* HERO TEXT */

.hero p{

    margin-top:25px;

    color:white;

    font-size:28px;

    padding:18px 45px;

    border-radius:50px;

    background:
    rgba(255,255,255,0.15);

    backdrop-filter:blur(8px);

    animation:fadeUp 1.5s ease;
}

/* HERO BUTTON */

.hero-btn{

    margin-top:40px;

    display:inline-block;

    padding:18px 45px;

    border-radius:50px;

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #dd2476);

    color:white;

    text-decoration:none;

    font-size:22px;

    font-weight:700;

    transition:0.4s;
}

.hero-btn:hover{

    transform:scale(1.08);

    box-shadow:
    0 10px 30px rgba(221,36,118,0.45);
}

/* FADE ANIMATION */

@keyframes fadeUp{

    from{

        opacity:0;

        transform:translateY(50px);
    }

    to{

        opacity:1;

        transform:translateY(0);
    }
}

/* ================= SECTION TITLE ================= */

.section-title{

    text-align:center;

    margin-top:100px;

    margin-bottom:60px;

    font-size:60px;

    font-weight:800;

    color:#222;
}

/* ================= PET CONTAINER ================= */

.pet-container{

    width:92%;

    margin:auto;

    display:grid;

    grid-template-columns:
    repeat(auto-fit,minmax(320px,1fr));

    gap:35px;

    padding-bottom:100px;
}

/* ================= CARD ================= */

.card{

    background:white;

    border-radius:30px;

    overflow:hidden;

    position:relative;

    transition:0.4s;

    box-shadow:
    0 10px 25px rgba(0,0,0,0.08);

    display:flex;

    flex-direction:column;
}

.card:hover{

    transform:
    translateY(-12px);

    box-shadow:
    0 20px 40px rgba(0,0,0,0.15);
}

/* IMAGE */

.card img{

    width:100%;

    height:280px;

    object-fit:cover;

    transition:0.5s;
}

.card:hover img{

    transform:scale(1.05);
}

/* BADGE */

.badge{

    position:absolute;

    top:18px;

    left:18px;

    background:#ffcc00;

    color:#222;

    padding:10px 18px;

    border-radius:30px;

    font-size:15px;

    font-weight:700;

    z-index:5;

    box-shadow:
    0 4px 12px rgba(0,0,0,0.15);
}

/* CONTENT */

.card-content{

    padding:28px;

    text-align:center;

    flex-grow:1;

    display:flex;

    flex-direction:column;
}

/* TITLE */

.card-content h2{

    font-size:34px;

    font-weight:800;

    color:#222;

    margin-bottom:18px;
}

/* DETAILS */

.card-content p{

    font-size:18px;

    color:#666;

    margin-bottom:10px;
}

/* PRICE */

.price{

    margin-top:20px;

    margin-bottom:25px;

    font-size:44px;

    font-weight:800;

    color:#00a651;
}

/* BUTTON */

.buy-btn{

    margin-top:auto;

    display:inline-block;

    padding:16px 42px;

    border-radius:50px;

    text-decoration:none;

    font-size:20px;

    font-weight:700;

    color:white;

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #dd2476);

    transition:0.4s;
}

.buy-btn:hover{

    transform:scale(1.08);

    box-shadow:
    0 10px 25px rgba(221,36,118,0.35);
}

/* ================= FEATURES ================= */

.features{

    width:92%;

    margin:20px auto 100px;

    display:grid;

    grid-template-columns:
    repeat(auto-fit,minmax(250px,1fr));

    gap:30px;
}

.feature-box{

    background:white;

    border-radius:30px;

    padding:40px 30px;

    text-align:center;

    transition:0.4s;

    box-shadow:
    0 10px 25px rgba(0,0,0,0.08);
}

.feature-box:hover{

    transform:
    translateY(-10px);

    box-shadow:
    0 18px 40px rgba(0,0,0,0.15);
}

.feature-box h2{

    font-size:30px;

    margin-top:15px;

    margin-bottom:15px;

    color:#222;
}

.feature-box p{

    color:#666;

    line-height:1.7;
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

    padding:20px;

    flex-direction:column;

    gap:20px;
}

.menu{

    justify-content:center;
}

.hero h1{

    font-size:58px;
}

.hero p{

    font-size:20px;
}

.section-title{

    font-size:42px;
}

}

@media(max-width:600px){

.menu a{

    font-size:14px;

    padding:10px 16px;
}

.hero h1{

    font-size:42px;
}

.hero p{

    font-size:16px;
}

.hero-btn{

    font-size:18px;

    padding:14px 30px;
}

}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <a href="index.jsp"
       class="logo">

        🐾 Pet Paradise

    </a>

    <div class="menu">

        <a href="index.jsp"
           class="active">

            🏠 Home

        </a>

        <a href="pages/pets.jsp">

            🐶 Pets

        </a>

        <a href="pages/cart.jsp">

            🛒 Cart

        </a>

        <a href="pages/login.jsp">

            🔐 Login

        </a>

        <a href="pages/register.jsp">

            ✨ Register

        </a>

    </div>

</div>

<!-- ================= HERO ================= -->

<div class="hero">

    <h1>

        🐾 Find Your Dream Pet

    </h1>

    <p>

        Healthy • Cute • Trusted • Delivered Safely ❤️

    </p>

    <a href="pages/pets.jsp"
       class="hero-btn">

       🐶 Explore Pets

    </a>

</div>

<!-- ================= TITLE ================= -->

<h1 class="section-title">

    🐕 Featured Pets

</h1>

<!-- ================= PETS ================= -->

<div class="pet-container">

<%

for(Pet p : pets){

%>

<div class="card">

    <div class="badge">

        ⭐ Best Seller

    </div>

    <img src="<%= p.getImage() %>">

    <div class="card-content">

        <h2>

            🐾 <%= p.getName() %>

        </h2>

        <p>

            🐶 Breed:
            <%= p.getBreed() %>

        </p>

        <p>

            📂 Category:
            <%= p.getCategory() %>

        </p>

        <p>

            🎂 Age:
            <%= p.getAge() %> years

        </p>

        <div class="price">

            ₹ <%= p.getPrice() %>

        </div>

        <a href="pages/petDetails.jsp?id=<%= p.getId() %>"
           class="buy-btn">

           🛒 Buy Now

        </a>

    </div>

</div>

<%

}

%>

</div>

<!-- ================= FEATURES ================= -->

<h1 class="section-title">

    ❤️ Why Choose Us

</h1>

<div class="features">

    <div class="feature-box">

        <h2>

            🏥 Healthy Pets

        </h2>

        <p>

            All pets are vaccinated and health checked before delivery.

        </p>

    </div>

    <div class="feature-box">

        <h2>

            🚚 Fast Delivery

        </h2>

        <p>

            Safe and quick delivery directly to your doorstep.

        </p>

    </div>

    <div class="feature-box">

        <h2>

            💖 Trusted Service

        </h2>

        <p>

            Thousands of happy customers trust Pet Paradise every year.

        </p>

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

</body>

</html>