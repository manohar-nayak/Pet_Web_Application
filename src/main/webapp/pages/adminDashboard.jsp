<%@ page import="dao.PetDAO" %>
<%@ page import="dao.OrderDAO" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="model.Order" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

String username =
(String)session.getAttribute("username");

if(username == null){

    response.sendRedirect("login.jsp");

    return;
}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>🐾 Pet Paradise Admin</title>

<link href=
"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
rel="stylesheet">

<script src=
"https://cdn.jsdelivr.net/npm/chart.js">
</script>

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
    #eef2ff,
    #f7f9ff);

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

.logo{

    color:white;

    font-size:30px;

    font-weight:800;

    display:flex;

    align-items:center;

    gap:10px;
}

.menu{

    display:flex;

    align-items:center;

    gap:18px;

    flex-wrap:wrap;

    white-space:nowrap;
}

.menu a{

    color:white;

    text-decoration:none;

    font-size:16px;

    font-weight:600;

    padding:12px 22px;

    border-radius:50px;

    transition:0.35s;

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

    width:100%;

    height:340px;

    background:
    linear-gradient(
    rgba(0,0,0,0.60),
    rgba(0,0,0,0.60)),

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

    animation:fadeUp 1.2s ease;
}

/* ================= DASHBOARD ================= */

.dashboard{

    width:92%;

    margin:-70px auto 60px;

    display:grid;

    grid-template-columns:
    repeat(auto-fit,minmax(260px,1fr));

    gap:30px;
}

/* ================= CARDS ================= */

.card{

    position:relative;

    overflow:hidden;

    border-radius:32px;

    padding:35px;

    color:white;

    box-shadow:
    0 15px 35px rgba(0,0,0,0.12);

    transition:0.4s;
}

.card:hover{

    transform:
    translateY(-10px)
    scale(1.03);
}

.card::before{

    content:'';

    position:absolute;

    width:180px;
    height:180px;

    border-radius:50%;

    background:
    rgba(255,255,255,0.12);

    top:-70px;
    right:-70px;
}

.card-icon{

    width:78px;
    height:78px;

    border-radius:24px;

    background:
    rgba(255,255,255,0.18);

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:38px;

    margin-bottom:25px;
}

.card h1{

    font-size:58px;

    font-weight:800;
}

.card p{

    margin-top:12px;

    font-size:22px;
}

/* COLORS */

.card1{

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #ff9966);
}

.card2{

    background:
    linear-gradient(
    135deg,
    #11998e,
    #38ef7d);
}

.card3{

    background:
    linear-gradient(
    135deg,
    #396afc,
    #2948ff);
}

.card4{

    background:
    linear-gradient(
    135deg,
    #8e2de2,
    #ff6fd8);
}

/* ================= TITLE ================= */

.section-title{

    width:92%;

    margin:auto;
}

.section-title h2{

    font-size:42px;

    color:#222;

    font-weight:800;
}

/* ================= TABLE ================= */

.table-box{

    width:92%;

    margin:25px auto 60px;

    background:
    rgba(255,255,255,0.92);

    border-radius:30px;

    padding:28px;

    box-shadow:
    0 10px 25px rgba(0,0,0,0.08);
}

table{

    width:100%;

    border-collapse:collapse;
}

table th{

    background:
    linear-gradient(
    135deg,
    #ff512f,
    #dd2476);

    color:white;

    padding:18px;

    font-size:18px;
}

table td{

    padding:20px;

    text-align:center;

    border-bottom:
    1px solid #eee;

    font-size:17px;
}

.no-orders{

    padding:35px;

    font-size:22px;

    color:#777;
}

/* ================= CHARTS ================= */

.chart-section{

    width:92%;

    margin:20px auto 90px;

    display:grid;

    grid-template-columns:
    repeat(auto-fit,minmax(380px,1fr));

    gap:28px;
}

.chart-card{

    background:
    rgba(255,255,255,0.96);

    border-radius:30px;

    padding:28px;

    height:420px;

    position:relative;

    overflow:hidden;

    box-shadow:
    0 12px 28px rgba(0,0,0,0.08);

    transition:0.35s;
}

.chart-card:hover{

    transform:
    translateY(-8px);

    box-shadow:
    0 18px 40px rgba(0,0,0,0.12);
}

.chart-card::before{

    content:'';

    position:absolute;

    width:160px;
    height:160px;

    background:
    rgba(255,255,255,0.25);

    border-radius:50%;

    top:-70px;
    right:-70px;
}

.chart-card h2{

    font-size:30px;

    margin-bottom:20px;

    color:#222;

    font-weight:800;
}

.chart-box{

    width:100%;

    height:300px;

    position:relative;
}

.chart-box canvas{

    width:100% !important;

    height:100% !important;
}

/* ================= ANIMATION ================= */

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

.hero h1{

    font-size:46px;
}

.hero p{

    font-size:18px;
}

.chart-section{

    grid-template-columns:1fr;
}

}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <div class="logo">

        🐾 Pet Paradise

    </div>

    <div class="menu">

        <a class="active"
        href="adminDashboard.jsp">

            📊 Dashboard

        </a>

        <a href="addPet.jsp">

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

<!-- ================= HERO ================= -->

<div class="hero">

    <h1>

        📈 Admin Dashboard

    </h1>

    <p>

        Monitor pets, users, orders and revenue

    </p>

</div>

<!-- ================= DASHBOARD ================= -->

<div class="dashboard">

<div class="card card1">

    <div class="card-icon">

        🐶

    </div>

    <h1>

<%= new PetDAO().getAllPets().size() %>

    </h1>

    <p>Total Pets</p>

</div>

<div class="card card2">

    <div class="card-icon">

        📦

    </div>

    <h1>

<%= new OrderDAO().getAllOrders().size() %>

    </h1>

    <p>Total Orders</p>

</div>

<div class="card card3">

    <div class="card-icon">

        👥

    </div>

    <h1>

<%= new UserDAO().getAllUsers().size() %>

    </h1>

    <p>Total Users</p>

</div>

<div class="card card4">

    <div class="card-icon">

        💰

    </div>

    <h1>

₹ <%= new OrderDAO().getTotalRevenue() %>

    </h1>

    <p>Total Revenue</p>

</div>

</div>

<!-- ================= RECENT ORDERS ================= -->

<div class="section-title">

<h2>

🛒 Recent Orders

</h2>

</div>

<div class="table-box">

<table>

<tr>

<th>Customer</th>
<th>Pet Name</th>
<th>Payment</th>
<th>Amount</th>

</tr>

<%

OrderDAO orderDAO =
new OrderDAO();

List<Order> orders =
orderDAO.getAllOrders();

if(orders.size() > 0){

for(Order o : orders){

%>

<tr>

<td>

<%= o.getUsername() %>

</td>

<td>

<%= o.getPetname() %>

</td>

<td>

<%= o.getPayment() %>

</td>

<td>

₹ <%= o.getTotal() %>

</td>

</tr>

<%
}

}else{
%>

<tr>

<td colspan="4"
class="no-orders">

😔 No Orders Found

</td>

</tr>

<%
}
%>

</table>

</div>

<!-- ================= CHARTS ================= -->

<div class="chart-section">

<div class="chart-card">

<h2>

📊 Orders Analytics

</h2>

<div class="chart-box">

<canvas id="ordersChart"></canvas>

</div>

</div>

<div class="chart-card">

<h2>

💸 Revenue Analytics

</h2>

<div class="chart-box">

<canvas id="revenueChart"></canvas>

</div>

</div>

</div>

<script>

new Chart(
document.getElementById(
"ordersChart"),

{

type:'bar',

data:{

labels:[
'Pets',
'Orders',
'Users'
],

datasets:[{

label:'Analytics',

data:[

<%= new PetDAO().getAllPets().size() %>,

<%= new OrderDAO().getAllOrders().size() %>,

<%= new UserDAO().getAllUsers().size() %>

],

backgroundColor:[

'#ff512f',
'#00c853',
'#2962ff'

],

borderRadius:18,

barThickness:55

}]
},

options:{

responsive:true,

maintainAspectRatio:false,

plugins:{

legend:{
display:false
}

},

scales:{

y:{

beginAtZero:true,

grid:{

color:'rgba(0,0,0,0.05)'
}

},

x:{

grid:{

display:false
}

}

}

}

});

new Chart(

document.getElementById(
"revenueChart"),

{

type:'doughnut',

data:{

labels:[
'Revenue',
'Remaining Goal'
],

datasets:[{

data:[

<%= new OrderDAO().getTotalRevenue() %>,

100000

],

backgroundColor:[

'#8e2de2',
'#ececec'

],

borderWidth:0,

hoverOffset:12

}]
},

options:{

responsive:true,

maintainAspectRatio:false,

cutout:'68%',

plugins:{

legend:{

position:'top'
}

}

}

});

</script>

</body>

</html>