<%@page import="java.security.Principal"%>
<%@page import="org.springframework.security.core.GrantedAuthority"%>
<%@page import="com.metime.config.SecurityConfig"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="headers.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="/css/common.css">

	<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Great+Vibes&family=Montserrat:wght@900&display=swap');

		/* Navbar styles */
		.navbar {
		    background-color: #001861;
		    padding: 0.5rem 1rem;
		}
		
		.navbar-brand {
		    display: flex;
		    align-items: center;
		    font-family: 'Great Vibes', cursive;
		    font-size: 36px;
		    font-weight: bold;
		    color: #f39c12;
		    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
		    letter-spacing: 2px;
		    transition: transform 0.3s ease, text-shadow 0.3s ease;
		}
		
		.navbar-brand:hover {
		    color: white;
		    transform: scale(1.1);
		    text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.4);
		}
		
		.navbar-brand img {
		    width: 60px;
		    height: 60px;
		    margin-left: 10px;
		}
		
		/* General styles for the nav links */
		.navbar-nav .nav-link {
		    color: white;
		    font-size: 18px;
		    padding-left: 20px;
		    position: relative;
		    transition: color 0.3s ease;
		}
		
		/* Active link styles with a gradient underline */
		.navbar-nav .nav-link.active {
		    color: #FFD700;
		}
		
		.navbar-nav .nav-link.active::after, 
		.navbar-nav .nav-link:hover::after {
		    content: '';
		    position: absolute;
		    left: 0;
		    bottom: -5px;
		    width: 100%;
		    height: 3px;
		    background: linear-gradient(90deg, #f39c12, #FFD700);
		    border-radius: 2px;
		    transition: width 0.3s ease;
		}
		
		/* Toggler button and icon */
		.navbar-toggler {
		    border-color: rgba(255, 255, 255, 0.1);
		}
		
		.ms-auto {
		    margin-left: auto;
		}
		
		/* Dropdown styles */
		/* .dropdown-menu {
		    background-color: #001861;
		    color: white;
		} */
		
		.dropdown-item {
		    color: white;
		}
		
		.dropdown-item:hover {
		    background-color: #f39c12;
		    color: #001861;
		}
		

	</style>
</head>

<%
	/* String username = SecurityConfig.getCurrentUsername(request.getUserPrincipal()); */
	String username = SecurityConfig.getCurrentUsername();
	Collection<? extends GrantedAuthority> roles = SecurityConfig.getCurrentUserRoles();
%>

<body>
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">
				<span>ME TIME is HERE</span>
				<img alt="logo" src="/images/logo.png">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"><i class="fa fa-bars" aria-hidden="true" style="color: white;"></i></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<a class="nav-link" aria-current="page" href="/MeTime/home">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="addForm">Add New Trip</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="aboutUS">About Us</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="contactUS"><i class="fa fa-phone"></i></a>
					</li>
				</ul>
				<div class="ms-auto d-flex align-items-center">
					<!-- User Dropdown -->
					<div class="dropdown me-2">
						<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu"
							data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fa-solid fa-user"></i>
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenu">
							<p class="dropdown-item"><%= username %></p>
							<p class="dropdown-item"><%= roles %></p>
							<a class="dropdown-item" href="/logout" data-bs-toggle='tooltip' data-bs-placement='top'
								title='Logout'>
								<i class="fa fa-sign-out" aria-hidden="true"></i>
							</a>
						</div>
					</div>
					<a href="register"><button class="btn btn-success">Sign Up</button></a>
				</div>
			</div>
		</div>
	</nav>

</body>

</html>
