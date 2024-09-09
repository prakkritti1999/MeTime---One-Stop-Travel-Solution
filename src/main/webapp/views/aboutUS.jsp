<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - MeTime</title>
    <link rel="stylesheet" type="text/css" href="/css/homeCSS.css">
    <style>
        .about-container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
        }
        .about-heading {
            text-align: center;
            color: #001861;
            margin-bottom: 20px;
        }
        .about-content {
            font-size: 20px;
            line-height: 1.6;
            color: #333;
            font-family: Times New Roman;
            justify-content: space-between;
        }
        .highlight {
            color: #FFD700;
            font-weight: bold;
        }
        .section {
            margin-bottom: 20px;
            color: #FFD700;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"></jsp:include>
    <div class="about-container">
        <h1 class="about-heading">About MeTime</h1>
        <div class="about-content">
            <div class="section">
                <p><span class="highlight">MeTime</span> was formed in 2024 with the mission to redefine the travel experience. Our company specializes in providing top-notch travel and tour packages that cater to all your needs.</p>
            </div>
            <div class="section">
                <p>At MeTime, we pride ourselves on offering <span class="highlight">all the luxuries of traveling</span>. Whether you're planning a relaxing honeymoon, an adventurous trip, or a grand international tour, we have it all covered.</p>
            </div>
            <h5><b>Why METIME</b></h5>
            <div class="section">
                <p>We understand the hassle of finding a reliable travel agency. That's why we aim to <span class="highlight">remove your problem</span> by providing a one-stop solution for all your travel needs. Our services include a variety of travel options, from affordable packages to <span class="highlight">customizable rates</span>.</p>
            </div>
            <div class="section">
                <p>Our <span class="highlight">best tour guides</span> ensure you have a memorable and enriching travel experience. Additionally, we offer a wide range of transportation options, including <span class="highlight">all types of buses</span> to suit your comfort and convenience.</p>
            </div>
            <div class="section">
                <p>Whether you're looking for <span class="highlight">adventure</span>, <span class="highlight">honeymoon</span>, or any other type of travel, MeTime is here to make your journey exceptional. Explore our diverse packages and let us make your travel dreams a reality.</p>
            </div>
        </div>
    </div>
    
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
