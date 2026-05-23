<%@ page import="dao.PetDAO" %>
<%@ page import="model.Pet" %>

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

int id =
Integer.parseInt(
request.getParameter("id"));

PetDAO dao =
new PetDAO();

Pet p =
dao.getPetById(id);

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Pet - Pet Paradise</title>

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

    url('https://images.unsplash.com/photo-1517849845537-4d257902454a?q=80&w=1600');

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

.edit-form{

    width:700px;

    background:
    rgba(255,255,255,0.88);

    backdrop-filter:blur(16px);

    padding:50px;

    border-radius:35px;

    box-shadow:
    0 15px 40px rgba(0,0,0,0.12);

    animation:fadeUp 1s ease;
}

/* TITLE */

.edit-form h1{

    text-align:center;

    margin-bottom:35px;

    color:#222;

    font-size:54px;

    font-weight:800;
}

/* IMAGE */

.preview-box{

    width:100%;

    display:flex;
    justify-content:center;

    margin-bottom:35px;
}

.preview-box img{

    width:260px;
    height:260px;

    object-fit:cover;

    border-radius:30px;

    box-shadow:
    0 12px 28px rgba(0,0,0,0.18);

    transition:0.4s;
}

.preview-box img:hover{

    transform:
    scale(1.04);
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

.edit-form input{

    width:100%;

    padding:18px 22px;

    border:none;

    border-radius:18px;

    background:#f5f7ff;

    font-size:17px;

    outline:none;

    transition:0.35s;
}

.edit-form input:focus{

    transform:translateY(-3px);

    box-shadow:
    0 10px 25px rgba(221,36,118,0.18);

    border:
    2px solid #dd2476;
}

/* BUTTON */

.edit-form button{

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

.edit-form button:hover{

    transform:
    translateY(-5px)
    scale(1.02);

    box-shadow:
    0 18px 35px rgba(221,36,118,0.38);
}

/* ICON */

.icon{

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

    font-size:48px;
}

.hero p{

    font-size:18px;
}

.edit-form{

    width:100%;
    padding:35px;
}

.edit-form h1{

    font-size:40px;
}

.preview-box img{

    width:200px;
    height:200px;
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

        <a href="adminDashboard.jsp">

            📊 Dashboard

        </a>

        <a href="addPet.jsp">

            ➕ Add Pet

        </a>

        <a href="managePets.jsp"
           class="active">

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

        Edit Pet 🐾

    </h1>

    <p>

        Update pet information beautifully

    </p>

</div>

<!-- FORM -->

<div class="form-container">

<div class="edit-form">

<h1>

    ✨ Edit Details

</h1>

<!-- IMAGE -->

<div class="preview-box">

    <img src="<%= p.getImage() %>">

</div>

<form action="../updatePet"
      method="post">

    <input type="hidden"
           name="id"
           value="<%= p.getId() %>">

    <div class="input-group">

        <label>

            <span class="icon">🐶</span>

            Pet Name

        </label>

        <input type="text"
               name="name"
               value="<%= p.getName() %>"
               required>

    </div>

    <div class="input-group">

        <label>

            <span class="icon">🧬</span>

            Breed

        </label>

        <input type="text"
               name="breed"
               value="<%= p.getBreed() %>"
               required>

    </div>

    <div class="input-group">

        <label>

            <span class="icon">📂</span>

            Category

        </label>

        <input type="text"
               name="category"
               value="<%= p.getCategory() %>"
               required>

    </div>

    <div class="input-group">

        <label>

            <span class="icon">🎂</span>

            Age

        </label>

        <input type="number"
               name="age"
               value="<%= p.getAge() %>"
               required>

    </div>

    <div class="input-group">

        <label>

            <span class="icon">💰</span>

            Price

        </label>

        <input type="number"
               name="price"
               value="<%= p.getPrice() %>"
               required>

    </div>

    <div class="input-group">

        <label>

            <span class="icon">📸</span>

            Image Path

        </label>

        <input type="text"
               name="image"
               value="<%= p.getImage() %>"
               required>

    </div>

    <button type="submit">

        ✨ Update Pet

    </button>

</form>

</div>

</div>

</body>

</html>