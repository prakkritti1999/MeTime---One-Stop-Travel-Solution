<%@page import="com.metime.dao.Trips"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>It's ME TIME NOW!!!!</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="/css/homeCSS.css">

<!-- For CSRF Tokens -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

</head>
<body>

<!-- Navigation Bar -->
<jsp:include page="navbar.jsp"></jsp:include>

<div class="container" style="padding-bottom: 50px;">

	<!-- Search Bar -->
    <div class="row">
        <div class="col-md-12 text-right search-bar">
            <input type="text" id="searchInput" name="keyword" class="form-control" placeholder="Search Tours/Destinations....." style="max-width: 300px; display: inline-block;">
            <button type="button" class="btn btn-primary" onclick="searchResults()"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
        
        <div id="searchDiv"></div>
    </div>
	
	<!-- Cards showing available trips options -->
    <jsp:include page="/fragments/tripCards.jsp"></jsp:include>
	
	<!-- Customers' Feedbacks -->
	<jsp:include page="/fragments/corousel.jsp"></jsp:include>

</div>	

<!-- Trips Details Modal -->
<jsp:include page="/fragments/detailsModal.jsp"></jsp:include>


<!-- Update Delete functionality for Admins Modal -->
<jsp:include page="/fragments/updateModal.jsp"></jsp:include>

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript" src="/js/homeSearchJS.js"></script>
<script type="text/javascript" src="/js/homeModalJS.js"></script>
<script type="text/javascript" src="/js/displayJS.js"></script>
<script type="text/javascript" src="/js/corouselJS.js"></script>
<script type="text/javascript" src="/js/bookingsJS.js"></script>
</body>
</html>