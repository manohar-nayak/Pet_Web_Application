<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

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

<title>Add Pet - Pet Paradise</title>

<link rel="stylesheet"
href="../css/navbar.css">

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

    min-height:100vh;

    background:
    linear-gradient(
    135deg,
    #eef2ff,
    #f7f9ff);

    overflow-x:hidden;
}

/* HERO */

.hero{

    width:100%;
    height:320px;

    background:
    linear-gradient(
    rgba(0,0,0,0.55),
    rgba(0,0,0,0.55)),

    url('https://images.unsplash.com/photo-1548199973-03cce0bbc87b?q=80&w=1600');

    background-size:cover;
    background-position:center;

    display:flex;
    justify-content:center;
    align-items:center;
    flex-direction:column;

    text-align:center;

    color:white;
}

.hero h1{

    font-size:72px;
    font-weight:800;

    animation:fadeUp 1s ease;
}

.hero p{

    margin-top:15px;

    font-size:24px;

    animation:fadeUp 1.3s ease;
}

/* FORM SECTION */

.form-container{

    width:100%;

    display:flex;
    justify-content:center;
    align-items:center;

    margin-top:-70px;

    padding:0 20px 80px;
}

/* FORM CARD */

.add-form{

    width:650px;

    background:
    rgba(255,255,255,0.85);

    backdrop-filter:blur(16px);

    padding:50px;

    border-radius:35px;

    box-shadow:
    0 15px 40px rgba(0,0,0,0.12);

    animation:fadeUp 1s ease;
}

.add-form h1{

    text-align:center;

    margin-bottom:40px;

    color:#222;

    font-size:54px;

    font-weight:800;
}

/* INPUT GROUP */

.input-group{

    margin-bottom:24px;
}

.input-group label{

    display:block;

    margin-bottom:10px;

    font-size:17px;

    font-weight:600;

    color:#333;
}

/* INPUTS */

.add-form input{

    width:100%;

    padding:18px 22px;

    border:none;

    border-radius:18px;

    background:#f5f7ff;

    font-size:17px;

    outline:none;

    transition:0.35s;
}

.add-form input:focus{

    transform:translateY(-3px);

    box-shadow:
    0 10px 25px rgba(221,36,118,0.18);

    border:
    2px solid #dd2476;
}

/* FILE INPUT */

.file-box{

    padding:20px;

    border:
    2px dashed #dd2476;

    border-radius:20px;

    text-align:center;

    background:#fff7fb;

    transition:0.3s;
}

.file-box:hover{

    background:#fff0f8;

    transform:scale(1.01);
}

.file-box input{

    background:none;
    border:none;
    box-shadow:none;
}

/* BUTTON */

.add-form button{

    width:100%;

    padding:20px;

    border:none;

    border-radius:60px;

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #dd2476);

    color:white;

    font-size:24px;

    font-weight:700;

    cursor:pointer;

    transition:0.4s;

    margin-top:10px;

    box-shadow:
    0 12px 28px rgba(221,36,118,0.28);
}

.add-form button:hover{

    transform:
    translateY(-5px)
    scale(1.02);

    box-shadow:
    0 18px 35px rgba(221,36,118,0.38);
}

/* ICONS */

.icon{

    font-size:20px;
    margin-right:8px;
}

/* ANIMATION */

@keyframes fadeUp{

    from{

        opacity:0;
        transform:translateY(40px);
    }

    to{

        opacity:1;
        transform:translateY(0);
    }
}

/* RESPONSIVE */

@media(max-width:768px){

.hero{

    height:260px;
}

.hero h1{

    font-size:46px;
}

.hero p{

    font-size:18px;
}

.add-form{

    width:100%;
    padding:35px;
}

.add-form h1{

    font-size:40px;
}

}

</style>

</head>

<body>

<!-- PREMIUM NAVBAR -->

<div class="navbar">

    <div class="logo">

        <span>🐾</span>

        Pet Paradise

    </div>

    <div class="menu">

        <a href="adminDashboard.jsp">

            📊 Dashboard

        </a>

        <a href="addPet.jsp"
           class="active">

            ➕ Add Pet

        </a>

        <a href="managePets.jsp">

            🐶 Manage Pets

        </a>

        <a href="manageOrders.jsp">

            📦 Manage Orders

        </a>

        <a href="../logout">

            🚪 Logout

        </a>

    </div>

</div>

<!-- HERO -->

<div class="hero">

    <h1>

        Add New Pet 🐾

    </h1>

    <p>

        Upload adorable pets for your customers

    </p>

</div>

<!-- FORM -->

<div class="form-container">

<div class="add-form">

<h1>

    Pet Details

</h1>

<form action="../uploadPet"
      method="post"
      enctype="multipart/form-data">

    <div class="input-group">

        <label>

            <span class="icon">🐶</span>

            Pet Name

        </label>

        <input type="text"
               name="name"
               placeholder="Enter Pet Name"
               required>

    </div>

    <div class="input-group">

        <label>

            <span class="icon">🧬</span>

            Breed

        </label>

        <input type="text"
               name="breed"
               placeholder="Enter Breed"
               required>

    </div>

    <div class="input-group">

        <label>

            <span class="icon">📂</span>

            Category

        </label>

        <input type="text"
               name="category"
               placeholder="Dog / Cat / Bird"
               required>

    </div>

    <div class="input-group">

        <label>

            <span class="icon">🎂</span>

            Age

        </label>

        <input type="number"
               name="age"
               placeholder="Enter Age"
               required>

    </div>

    <div class="input-group">

        <label>

            <span class="icon">💰</span>

            Price

        </label>

        <input type="number"
               name="price"
               placeholder="Enter Price"
               required>

    </div>

    <div class="input-group">

        <label>

            <span class="icon">📸</span>

            Upload Image

        </label>

        <div class="file-box">

            <input type="file"
                   name="image"
                   accept="image/*"
                   required>

        </div>

    </div>

    <button type="submit">

        ✨ Add Pet Now

    </button>

</form>

</div>

</div>

</body>

</html>