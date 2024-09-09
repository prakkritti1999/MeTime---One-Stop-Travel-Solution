document.addEventListener('DOMContentLoaded', function () {
    var feedbackCarousel = document.querySelector('#feedbackCarousel');
  
    var bsCarousel = new bootstrap.Carousel(feedbackCarousel, {
        interval: 5000,
        wrap: true
    });

    // Ensure each item has exactly 3 reviews per slide
    var items = document.querySelectorAll('.carousel .carousel-item');

    items.forEach((el) => {
        const minPerSlide = 2;
        let childrenCount = el.children.length;

        // Remove any extra reviews beyond 3 in a single slide
        while (childrenCount > minPerSlide) {
            el.removeChild(el.lastElementChild);
            childrenCount--;
        }

        // If fewer than 3 reviews, leave as is (no cloning or extra logic)
    });
});
