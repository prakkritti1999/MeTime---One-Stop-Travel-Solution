<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/footerCss.css">
</head>
<body>
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-12">
                <h5>About Us</h5>
                <p>MeTime is your trusted travel partner, providing the best tours and travel packages since 2024.</p>
            </div>
            <div class="col-md-3 col-sm-12 text-center">
                <h5>Follow Us</h5>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="col-md-3 col-sm-12">
			    <h5>Write a Review</h5>
			    <div class="review-section">
			        <div class="rating">
			            <!-- Star Rating -->
			            <span class="star-rating">
			                <i class="fas fa-star" data-value="1"></i>
			                <i class="fas fa-star" data-value="2"></i>
			                <i class="fas fa-star" data-value="3"></i>
			                <i class="fas fa-star" data-value="4"></i>
			                <i class="fas fa-star" data-value="5"></i>
			            </span>
			        </div>
			        <textarea rows="3" placeholder="Share your experience..." id="reviewSection"></textarea>
			        <button type="button" id="submitReviewBtn">Submit Review</button>
			    </div>
			</div>
            <div class="col-md-3 col-sm-12">
                <h5>Our Branches</h5>
                    <ul>
                    	<li>Delhi</li>
                    	<li>Chandigrah</li>
                    	<li>Mumbai</li>
                    </ul>
            </div>
        </div>
        <div class="footer-bottom mt-4">
            <p>&copy; 2024 MeTime. All Rights Reserved.</p>
            <marquee behavior="alternate" scrollamount="10">Unauthorized use of images and information is punishable offence</marquee>
        </div>
    </div>
</footer>

<script type="text/javascript" src="/js/feedback.js"></script>

</body>
</html>
