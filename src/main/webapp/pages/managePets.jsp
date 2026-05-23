<%@ page import="java.util.List" %>
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

PetDAO dao =
new PetDAO();

List<Pet> pets =
dao.getAllPets();

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Manage Pets - Pet Paradise</title>

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

    animation:fadeDown 1s ease;
}

.hero p{

    margin-top:15px;

    font-size:24px;

    animation:fadeUp 1.2s ease;
}

/* PET CONTAINER */

.pet-container{

    width:92%;

    margin:-70px auto 80px;

    display:grid;

    grid-template-columns:
    repeat(auto-fit,minmax(330px,1fr));

    gap:35px;
}

/* CARD */

.pet-card{

    background:white;

    border-radius:35px;

    overflow:hidden;

    box-shadow:
    0 18px 40px rgba(0,0,0,0.10);

    transition:0.4s;

    animation:fadeUp 1s ease;

    display:flex;

    flex-direction:column;
}

.pet-card:hover{

    transform:
    translateY(-12px);

    box-shadow:
    0 28px 55px rgba(0,0,0,0.18);
}

/* IMAGE */

.pet-card img{

    width:100%;
    height:280px;

    object-fit:cover;

    transition:0.5s;
}

.pet-card:hover img{

    transform:scale(1.05);
}

/* CONTENT */

.pet-content{

    padding:32px;

    text-align:center;

    flex:1;

    display:flex;

    flex-direction:column;

    justify-content:space-between;
}

/* NAME */

.pet-name{

    font-size:42px;

    font-weight:800;

    color:#222;

    line-height:1.2;

    margin-bottom:25px;
}

/* DETAILS */

.pet-detail{

    font-size:19px;

    color:#555;

    margin-bottom:16px;

    line-height:1.7;
}

.pet-detail strong{

    color:#111;
}

/* PRICE */

.price{

    margin-top:25px;

    font-size:44px;

    font-weight:800;

    color:#00a651;
}

/* BUTTONS */

.btn-group{

    margin-top:35px;

    display:flex;

    justify-content:center;

    gap:18px;

    flex-wrap:wrap;
}

/* EDIT BUTTON */

.edit-btn{

    text-decoration:none;

    background:
    linear-gradient(
    135deg,
    #396afc,
    #2948ff);

    color:white;

    padding:15px 30px;

    border-radius:50px;

    font-size:16px;

    font-weight:700;

    transition:0.35s;

    box-shadow:
    0 12px 25px rgba(41,72,255,0.25);
}

.edit-btn:hover{

    transform:
    translateY(-5px)
    scale(1.05);

    box-shadow:
    0 18px 35px rgba(41,72,255,0.35);
}

/* DELETE BUTTON */

.delete-btn{

    text-decoration:none;

    background:
    linear-gradient(
    135deg,
    #ff3b3b,
    #ff0000);

    color:white;

    padding:15px 30px;

    border-radius:50px;

    font-size:16px;

    font-weight:700;

    transition:0.35s;

    box-shadow:
    0 12px 25px rgba(255,0,0,0.25);
}

.delete-btn:hover{

    transform:
    translateY(-5px)
    scale(1.05);

    box-shadow:
    0 18px 35px rgba(255,0,0,0.35);
}

/* EMPTY */

.no-pets{

    width:90%;

    margin:80px auto;

    background:white;

    padding:80px;

    border-radius:35px;

    text-align:center;

    font-size:36px;

    font-weight:700;

    color:#666;

    box-shadow:
    0 15px 35px rgba(0,0,0,0.08);
}

/* ANIMATION */

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

@keyframes fadeDown{

    from{
        opacity:0;
        transform:translateY(-50px);
    }

    to{
        opacity:1;
        transform:translateY(0);
    }
}

/* RESPONSIVE */

@media(max-width:900px){

.hero{

    height:260px;
}

.hero h1{

    font-size:48px;
}

.hero p{

    font-size:18px;
}

.pet-container{

    grid-template-columns:1fr;
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

        <a class="active"
        href="managePets.jsp">

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

        🐶 Manage Pets

    </h1>

    <p>

        Edit and manage all uploaded pets

    </p>

</div>

<%

if(pets.size() > 0){

%>

<!-- PETS -->

<div class="pet-container">

<%

for(Pet p : pets){

%>

<div class="pet-card">

    <img src="<%= p.getImage() %>">

    <div class="pet-content">

        <div>

            <div class="pet-name">

                🐾 <%= p.getName() %>

            </div>

            <div class="pet-detail">

                <strong>Breed:</strong>

                <%= p.getBreed() %>

            </div>

            <div class="pet-detail">

                <strong>Category:</strong>

                <%= p.getCategory() %>

            </div>

            <div class="pet-detail">

                <strong>Age:</strong>

                <%= p.getAge() %> years

            </div>

            <div class="price">

                ₹ <%= p.getPrice() %>

            </div>

        </div>

        <div class="btn-group">

            <a class="edit-btn"
href="editPet.jsp?id=<%= p.getId() %>">

                ✏ Edit

            </a>

            <a class="delete-btn"
href="../deletePet?id=<%= p.getId() %>">

                ❌ Delete

            </a>

        </div>

    </div>

</div>

<%

}

%>

</div>

<%

}else{

%>

<div class="no-pets">

    🐾 No Pets Available

</div>

<%

}

%>

</body>

</html>