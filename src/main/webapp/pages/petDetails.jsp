<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="dao.PetDAO" %>
<%@ page import="model.Pet" %>

<%

String id =
request.getParameter("id");

PetDAO dao =
new PetDAO();

Pet p =
dao.getPetById(
Integer.parseInt(id));

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Pet Details</title>

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

    background:
    linear-gradient(
    135deg,
    #f6f7fb,
    #edf1ff);

    overflow-x:hidden;
}

/* NAVBAR */

.navbar{

    width:100%;

    padding:22px 70px;

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

    z-index:1000;

    box-shadow:
    0 6px 18px rgba(0,0,0,0.15);
}

.logo{

    color:white;

    font-size:42px;

    font-weight:800;
}

.menu a{

    color:white;

    text-decoration:none;

    font-size:20px;

    font-weight:600;

    padding:12px 24px;

    border-radius:40px;

    transition:0.3s;
}

.menu a:hover{

    background:
    rgba(255,255,255,0.18);
}

/* HERO */

.hero{

    width:100%;

    height:280px;

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

    font-size:70px;

    font-weight:800;

    margin-bottom:15px;
}

.hero p{

    font-size:24px;

    opacity:0.95;
}

/* MAIN CARD */

.details-container{

    width:88%;

    margin:-70px auto 60px;

    background:white;

    border-radius:35px;

    overflow:hidden;

    display:flex;

    align-items:center;

    gap:55px;

    padding:50px;

    box-shadow:
    0 18px 40px rgba(0,0,0,0.12);

    position:relative;
}

/* IMAGE */

.details-image{

    flex:1;

    position:relative;
}

.details-image img{

    width:100%;

    height:560px;

    object-fit:cover;

    border-radius:28px;

    transition:0.5s;
}

.details-image img:hover{

    transform:scale(1.03);
}

/* BADGE */

.badge{

    position:absolute;

    top:20px;

    left:20px;

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #ff006e);

    color:white;

    padding:12px 24px;

    border-radius:50px;

    font-size:18px;

    font-weight:700;

    box-shadow:
    0 10px 25px rgba(255,0,110,0.3);
}

/* CONTENT */

.details-content{

    flex:1;
}

.details-content h1{

    font-size:68px;

    color:#222;

    margin-bottom:18px;

    font-weight:800;

    line-height:1.1;
}

/* RATING */

.rating{

    font-size:24px;

    color:#ffb400;

    margin-bottom:28px;
}

.info-box{

    background:#f8f9ff;

    border-radius:24px;

    padding:30px;

    margin-bottom:30px;
}

.info-row{

    display:flex;

    justify-content:space-between;

    padding:18px 0;

    border-bottom:
    1px solid #e4e7f3;

    font-size:22px;
}

.info-row:last-child{

    border:none;
}

.info-title{

    font-weight:700;

    color:#222;
}

.info-value{

    color:#666;
}

/* PRICE */

.price-box{

    background:
    linear-gradient(
    135deg,
    #e8fff0,
    #f3fff7);

    border-radius:25px;

    padding:30px;

    text-align:center;

    margin-bottom:30px;
}

.price-label{

    font-size:24px;

    color:#666;

    margin-bottom:10px;
}

.details-price{

    font-size:68px;

    color:#00a651;

    font-weight:800;
}

/* DESCRIPTION */

.details-description{

    font-size:22px;

    color:#666;

    line-height:1.8;

    margin-bottom:35px;
}

/* FEATURES */

.features{

    display:flex;

    flex-wrap:wrap;

    gap:18px;

    margin-bottom:40px;
}

.feature{

    background:#f5f6ff;

    padding:14px 22px;

    border-radius:50px;

    font-size:18px;

    font-weight:600;

    color:#444;
}

/* BUTTONS */

.action-buttons{

    display:flex;

    gap:25px;

    flex-wrap:wrap;
}

.action-buttons button{

    border:none;

    padding:20px 38px;

    border-radius:60px;

    font-size:22px;

    font-weight:700;

    cursor:pointer;

    transition:0.4s;

    color:white;
}

/* PAYMENT */

.payment-btn{

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #ff006e);

    box-shadow:
    0 15px 35px rgba(255,0,110,0.35);
}

.payment-btn:hover{

    transform:
    translateY(-6px)
    scale(1.04);
}

/* CART */

.cart-btn{

    background:
    linear-gradient(
    135deg,
    #00b09b,
    #96c93d);

    box-shadow:
    0 12px 28px rgba(0,176,155,0.3);
}

.cart-btn:hover{

    transform:
    translateY(-6px)
    scale(1.04);
}

/* RESPONSIVE */

@media(max-width:1000px){

.details-container{

    flex-direction:column;
}

.details-content h1{

    font-size:52px;
}

.hero h1{

    font-size:48px;
}

.details-image img{

    height:400px;
}

.action-buttons{

    flex-direction:column;
}

.action-buttons button{

    width:100%;
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

    <div class="menu">

        <a href="pets.jsp">

            ← Back

        </a>

    </div>

</div>

<!-- HERO -->

<div class="hero">

    <h1>

        Meet Your New Best Friend 🐶

    </h1>

    <p>

        Healthy • Cute • Trusted Companion 💖

    </p>

</div>

<!-- DETAILS -->

<div class="details-container">

    <!-- IMAGE -->

    <div class="details-image">

        <div class="badge">

            ⭐ Premium Pet

        </div>

        <img src="<%= p.getImage() %>">

    </div>

    <!-- CONTENT -->

    <div class="details-content">

        <h1>

            <%= p.getName() %>

        </h1>

        <div class="rating">

            ⭐⭐⭐⭐⭐ 4.9 Rating

        </div>

        <!-- INFO -->

        <div class="info-box">

            <div class="info-row">

                <span class="info-title">

                    Breed

                </span>

                <span class="info-value">

                    <%= p.getBreed() %>

                </span>

            </div>

            <div class="info-row">

                <span class="info-title">

                    Category

                </span>

                <span class="info-value">

                    <%= p.getCategory() %>

                </span>

            </div>

            <div class="info-row">

                <span class="info-title">

                    Age

                </span>

                <span class="info-value">

                    <%= p.getAge() %> years

                </span>

            </div>

        </div>

        <!-- PRICE -->

        <div class="price-box">

            <div class="price-label">

                Price

            </div>

            <div class="details-price">

                ₹ <%= p.getPrice() %>

            </div>

        </div>

        <!-- DESCRIPTION -->

        <p class="details-description">

            This adorable pet is fully healthy,
            vaccinated,
            playful,
            and ready to become your perfect family companion.
            Bring happiness and unconditional love into your home today 💖

        </p>

        <!-- FEATURES -->

        <div class="features">

            <div class="feature">

                ✅ Vaccinated

            </div>

            <div class="feature">

                🏥 Health Checked

            </div>

            <div class="feature">

                ❤️ Friendly Nature

            </div>

            <div class="feature">

                🚚 Safe Delivery

            </div>

        </div>

        <!-- BUTTONS -->

        <div class="action-buttons">

            <!-- PAYMENT -->

            <form action="checkout.jsp"
      method="get">

    <input type="hidden"
           name="pet"
           value="<%= p.getName() %>">

    <input type="hidden"
           name="total"
           value="<%= p.getPrice() %>">

    <input type="hidden"
           name="image"
           value="<%= p.getImage() %>">

    <button type="submit"
            class="payment-btn">

        ✨ Proceed To Payment

    </button>

</form>

            <!-- CART -->

            <form action="../addToCart"
                  method="post">

                <input type="hidden"
                       name="id"
                       value="<%= p.getId() %>">

                <button type="submit"
                        class="cart-btn">

                    🛒 Add To Cart

                </button>

            </form>

        </div>

    </div>

</div>

</body>

</html>