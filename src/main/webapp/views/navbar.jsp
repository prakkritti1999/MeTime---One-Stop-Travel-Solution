<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<jsp:include page="headers.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="/css/common.css">

	<style type="text/css">
		.navbar-brand {
			font-size: 24px;
			color: blue;
		}

		.navbar-brand:hover {
			color: white;
		}

		.navbar-nav .nav-link {
			color: white;
			font-size: 18px;
		}

		.nav-link:active {
			color: #FFD700;
			/* Gold color */
			text-decoration: underline;
		}

		/* .navbar-nav .nav-link.active {
        color: #FFD700; /* Highlight active link with a gold color */
		font-weight: bold;
		/* Make it bold for better visibility */
		border-bottom: 2px solid #FFD700;
		/* Optional: Add a border underline */
		}

		*/
	</style>
</head>

<body>

	<nav class="navbar navbar-expand-lg" style="background-color: #001861;">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">ME TIME is HERE</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<a class="nav-link" aria-current="page" href="/MeTime/home">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="addForm">Add New Trip</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="aboutUS">About Us</a>
					</li>
					<li class="nav-item" style="margin-left: 10px;">
						<a class="nav-link active" href="#"><i class="fa fa-phone"></i></a>
					</li>
				</ul>
				<div class="ms-auto d-flex align-items-center">
					<!-- Dropdown just to the left of Sign Up -->
					<div class="dropdown me-2">
						<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2"
							data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fa-solid fa-user"></i>
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
							<p class="dropdown-item">User name</p>
							<p class="dropdown-item" type="button">ROLE</p>
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