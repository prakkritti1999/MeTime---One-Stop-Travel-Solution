<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List"%>
<%@page import="com.metime.dao.Trips"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>All Trips</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-nUhaeFfvjWWk0Z6U0T8r8s3eULF7U/9T9fPR1DkCftCVCi1eZClu8yBBhS1Xw+QC" crossorigin="anonymous">

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


<!-- Include jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>


</head> 	
<body>

</body>
<nav class="navbar navbar-expand-lg navbar" style="background-color: #001861; width: auto; height: 100px; align-items: center;">
	  <div class="container-fluid mx-4">
	    <a class="navbar-brand mx-4" href="#">ME TIME is HERE</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse d-flex justify-content-end " id="navbarNav">
	      <ul class="navbar-nav">
	        <li class="nav-item mx-2">
	          <a class="nav-link active" aria-current="page" href="/MeTime/home">Home</a>
	        </li>
	        <li class="nav-item mx-2">
	          <a class="nav-link" href="getTrips">View All Trips</a>
	        </li>
	        <li class="nav-item mx-2">
	          <a class="nav-link" href="addForm">Add New Trip</a>
	        </li>
	        <li class="nav-item mx-2">
	          <a class="nav-link" href="#">About Us</a>
	        </li>
	      </ul>
	    </div>
	    <div class="ms-auto ms-3">
	    	<button class="btn btn-success">Sign Up</button>
	    </div>
	  </div>
	</nav>


</html>
