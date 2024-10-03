<style>
	/* Accordion Container */
	.accordion {
	  background-color: #f9f9f9;
	  border: 1px solid #e2e2e2;
	  border-radius: 8px;
	  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	  margin: 20px;
	}
	
	/* Accordion Header */
	.accordion-button {
	  background-color: #ffffff;
	  color: #333;
	  font-size: 1.1rem;
	  font-weight: bold;
	  border: none;
	  padding: 15px 20px;
	  border-bottom: 1px solid #ddd;
	  border-radius: 5px;
	  transition: background-color 0.3s ease, color 0.3s ease;
	}
	
	.accordion-button:focus {
	  box-shadow: none;
	}
	
	.accordion-button:hover {
	  background-color: #f0f0f0;
	  color: #007bff;
	}
	
	/* Collapsed Button Style */
	.accordion-button.collapsed {
	  background-color: #ffffff;
	  color: #555;
	}
	
	.accordion-button:not(.collapsed)::after {
	  font-size: 1.2rem;
	  color: #007bff;
	}
	
	.accordion-button.collapsed::after {
	  font-size: 1.2rem;
	  color: #555;
	}
	
	/* Accordion Body */
	.accordion-body {
	  padding: 20px;
	  font-size: 1rem;
	  color: #666;
	  background-color: #fafafa;
	  border-top: 1px solid #ddd;
	}
	
	.accordion-item {
	  margin-bottom: 10px;
	  border-radius: 5px;
	  overflow: hidden;
	  background-color: #fff;
	}
	
	/* Header Text Styling */
	.accordion h2 {
	  font-size: 1.25rem;
	}
	
	/* Accordion Title */
	.accordion > div:first-child {
	  font-size: 1.5rem;
	  font-weight: bold;
	  text-align: center;
	  padding: 15px 0;
	  color: #007bff;
	}
	
	/* Smooth Transitions */
	.accordion-collapse {
	  transition: max-height 0.3s ease;
	}
	
	.accordion-body p {
	  margin-bottom: 0;
	}
	
	/* Accordion Border */
	.accordion-item {
	  border: none;
	}
</style>

<div class="accordion accordion-flush" id="accordionFAQS">
  <div>FREQUENTLY ASKED QUESTIONS (FAQS)</div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        What types of tours does MeTime offer?
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">MeTime offers a variety of tours including adventure trips, cultural tours, family vacations, romantic getaways, and customized itineraries to suit your preferences.</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        How can I book a tour with MeTime?
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">You can book a tour through our website by selecting your desired package and following the booking instructions. Alternatively, you can contact our customer service team for assistance.</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        What is included in the tour packages?
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">Our tour packages typically include accommodation, transportation, guided tours, and some meals. Specific inclusions vary by package, so please check the details of each tour.</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
        Can I customize my tour package?
      </button>
    </h2>
    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">Yes, MeTime offers customizable tour packages. You can tailor your itinerary to include specific destinations, activities, and accommodations that suit your preferences.</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingFive">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
        What is your cancellation policy?
      </button>
    </h2>
    <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">Our cancellation policy varies depending on the tour package. Generally, cancellations made more than 30 days before the departure date are eligible for a full refund. Please refer to the specific terms and conditions of your booking for more details.</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingSeven">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">
        How do I know if a tour is suitable for my family?
      </button>
    </h2>
    <div id="flush-collapseSeven" class="accordion-collapse collapse" aria-labelledby="flush-headingSeven" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">Each tour package includes detailed information about the activities and accommodations. If you have specific requirements or concerns, our customer service team can help you choose a tour that is suitable for your family.</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingEight">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEight" aria-expanded="false" aria-controls="flush-collapseEight">
        What payment methods do you accept?
      </button>
    </h2>
    <div id="flush-collapseEight" class="accordion-collapse collapse" aria-labelledby="flush-headingEight" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">We accept various payment methods including credit/debit cards, bank transfers, and online payment platforms like Razorpay.</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingNine">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseNine" aria-expanded="false" aria-controls="flush-collapseNine">
        Are there any discounts available?
      </button>
    </h2>
    <div id="flush-collapseNine" class="accordion-collapse collapse" aria-labelledby="flush-headingNine" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">Yes, we offer seasonal discounts, early bird specials, and group booking discounts. Check our website or contact our customer service team for current promotions.</div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTen">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTen" aria-expanded="false" aria-controls="flush-collapseTen">
        How can I contact MeTime for more information?
      </button>
    </h2>
    <div id="flush-collapseTen" class="accordion-collapse collapse" aria-labelledby="flush-headingTen" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">You can reach us via email at info@metime.com, call our customer service hotline, or use the live chat feature on our website.</div>
    </div>
  </div>
</div>