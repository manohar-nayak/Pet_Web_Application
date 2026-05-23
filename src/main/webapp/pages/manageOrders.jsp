<%@ page import="java.util.List" %>
<%@ page import="dao.OrderDAO" %>
<%@ page import="dao.PetDAO" %>
<%@ page import="model.Order" %>

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

OrderDAO dao =
new OrderDAO();

PetDAO petDao =
new PetDAO();

List<Order> orders =
dao.getAllOrders();

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Manage Orders - Pet Paradise</title>

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

/* HERO SECTION */

.hero{

    width:100%;
    height:330px;

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
}

.hero p{

    margin-top:15px;

    font-size:24px;
}

/* TABLE SECTION */

.table-section{

    width:95%;

    margin:-70px auto 80px;
}

/* TABLE BOX */

.table-box{

    background:white;

    border-radius:35px;

    overflow:hidden;

    box-shadow:
    0 18px 40px rgba(0,0,0,0.12);

    padding:35px;
}

/* TABLE */

table{

    width:100%;
    border-collapse:collapse;
}

/* HEADINGS */

table th{

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #dd2476);

    color:white;

    padding:22px;

    font-size:18px;

    text-align:center;
}

/* DATA */

table td{

    padding:24px;

    text-align:center;

    border-bottom:
    1px solid #f1f1f1;

    font-size:17px;

    color:#444;
}

/* ROW HOVER */

table tr:hover{

    background:#f9fbff;
}

/* PET IMAGE */

.pet-info{

    display:flex;

    align-items:center;

    justify-content:center;

    gap:14px;
}

.pet-img{

    width:70px;

    height:70px;

    object-fit:cover;

    border-radius:18px;

    box-shadow:
    0 6px 15px rgba(0,0,0,0.12);

    transition:0.3s;
}

.pet-img:hover{

    transform:scale(1.08);
}

.pet-info span{

    font-size:18px;

    font-weight:700;

    color:#222;
}

/* PAYMENT */

.payment{

    background:#eef2ff;

    color:#2948ff;

    padding:10px 20px;

    border-radius:50px;

    font-size:15px;

    font-weight:700;

    display:inline-block;
}

/* STATUS */

.status{

    padding:10px 18px;

    border-radius:50px;

    color:white;

    font-size:15px;

    font-weight:700;

    display:inline-block;
}

.pending{

    background:#ff9800;
}

.delivered{

    background:#00b894;
}

.cancelled{

    background:#ff3b3b;
}

/* AMOUNT */

.amount{

    color:#00a651;

    font-size:24px;

    font-weight:800;
}

/* ACTION BUTTONS */

.action-box{

    display:flex;

    justify-content:center;

    gap:10px;

    flex-wrap:wrap;
}

.deliver-btn{

    background:
    linear-gradient(
    135deg,
    #00b894,
    #00d26a);

    color:white;

    border:none;

    padding:12px 18px;

    border-radius:50px;

    font-size:14px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.deliver-btn:hover{

    transform:scale(1.05);
}

.cancel-btn{

    background:
    linear-gradient(
    135deg,
    #ff3b3b,
    #ff0000);

    color:white;

    border:none;

    padding:12px 18px;

    border-radius:50px;

    font-size:14px;

    font-weight:700;

    cursor:pointer;

    transition:0.3s;
}

.cancel-btn:hover{

    transform:scale(1.05);
}

/* EMPTY */

.no-orders{

    text-align:center;

    padding:80px;

    font-size:34px;

    font-weight:700;

    color:#777;
}

/* RESPONSIVE */

@media(max-width:900px){

.hero{

    height:260px;
}

.hero h1{

    font-size:46px;
}

.hero p{

    font-size:18px;
}

.table-box{

    overflow-x:auto;
}

table{

    min-width:1500px;
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

        <a href="managePets.jsp">

            🐶 Manage Pets

        </a>

        <a class="active"
        href="manageOrders.jsp">

            🛒 Manage Orders

        </a>

        <a href="../logout">

            🚪 Logout

        </a>

    </div>

</div>

<!-- HERO -->

<div class="hero">

    <h1>

        🛒 Manage Orders

    </h1>

    <p>

        View customer purchases and payment details

    </p>

</div>

<!-- TABLE -->

<div class="table-section">

<div class="table-box">

<%

if(orders.size() > 0){

%>

<table>

<tr>

<th>👤 Customer</th>
<th>🐶 Pet</th>
<th>📞 Phone</th>
<th>📍 Address</th>
<th>💳 Payment</th>
<th>💰 Amount</th>
<th>📦 Status</th>
<th>⚙ Actions</th>

</tr>

<%

for(Order o : orders){

String status =
o.getStatus();

if(status == null ||
status.trim().equals("")){

    status = "Pending";
}

String statusClass =
"pending";

if(status.equalsIgnoreCase(
"Delivered")){

    statusClass =
    "delivered";
}

if(status.equalsIgnoreCase(
"Cancelled")){

    statusClass =
    "cancelled";
}

String petImage =
petDao.getPetImageByName(
o.getPetname());

%>

<tr>

<td>

<%= o.getUsername() %>

</td>

<td>

<div class="pet-info">

    <img src="<%= petImage %>"
         class="pet-img">

    <span>

        <%= o.getPetname() %>

    </span>

</div>

</td>

<td>

<%= o.getPhone() %>

</td>

<td>

<%= o.getAddress() %>

</td>

<td>

<span class="payment">

<%= o.getPayment() %>

</span>

</td>

<td class="amount">

₹ <%= o.getTotal() %>

</td>

<td>

<span class=
"status <%= statusClass %>">

<%= status %>

</span>

</td>

<td>

<%

if(status.equalsIgnoreCase(
"Pending")){

%>

<div class="action-box">

<a href="../updateOrderStatus?id=<%= o.getId() %>&status=Delivered">

<button class="deliver-btn">

✅ Deliver

</button>

</a>

<a href="../updateOrderStatus?id=<%= o.getId() %>&status=Cancelled">

<button class="cancel-btn">

❌ Cancel

</button>

</a>

</div>

<%

}else{

%>

<b>

✔ Action Completed

</b>

<%

}

%>

</td>

</tr>

<%

}

%>

</table>

<%

}else{

%>

<div class="no-orders">

    🛒 No Orders Found

</div>

<%

}

%>

</div>

</div>

</body>

</html>