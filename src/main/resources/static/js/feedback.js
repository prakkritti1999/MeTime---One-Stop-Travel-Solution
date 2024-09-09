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
       
       	var review = $('#reviewSection').val();
       	var ratings = selectedRating;
       	var csrf_token = document.querySelector('meta[name="_csrf"]').getAttribute("content");
		var headers =  document.querySelector('meta[name="_csrf_header"]').getAttribute('content');

        $.ajax({
        
        	url: "/MeTime/feedback",
        	type: 'POST',
        	contentType: 'application/x-www-form-urlencoded',
        	data: {
        		review: review,
        		ratings: ratings
        	}, 
        	headers:{
				[headers] : csrf_token
			},
        	success: function(response){
				Swal.fire({
				    title: 'Thanks for your valuable feedback !!!',
				    fontWeight: 'bold',
				    imageUrl: '/images/smiley.jpeg', // URL of your custom icon
				    imageWidth: 150,
				    imageHeight: 150,
				    imageAlt: 'Custom image',
				    showConfirmButton: false
				});
			},
			error: function(xhr, error, status){
				console.log($.headers)
			}
        	
        });
        
        
        
        
    });
});

