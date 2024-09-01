<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Footer</title>
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
			        <textarea rows="3" placeholder="Share your experience..."></textarea>
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
        </div>
    </div>
</footer>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    const stars = document.querySelectorAll('.star-rating i');
    let selectedRating = 0;

    stars.forEach((star, index) => {
        star.addEventListener('mouseover', function() {
            highlightStars(index);
        });

        star.addEventListener('mouseout', function() {
            highlightStars(selectedRating - 1);
        });

        star.addEventListener('click', function() {
            selectedRating = index + 1;
            highlightStars(index);
        });
    });

    function highlightStars(index) {
        resetStars();
        for (let i = 0; i <= index; i++) {
            stars[i].classList.add('selected');
        }
    }

    function resetStars() {
        stars.forEach(star => {
            star.classList.remove('selected');
        });
    }

    // Prevent stars from resetting when form is submitted
    const submitButton = document.getElementById('submitReviewBtn');
    submitButton.addEventListener('click', function() {
        alert("You rated " +selectedRating+ " stars!"); // Example action
    });
});


</script>

</body>
</html>
