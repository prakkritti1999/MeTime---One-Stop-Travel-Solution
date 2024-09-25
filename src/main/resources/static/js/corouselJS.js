document.addEventListener('DOMContentLoaded', function () {
    var feedbackCarousel = document.querySelector('#feedbackCarousel');
  
    var bsCarousel = new bootstrap.Carousel(feedbackCarousel, {
        interval: 5000,
        wrap: true
    });

    // Ensure each item has exactly 3 reviews per slide
    

	let items = document.querySelectorAll('.carousel .carousel-item')
	
			items.forEach((el) => {
				const minPerSlide = 2
				let next = el.nextElementSibling
				for (var i=1; i<minPerSlide; i++) {
					if (!next) {
	            // wrap carousel by using first child
	            next = items[0]
	        }
	        let cloneChild = next.cloneNode(true)
	        el.appendChild(cloneChild.children[0])
	        next = next.nextElementSibling
	    }
	})
});
